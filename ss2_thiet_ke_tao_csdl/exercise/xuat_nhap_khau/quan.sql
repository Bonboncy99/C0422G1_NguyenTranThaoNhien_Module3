drop database if exists quan_ly_ban_hang_1;
create database quan_ly_ban_hang_1;
use quan_ly_ban_hang_1;

create table customer(
customer_id int primary key auto_increment,
customer_name varchar(50),
customer_age int 
);

create table `order`(
order_id int primary key auto_increment,
customer_id int not null,
order_date date,
order_total_price double,
foreign key(customer_id) references customer(customer_id)
);

create table product(
product_id int primary key auto_increment,
product_name varchar(45),
product_price double
);

create table order_detail(
product_id int not null,
order_id int not null,
quantity int,
primary key(product_id,order_id),
foreign key (product_id) references product(product_id),
foreign key (order_id) references `order`(order_id)
);