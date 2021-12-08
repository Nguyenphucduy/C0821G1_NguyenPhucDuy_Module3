use furama;
-- insert division
insert into division
values
(1,'Sale – Marketing'),
(2,'Hành Chính'),
(3,'Phục vụ'),
(4,'Quản lý');
-- insert position
insert into position
values
(1,'Lễ tân'),
(2,'phục vụ'),
(3,'chuyên viên'),
(4,'giám sát'),
(5,'quản lý'),
(6,' giám đốc');
-- insert education_degree
insert into education_degree
values
(1,'Cao đẳng'),
(2,'Đại học '),
(3,'Trung cấp'),
(4,'sau đại học');

-- insert username
insert into user
values
('DuyC0821G1','Duy1234'),
('AnhC0821G1','Anh1234'),
('BaoC0821G1','Bao1234'),
('VyC0821G1','Vy1234'),
('DuC0821G1','Du1234'),
('TamC0821G1','Tam1234');
-- insert into user
-- (user_name)
-- values
-- (?);

-- insert into user
-- values
-- (?,?);


-- insert employee
insert into employee
values 
('NV1234','Phuc Duy','1997/03/06',123456789,500,0335773636,'phucduy@gmail.com','quang ninh',1,1,1,'DuyC0821G1'),
('NV1235','Huu Du','1997/03/07',123456781,5000,0335773635,'HuuDu@gmail.com','quang nam',2,2,2,'DuC0821G1'),
('NV1236','Anh Tam','1997/03/08',123456782,200,0335773634,'AnhTam@gmail.com','quang nam',3,3,3,'TamC0821G1'),
('NV1237','Gia Bao','1997/03/09',123456783,300,0335773633,'GiaBao@gmail.com','da nang',4,4,4,'BaoC0821G1'),
('NV1238','Thao Vy','1997/03/10',123456784,4000,0335773632,'ThaoVy@gmail.com','da nang',1,1,1,'VyC0821G1'),
('NV1239','Nhat Anh','1997/03/11',123456785,55500,0335773631,'NgocDu@gmail.com','quang ninh',2,2,2,'AnhC0821G1');


-- insert into employee
-- values(?,?,?,?,?,?,?,?,?,?,?,?);

-- delete 
-- from employee 
-- where employee_id = ?

-- update employee
-- set employee_name = ?,employee_birthday = ? ,employee_id_card = ? , employee_salary = ?, employee_phone = ?, employee_email = ?, employee_address = ?, position_id = ? ,education_degree_id = ? ,division_id = ?, user_name = ?
-- where employee_id = ?;

-- select * 
-- from employee
-- where employee_name like 'T%';


-- insert customer_type 
insert into customer_type
values 
(1,'Diamond'),
(2,'Platinium'),
(3,'Gold'),
(4,'Silver'),
(5,'Member');
-- insert khach hang

insert into customer 
values
('KH1234','Nhat Anh','2001/03/13','Male',123456789,0335773638,'NhatAnh@gmail.com','Quảng Bình',3),
('KH1235','Phúc Duy','1997/03/13','Male',123456789,0335773638,'phucduy@gmail.com','Quảng Ninh',3),
('KH1236','Hữu Dự','1991/03/13','Male',123456789,0335773638,'huudu@gmail.com','Quảng Nam',3),
('KH1237','Lê Phiên','1999/03/13','Male',123456789,0335773638,'lephien@gmail.com','Đà Nẵng',3),
('KH1238','Thảo Vy','1994/03/13','Female',123456789,0335773638,'thaovy@gmail.com','Đà Nẵng',3),
('KH1239','Gia Bảo','1993/03/13','Male',123456789,0335773638,'giabao@gmail.com','Đà Nẵng',3)
;

-- delete 
-- from customer 
-- where customer_id = 14;

-- select customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address,customer_type_id
-- from customer
-- where customer_id = 7;

-- update customer
-- set customer_name = 'Duy',customer_birthday = '1997/06/03',customer_gender = 'male',customer_id_card = 1234567889
-- ,customer_phone = 0335773636 ,customer_email = 'phucduy@gmail.com',customer_address = 'Quảng Ninh',customer_type_id = 2
-- where customer_id = 7;

-- select * 
-- from customer
-- where customer_name like "%T"
-- order by customer_name;


-- select  customer.customer_id,customer.customer_name,customer.customer_birthday,customer.customer_gender,customer.customer_id_card,customer.customer_phone,customer.customer_email,customer.customer_address,customer.customer_type_id,attach_service.attach_service_name
-- from customer
-- join contract on customer.customer_id = contract.customer_id
-- join service on contract.service_id = service.service_id
-- join contract_detail on contract.contract_id = contract_detail.contract_id
-- join attach_service on contract_detail.attach_service_id = attach_service.attach_service_id
-- group by customer.customer_id,attach_service.attach_service_id;

-- select attach_service.attach_service_id,attach_service.attach_service_name,attach_service.attach_service_cost,attach_service.attach_service_unit,attach_service.attach_service_quantity,attach_service.attach_service_status
-- from customer
-- join contract on customer.customer_id = contract.customer_id
-- join service on contract.service_id = service.service_id
-- join contract_detail on contract.contract_id = contract_detail.contract_id
-- join attach_service on contract_detail.attach_service_id = attach_service.attach_service_id
-- group by customer.customer_id,attach_service.attach_service_id;


 




-- INSERT INTO customer 
-- VALUES ('KH2222','Anh Tâm','2000/03/13','Male',123456789,0335773636,'anhtam@gmail.com','Quảng Nam',3);

-- INSERT INTO customer 
-- VALUES (?,?,?,?,?,?,?,?,?);

-- insert service_type
insert into service_type
(service_type_name)
values 
('Villa'),
('House'),
('Room');

-- insert rent_type
insert into rent_type
(rent_type_name,rent_type_cost)
values 
('year',1000),
('month',100),
('day',10),
('hour',1);


-- insert  service
insert into service
values 
('DV1234','House',30,100,2,'5star','Free',10,2,1,2),
('DV1235','House',30,100,2,'5star','Free',10,2,1,2),
('DV1236','House',30,100,2,'5star','Free',10,2,1,2),
('DV1237','House',30,100,2,'5star','Free',10,2,1,2),
('DV1238','House',30,100,2,'5star','Free',10,2,1,2),
('DV1239','House',30,100,2,'5star','Free',10,2,1,2);

-- insert into service
-- values 
-- (?,?,?,?,?,?,?,?,?,?,?);

-- update service
-- set service_id = 'Dv1111', service_name = 'Villa', service_area = 30, service_cost = 100,service_max_people = 2, standard_room = '5star',description_other_convenience ='Free',pool_area= 10,number_of_floors = 2,rent_type_id = 2, service_type_id =1
-- where service_id = 'DV1234';



-- insert contract
insert into contract
values 
("HD1234",'2018/01/06','2020/03/07',1000,1000,'NV1234','KH1234','DV1234'),
("HD1235",'2018/02/07','2020/03/08',2000,1000,'NV1234','KH1234','DV1234'),
("HD1236",'2019/01/08','2020/03/09',3000,1000,'NV1234','KH1234','DV1234'),
("HD1237",'2019/02/09','2020/03/10',4000,1000,'NV1234','KH1234','DV1234'),
("HD1238",'2018/03/10','2020/03/11',5000,1000,'NV1234','KH1234','DV1234'),
("HD1239",'2019/03/11','2020/03/12',6000,1000,'NV1234','KH1234','DV1234'),
("HD1230",'2019/04/12','2020/03/13',7000,1000,'NV1234','KH1234','DV1234'),
("HD1231",'2019/05/13','2020/03/14',8000,1000,'NV1234','KH1234','DV1234');

-- update contract 
-- set contract_start_date = '2018/01/06',contract_end_date = '2020/03/07' ,contract_deposit = 10000 , contract_total_money = 1000, employee_id = 'Nv1234', customer_id = 'KH1234', service_id = 'DV1234'
-- where contract_id = "hd1234";


-- select contract.contract_id,contract.contract_start_date,contract.contract_end_date,contract.contract_deposit
-- ,sum((attach_service.attach_service_quantity*rent_type.rent_type_cost) + service.service_cost) as contract_total_money,contract.employee_id,
-- contract.customer_id, contract.service_id
-- from contract
-- left join contract_detail on contract.contract_id = contract_detail.contract_id
-- left join attach_service on contract_detail.attach_service_id = attach_service.attach_service_id
-- left join service on contract.service_id = service.service_id
-- left join rent_type on service.rent_type_id = rent_type.rent_type_id
-- group by contract.contract_id;S


-- insert attach_service
insert into attach_service
values 
(1,'massage',1000,'VNĐ',10,'using'),
(2,'karaoke',2000,'VNĐ',10,'using'),
(3,'thức ăn',3000,'VNĐ',10,'using'),
(4,'nước uống',4000,'VNĐ',10,'using'),
(5,'thuê xe di chuyển tham quan resort',5000,'VNĐ',10,'using');
-- insert hop contracr_detail
insert into contract_detail
(contract_id,attach_service_id)
values 
('HD1234',1),
('HD1234',1),
('HD1234',1),
('HD1234',1),
('HD1234',1),
('HD1234',1);

-- insert into contract_detail
-- (contract_id,attach_service_id)
-- values 
-- (?,?);