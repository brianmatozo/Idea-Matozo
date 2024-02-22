DELIMITER //
CREATE PROCEDURE SearchProducts(
	IN p_keyword VARCHAR(255)
)
BEGIN
    SELECT * FROM products
    WHERE product_name LIKE CONCAT('%', p_keyword, '%');
END //
DELIMITER ;

-- Procedure para insertar promociones validas en las ordenes de los clientes
DELIMITER //
CREATE PROCEDURE AutoPromotion(
    IN p_cart_id INT,
    IN p_payment_method_id INT
)
BEGIN
    DECLARE promotionID INT;
	DECLARE totalAmount DECIMAL(10, 2);

    -- calcular el monto total segun el subtotal
    -- usando el cart_id
    SELECT SUM(subtotal) INTO totalAmount
    FROM customer_cartitems
    WHERE cart_id = p_cart_id;

    -- condicionales para la promocion
    SELECT promotion_id INTO promotionID
    FROM promotions
    WHERE start_date <= CURRENT_DATE
      AND end_date >= CURRENT_DATE
      AND min_purchase_amount <= totalAmount
      AND active = TRUE
    LIMIT 1;

    -- si los condicionales encuentran una promo valida se inserta su promotion_id a la orden(lado cliente)
    IF promotionID IS NOT NULL THEN
        UPDATE customer_cart
        SET promotion_id = promotionID
        WHERE cart_id = p_cart_id;
    END IF;
    
END //
DELIMITER ;

-- Antes del detalle de la orden(lado usuario)
-- se calcula el subtotal usando el precio y la cantida de items
DELIMITER //
CREATE TRIGGER CalculateOrderItemSubtotal
BEFORE INSERT ON orderitems
FOR EACH ROW
BEGIN
    SET NEW.subtotal = (
        SELECT p.price * NEW.quantity
        FROM products p
        WHERE p.product_id = NEW.product_id
    );
END //
DELIMITER ;

-- Luego de los detalles de la orden(lado usuario)
-- se calcula el monto total de la orden con la suma de los subtotales con la misma orden_id
DELIMITER //
CREATE TRIGGER UpdateOrderTotalAmount
AFTER INSERT ON orderitems
FOR EACH ROW
BEGIN
    UPDATE orders
    SET total_amount = (
        SELECT SUM(subtotal)
        FROM orderitems
        WHERE order_id = NEW.order_id
    )
    WHERE order_id = NEW.order_id;
END //
DELIMITER ;

-- Antes del detalle de la orden(lado cliente)
-- se calcula el subtotal usando el precio y la cantida de items
DELIMITER //
CREATE TRIGGER CalculateCartItemSubtotal
BEFORE INSERT ON customer_cartitems
FOR EACH ROW
BEGIN
    SET NEW.subtotal = (
        SELECT p.price * NEW.quantity
        FROM products p
        WHERE p.product_id = NEW.product_id
	LIMIT 1
    );
END //
DELIMITER ;

-- Luego de los detalles de la orden(lado cliente)
-- se calcula el monto total de la orden con la suma de los subtotales con la misma orden_id
DELIMITER //
CREATE TRIGGER UpdateCartTotalAmount
AFTER INSERT ON customer_cartitems
FOR EACH ROW
BEGIN
    UPDATE customer_cart
    SET total_amount = (
        SELECT SUM(subtotal)
        FROM customer_cartitems
        WHERE cart_id = NEW.cart_id
    )
    WHERE cart_id = NEW.cart_id;
END //
DELIMITER ;

-- trigger para llamar el AutoPromotion
-- si llamo la procedure en los anteriores triggers, se rompe la insercion de datos
DELIMITER //
CREATE TRIGGER AfterInsertCIStored
AFTER INSERT ON customer_cartitems
FOR EACH ROW
BEGIN
    DECLARE cartID INT;
    DECLARE paymentMethodID INT;

	-- obtener el customer id y el metodo de pago para poder llamar la procedure
    SELECT cart_id, payment_method_id INTO cartID, paymentMethodID
    FROM customer_cart
    WHERE cart_id = NEW.cart_id
    LIMIT 1;

    -- llamar la procedure con los datos anteriormente obtenidos
    CALL AutoPromotion(cartID, paymentMethodID);
END //
DELIMITER ;

-- substraer el stock cuando el cliente realiza una orden (simple)
DELIMITER //
CREATE TRIGGER SubtractFromStock
AFTER INSERT ON customer_cartitems
FOR EACH ROW
BEGIN
    DECLARE currentStock INT;
    DECLARE newStock INT;

    -- obtener el stock
    SELECT stock_quantity INTO currentStock
    FROM products
    WHERE product_id = NEW.product_id;

    -- restar el stock con la cantida de la orden (cliente)
    SET newStock = currentStock - NEW.quantity;

    -- actualizar el stock de productos
    UPDATE products
    SET stock_quantity = newStock
    WHERE product_id = NEW.product_id;
END //
DELIMITER ;

-- sumar stock cuando (usuario) se hace un pedido
-- solo cuando el pedido esta recibido ('Delivered')
DELIMITER //
CREATE TRIGGER SumStockFromOrder
AFTER INSERT ON orderitems
FOR EACH ROW
BEGIN
    DECLARE currentStock INT;
    DECLARE newStock INT;

    -- Solamente se obtiene el stock cuando el pedido es 'Delivered'
    -- si no se obtiene el stock, la procedure no puede continuar
    SELECT p.stock_quantity INTO currentStock
    FROM products p
    JOIN orders o ON p.product_id = NEW.product_id
    WHERE o.order_id = NEW.order_id
      AND o.status = 'Delivered';

    -- condicional para evitar problemas
    IF currentStock IS NOT NULL THEN
		-- sumar stock si el condicional acepta
        SET newStock = currentStock + NEW.quantity;

		-- actualizar stock si el condicional acepta
		UPDATE products
		SET stock_quantity = newStock
		WHERE product_id = NEW.product_id;
	END IF;
END //
DELIMITER ;

-- trigger para calcular el monto total luego de una eliminacion
DELIMITER //
CREATE TRIGGER UpdateCartTotalAmountAfterDelete
AFTER DELETE ON customer_cartitems
FOR EACH ROW
BEGIN
    DECLARE cart_total DECIMAL(10, 2);

    -- nuevo monto total
    SELECT SUM(subtotal) INTO cart_total
    FROM customer_cartitems
    WHERE cart_id = OLD.cart_id;

    -- actualizar el carrito(orden cliente) con el nuevo total
    UPDATE customer_cart
    SET total_amount = cart_total
    WHERE cart_id = OLD.cart_id;
END //
DELIMITER ;



-- esta es una vista que sirve el mismo proposito que el AutoPromotion
-- antes de poder arreglar el procedure utilize esta vista para guiarme
CREATE VIEW cart_view AS
SELECT
    c.cart_id,
    c.customer_id,
    SUM(ci.subtotal) AS total_amount,
    p.promotion_id
FROM
    customer_cart c
    JOIN customer_cartitems ci ON c.cart_id = ci.cart_id
    LEFT JOIN promotions p ON (
        c.total_amount + ci.subtotal >= p.min_purchase_amount
        AND CURRENT_DATE BETWEEN p.start_date AND p.end_date
        AND p.active = TRUE
    )
GROUP BY c.cart_id, c.customer_id, p.promotion_id;