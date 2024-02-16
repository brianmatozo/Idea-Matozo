DELIMITER //

CREATE PROCEDURE PlaceCartWithPromotion(
    IN p_customer_id INT,
    IN p_total_amount DECIMAL(10, 2),
    IN p_payment_method_id INT
)
BEGIN
    DECLARE promotionID INT;

    -- revisar si las promociones cumplen las siguientes condiciones
    SELECT promotion_id INTO promotionID
    FROM promotions
    WHERE start_date <= CURRENT_DATE
      AND end_date >= CURRENT_DATE
      AND min_purchase_amount <= p_total_amount
      AND Active = TRUE
    LIMIT 1;

    -- si las condiciones lo permiten el id de la promocion se auto inserta en la orden del cliente
    INSERT INTO customer_cart (customer_id, total_amount, payment_method_id, promotion_id)
    VALUES (p_customer_id, p_total_amount, p_payment_method_id, promotionID);
END //


-- los siguientes dos Triggers son para calcular el subtotal de los item seleccionados

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


CREATE TRIGGER CalculateCartItemSubtotal
BEFORE INSERT ON customer_cartitems
FOR EACH ROW
BEGIN
    SET NEW.subtotal = (
        SELECT p.price * NEW.quantity
        FROM products p
        WHERE p.product_id = NEW.product_id
    );
END //

-- los siguientes dos triggers suman los subtotal para las ordenes y los carts

CREATE TRIGGER UpdateOrderTotalAmount
AFTER INSERT ON orderitems
FOR EACH ROW
BEGIN
    DECLARE order_total DECIMAL(10, 2);

    SELECT SUM(subtotal) INTO order_total
    FROM orderitems
    WHERE order_id = NEW.order_id;

    UPDATE orders
    SET total_amount = order_total
    WHERE order_id = NEW.order_id;
END //


CREATE TRIGGER UpdateCartTotalAmount
AFTER INSERT ON customer_cartitems
FOR EACH ROW
BEGIN
    DECLARE order_total DECIMAL(10, 2);

    SELECT SUM(subtotal) INTO order_total
    FROM customer_cartitems
    WHERE cart_id = NEW.cart_id;

    UPDATE customer_cart
    SET total_amount = order_total
    WHERE cart_id = NEW.cart_id;
END //

DELIMITER ;