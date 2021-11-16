use quan_ly_ban_hang;

-- insert customer
INSERT INTO customer 
VALUES 
(1, "Minh Quan" ,10),
(2, "Ngoc Oanh" ,20),
(3, "Hong Ha" ,50)
;

-- insert order 
INSERT INTO `order`
VALUES 
(1,1,'2006-03-21',null),
(2,2,'2006-03-23',null),
(3,3,'2006-03-16',null)
;

-- insert product 

INSERT INTO product
VALUES 
(1,"May Giat",3),
(2,"Tu Lanh",5),
(3,"Dieu Hoa",7),
(4,"Quat",1),
(5,"Bep Dien",2)
;

-- insert OrderDetail

INSERT INTO order_detail
VALUES 
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3)
;
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order

select o_id,o_date,o_total_price
from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách

select  c.c_name, p.p_name
from customer c
inner join product p on c.c_id = p.p_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
-- chưa làm được

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
--  Giá bán của từng loại được tính = odQTY*pPrice)
select o_id,o_date,o_total_price
from `order`;
-- chưa làm được
