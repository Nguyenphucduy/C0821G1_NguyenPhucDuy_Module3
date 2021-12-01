drop database if exists product_management;
CREATE DATABASE product_management;
USE product_management;

create table product (
 id  int(3) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 `name` varchar(120) NOT NULL,
 price double NOT NULL,
 `description` varchar(120),
 producer varchar(120)
);

insert into product(`name`, price, `description`,producer)
 values
 ("Galaxy 1", 10, "Galaxy 1","Sam Sung"),
("IPhone X", 20, "IPhone X","Apple"),
("Phone", 30, "Phone","Sony"),
("1280", 40, "1280","Nokia"),
("Iphone 11", 50, "Iphone 11","Apple"),
("Galaxy 2", 60, "Galaxy 2","Sam Sung");

select id,`name`,price,`description`,producer
from product;

insert into product(`name`, price, `description`,producer)
 values("Galaxy 3", 60, "Galaxy 2","Sam Sung");
 
 DELETE FROM product
WHERE id = 1;

update product set name = 11,price= 11, description = 11,producer = 11
where id = 4;

select *users
 from product
 where id = 4;