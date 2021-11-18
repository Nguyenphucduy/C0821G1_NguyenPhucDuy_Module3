-- index
create unique index index_product_code
on products(product_code);

create unique index index_composite
on products(product_name,product_price);

EXPLAIN SELECT product_code
 FROM products 
 where product_code = 1; 
 EXPLAIN SELECT product_name,product_price
 FROM products 
 where product_name = 'Điện Thoại'; 
-- trước truy vấn từng record đến khi thỏa mãn condition
-- chỉ truy vấn record theo condition đã xếp theo index

-- view 
create view view_demo
as 
select product_code, product_name, product_price, product_status
from products;

ALTER VIEW view_demo
AS
    select product_code, product_name, product_price
from products;

DROP VIEW view_demo;

-- procedure
delimiter //
create procedure procedure_demo()
begin
	select *
    from products;
end;
// delimiter ;
call procedure_demo();
delimiter //
create procedure procedure_insert()
begin
	insert into products
values
(9,9,'Điều Hòa',1000,1,'Toshiba',true);
end;
// delimiter ;
call procedure_insert();

delimiter //
create procedure procedure_update(id_fix int)
begin
	UPDATE products
    SET id = 10
    WHERE id = id_fix;
  
end;
// delimiter ;
drop procedure procedure_update;
​
call procedure_update(1);

delimiter //
create procedure procedure_delete(id_fix int)
begin
	DELETE FROM products
    WHERE id = id_fix;
  
end;
// delimiter ;
​
call procedure_delete(2);


