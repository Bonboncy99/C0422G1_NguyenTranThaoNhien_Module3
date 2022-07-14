drop database if exists quan_ly_ban_hang;
create database quan_ly_ban_hang;
use quan_ly_ban_hang;

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    customer_age INT
);

CREATE TABLE `order` (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME,
    order_total_price DOUBLE,
    FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id)
);

CREATE TABLE producecustomercustomer (
    produce_id INT PRIMARY KEY,
    produce_name VARCHAR(50),
    produce_price DOUBLE
);

CREATE TABLE order_detail (
    produce_id INT,
    order_id INT,
    PRIMARY KEY (produce_id , order_id),
    FOREIGN KEY (produce_id)
        REFERENCES produce (produce_id),
    FOREIGN KEY (order_id)
        REFERENCES `order` (order_id)
);