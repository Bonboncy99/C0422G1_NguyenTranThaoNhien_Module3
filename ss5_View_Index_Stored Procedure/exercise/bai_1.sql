drop database if exists Products;
create database Products;
use Products;

create table products (
    id int primary key auto_increment,
    product_code int,
    product_name varchar(50),
    product_price double,
    product_amount int,
    product_description varchar(100),
    product_status bit
);

insert into products (product_code,product_name,product_price,product_amount,product_description,product_status)
value (11,'Banh',10,2,'Banh de an', 1),
(12,'Keo',20,5,'Keo de an', 0),
(13,'Mi',30,7,'Mi de an', 1),
(14,'Sua',40,4,'Sua de uong', 0),
(15,'Gao',50,6,'Gao de an', 1);
    
    
-- Bước 3. Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
	create unique index i_code on products(product_code);
	create  index i_composite_product on products(product_name,product_code);
    
	 drop index i_code on products;
     drop index i_composite_product on products;

    explain select * from products 
    where products.product_code = 14;
	explain select * from products 
    where products.product_name = 'sua' and products.product_price = 40;
    
    
-- Bước 4: Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
-- Tiến hành sửa đổi view
-- Tiến hành xoá view
create view product_view as
select product_code,product_name,product_price,product_status
from products;

select * from product_view;

create or replace view product_view as
select product_code,product_name,product_price,product_status 
from products
where product_name = 'Sua';

drop view product_view;


-- Bước 5
-- 1. Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
	create procedure find_all_products()
    begin
		select * from products;
    end//
    delimiter ;

call find_all_products();


-- 2. Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_new_produce(new_product_code int, new_product_name varchar(50),new_product_price double,new_product_amount int,new_product_description varchar(100),new_product_status bit)
begin 
	insert into products (product_code,product_name,product_price,product_amount,product_description,product_status) 
value (new_product_code, new_product_name,new_product_price,new_product_amount,new_product_description,new_product_status);
end //
delimiter ;

call add_new_produce(16,'Thuoc',20.5,20,'Thuoc ha sot',1);


-- 3. Tạo store procedure sửa thông tin sản phẩm theo id
delimiter update_products//
create procedure update_products (id_find int, new_product_code int, new_product_name varchar(50),new_product_price double,new_product_amount int,new_product_description varchar(100),new_product_status bit)
begin
	update products
	set product_code=new_product_code, product_name = new_product_name, product_price=new_product_price,product_amount= new_product_amount, product_description= new_product_description,product_status = new_product_status
	where id = id_find;
end //
delimiter ;

call update_products(3,161,'Thuoc1',20.5,20,'Thuoc ha sot1',1);


-- 4. Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_by_id(id_delete int) 
begin 
	delete  from products
	where id = id_delete;
end //
delimiter ;

call delete_by_id(5);