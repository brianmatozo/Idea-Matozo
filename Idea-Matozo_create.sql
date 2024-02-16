drop schema idea_matozo;
create schema idea_matozo;
use idea_matozo;


-- 1 - user
-- 2 - user details
-- 3 - category
-- 4 - products
-- 5 - payment methods
-- 6 - orders
-- 7 - orderitems
-- 8 - promotions
-- 9 - customers
-- 10 - customers cart
-- 11 - cart items
-- 12 - review



-- tabla usuarios --
CREATE TABLE user (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL
);
-- separacion de la tabla user

-- tabla detalles del usuario --
CREATE TABLE user_details (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    address VARCHAR(50),
    phone_number VARCHAR(15),
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

/* tabla de categorias
diferentes productos (product_id) pueden ser asignados la misma categoria (category_id)*/

create table category(
		category_id int primary key auto_increment,
        category_name varchar(50) not null
);

/*-- tabla productos --
cada producto tiene una categoria *VER CATEGORY TABLE* */

create table products(
		product_id int primary key auto_increment,
        product_name varchar(50) not null,
        description text,
        price decimal(10,2) not null,
        stock_quantity int not null,
        category_id int,
        foreign key (category_id) references category(category_id)
);

-- tabla metodos de pago
CREATE TABLE payment_methods (
    payment_method_id INT PRIMARY KEY AUTO_INCREMENT,
    method_name VARCHAR(50) NOT NULL
);

/*-- tabla de ordenes --
-- el user_id es una referencia a la tabla de users --
-- user_id representa quien realizo la orden, solo 1 user_id por order_id, pero varias order_id pueden ser realizadas por el mismo user_id--*/
create table orders(
		order_id int primary key auto_increment,
        user_id int,
        order_date timestamp default current_timestamp,
        total_amount decimal(10,2) not null,
        payment_method_id INT,
        FOREIGN KEY (payment_method_id) REFERENCES payment_methods(payment_method_id),
        status ENUM('Pending', 'Shipped', 'Delivered') DEFAULT 'Pending',
		foreign key (user_id) references user(user_id),
		check (status in ('Pending', 'Shipped', 'Delivered'))
);

/*-- tabla de los items de la order --
-- varios items (product_id, order_item_id) pueden pertenecer a una sola orden (order_id) --*/
create table orderitems(
		order_item_id int primary key auto_increment,
        order_id int not null,
        foreign key (order_id) references orders(order_id),
        product_id int not null,
        foreign key (product_id) references products(product_id),
        quantity int,
        subtotal decimal(10,2)
);

/*tabla de promociones
las promociones tienen un storedprocedure para chequear sus condiciones y insertarlas en las ordenes si las cumplen*/
CREATE TABLE promotions (
    promotion_id INT PRIMARY KEY AUTO_INCREMENT,
    promotion_name VARCHAR(50) NOT NULL,
    description TEXT,
    discount_type ENUM('Percentage', 'FixedAmount') NOT NULL,
    discount_value DECIMAL(5, 2) NOT NULL,
    min_purchase_amount DECIMAL(20, 2),
    start_date DATE,
    end_date DATE,
    active BOOLEAN DEFAULT TRUE
);

/*tabla de clientes*/
CREATE TABLE customers (
		customer_id INT PRIMARY KEY AUTO_INCREMENT,
		firstname VARCHAR(50) NOT NULL,
		lastname VARCHAR(50) NOT NULL,
		email VARCHAR(255) NOT NULL,
		phone_number VARCHAR(15),
		address VARCHAR(255)
);

/*tabla del carrito del cliente
fuciona igual que la tabla de orders*/
CREATE TABLE customer_cart (
		cart_id INT PRIMARY KEY AUTO_INCREMENT,
		customer_id INT,
		order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		total_amount DECIMAL(10, 2),
		status ENUM('Pending', 'Shipped', 'Delivered') DEFAULT 'Pending',
		shipping_address VARCHAR(255),
		payment_method_id INT,
        promotion_id INT,
		FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
		FOREIGN KEY (payment_method_id) REFERENCES payment_methods(payment_method_id),
        FOREIGN KEY (promotion_id) REFERENCES promotions(promotion_id)
);

/*tabla de los items del carrito(cliente)
funciona igual que la tabla orderitems*/
create table customer_cartitems(
		cart_item_id int primary key auto_increment,
        cart_id int,
        foreign key (cart_id) references customer_cart(cart_id),
        product_id int,
        foreign key (product_id) references products(product_id),
        quantity int,
        subtotal decimal(10,2)
);

/*tabla de reviews
hace referencia a ciertos productos y tiene rating 0/10*/
CREATE TABLE review (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    customer_id INT NOT NULL,
    rating INT CHECK (Rating >= 0 AND Rating <= 10),
    comment TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


-- importacion a lucidchart --

 -- SELECT 'mysql' dbms,t.TABLE_SCHEMA,t.TABLE_NAME,c.COLUMN_NAME,c.ORDINAL_POSITION,c.DATA_TYPE,c.CHARACTER_MAXIMUM_LENGTH,n.CONSTRAINT_TYPE,k.REFERENCED_TABLE_SCHEMA,k.REFERENCED_TABLE_NAME,k.REFERENCED_COLUMN_NAME FROM INFORMATION_SCHEMA.TABLES t LEFT JOIN INFORMATION_SCHEMA.COLUMNS c ON t.TABLE_SCHEMA=c.TABLE_SCHEMA AND t.TABLE_NAME=c.TABLE_NAME LEFT JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE k ON c.TABLE_SCHEMA=k.TABLE_SCHEMA AND c.TABLE_NAME=k.TABLE_NAME AND c.COLUMN_NAME=k.COLUMN_NAME LEFT JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS n ON k.CONSTRAINT_SCHEMA=n.CONSTRAINT_SCHEMA AND k.CONSTRAINT_NAME=n.CONSTRAINT_NAME AND k.TABLE_SCHEMA=n.TABLE_SCHEMA AND k.TABLE_NAME=n.TABLE_NAME WHERE t.TABLE_TYPE='BASE TABLE' AND t.TABLE_SCHEMA NOT IN('INFORMATION_SCHEMA','mysql','performance_schema');

