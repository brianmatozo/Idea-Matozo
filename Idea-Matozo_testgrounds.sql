-- Simple procedure para buscar productos
-- Escribe dentro de '' para buscar en el catalogo de productos

call SearchProducts('Bread');



/*
  Desde el lado del cliente hay una procedure que modifica la bbdd
  La cual es AutoPromotion que automaticamente detecta
  los detalles de la orden del cliente y inserta el id de la promocion
  en su orden
  Luego hay 4 triggers que suman el subtotal, el totalneto, llaman procedures, restan y suman stock
  Primero se inserta la orden general sin detalles
  Segundo se insertan los detalles de la orden que son liberan triggers antes y despues de su insercion
  Antes para calcular el subtotal basado en el precio y la cantidad de los productos (1),
  Despues para calcular el total de la orden en general (2), llamar la procedure AutoPromotion (3)
  y finalmente restar el stock de productos (4).
  
  Una orden puede tener varios productos, por eso cuando sale la precaucion ID_ORDEN se refiere a que talvez
  querias añadir detalles a una orden nueva por lo tanto tenias que sumar el id_orden, o querias añadir
  items a una orden vieja por lo tanto hay que observar precisamente que id_orden vas a utilizar
  
  Las siguientes Inserciones de datos son para probar el funcionamiento de los triggers y procedures
*/

-- para generar una orden con multiples detalles realizar 1 y insertar 2 las veces necesarias
-- para realizar una sola orden con un solo detalles 1 y 2(cambiar id_orden)


-- 1 - Insercion de la orden en general
DELIMITER ;
insert into customer_cart (customer_id, status, shipping_address, payment_method_id) 
values (
		1, -- customer_id, usado para identificar a los clientes
        'Delivered', --  estado de la orden 'Shipped', 'Pending', 'Delivered'
        -- las ordenes del cliente RESTA STOCK sin importar el estado de la orden
        '11 Bashford Trail', -- direccion del envio
        1 -- identificador de metodo de pago
);

-- 2 - Insercion de los detalles de la orden (se debe insertar las dos cosas a la vez)
DELIMITER ;
insert into customer_cartitems (cart_id, product_id, quantity) 
values (
		1, -- ID_ORDEN PRESTAR ATENCION A QUE ORDEN SE REFIERE
        2, -- identificador de productos, de aqui se saca todos los detalles del producto
        1 -- identificador QUANTITY, se usa para calcular el stock del producto
);


-- 1 - insercion de ordenes del lado del usuario o empleado
DELIMITER ;
insert into orders (user_id, payment_method_id, status) 
values (
		1, -- id usuario
        1, -- metodo de pago
        'Delivered' -- estado de la entrega, del lado del usuario el SUMA STOCK solo sube si la entrega es Delivered
        -- 'Delivered', 'Shipped', 'Pending'
);

-- 2 - insercion del detalle de la orden
DELIMITER ;
insert into orderitems (order_id, product_id, quantity) 
values (
		1, -- ID_ORDEN PRESTAR ATENCION A QUE ORDEN SE REFIERE
        2, -- id producto
        900 -- cantidad de productos pedidos
);



-- vista que tiene el mismo funcionamiento que AutoPromotion
Select * from cart_view;


-- promocion siempre activa
INSERT INTO promotions (promotion_name,description,discount_type,discount_value,min_purchase_amount,start_date,end_date,active)
VALUES ('Promo Activa','Esta Promocion siempre esta activa','Percentage',10.00,0.00,'2000-01-01','2099-12-31',TRUE);