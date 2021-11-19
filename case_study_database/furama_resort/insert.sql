use furama_resort;
-- insert bo phan
insert into bo_phan
values
(1,'Sale – Marketing'),
(2,'Hành Chính'),
(3,'Phục vụ'),
(4,'Quản lý');
-- insert vi tri
insert into vi_tri
values
(1,'Lễ tân'),
(2,'phục vụ'),
(3,'chuyên viên'),
(4,'giám sát'),
(5,'quản lý'),
(6,' giám đốc');
-- insert trinh do
insert into trinh_do
values
(1,'Cao đẳng'),
(2,'Đại học '),
(3,'Trung cấp'),
(4,'sau đại học');

-- insert nhân viên
insert into nhan_vien
values 
(1,'Phuc Duy','1997/03/06',123456789,500,0335773636,'phucduy@gmail.com','quang ninh',1,1,1),
(2,'Huu Du','1997/03/07',123456781,5000,0335773635,'HuuDu@gmail.com','quang nam',2,2,2),
(3,'Anh Tam','1997/03/08',123456782,200,0335773634,'AnhTam@gmail.com','quang nam',3,3,3),
(4,'Gia Bao','1997/03/09',123456783,300,0335773633,'GiaBao@gmail.com','da nang',4,4,4),
(5,'Thao Vy','1997/03/10',123456784,4000,0335773632,'ThaoVy@gmail.com','da nang',1,1,1),
(6,'Ngoc Du','1997/03/11',123456785,55500,0335773631,'NgocDu@gmail.com','quang ninh',2,2,2),
(7,'Van Dong','1997/03/12',123456789,7700,0335773637,'VanDong@gmail.com','quang nam',3,3,3),
(8,'Nhat Anh','1997/03/13',123456789,5000,0335773638,'NhatAnh@gmail.com','quang binh',4,4,4);
-- insert loai khach hang 
insert into loai_khach
values 
(1,'Diamond'),
(2,'Platinium'),
(3,'Gold'),
(4,'Silver'),
(5,'Member');
-- insert khach hang
insert into khach_hang
values 
(1,'Phuc Duy','1997/03/06',123456789,0335773636,'phucduy@gmail.com','quang ninh',1),
(2,'Huu Du','1997/03/07',123456781,0335773635,'HuuDu@gmail.com','quang nam',2),
(3,'Anh Tam','1997/03/08',123456782,0335773634,'AnhTam@gmail.com','quang nam',3),
(4,'Gia Bao','1997/03/09',123456783,0335773633,'GiaBao@gmail.com','da nang',4),
(5,'Thao Vy','1997/03/10',123456784,0335773632,'ThaoVy@gmail.com','da nang',5),
(6,'Ngoc Du','1997/03/11',123456785,0335773631,'NgocDu@gmail.com','quang ninh',1),
(7,'Van Dong','1997/03/12',123456789,0335773637,'VanDong@gmail.com','quang nam',2),
(8,'Nhat Anh','1997/03/13',123456789,0335773638,'NhatAnh@gmail.com','quang binh',3);
insert into khach_hang
values 
(9,'Phuc Duy','1997/03/06',123456789,0335773636,'phucduy@gmail.com','quang ninh',1);


-- insert loai dich vu
insert into loai_dich_vu
values 
(1,'Villa'),
(2,'House'),
(3,'Room');

-- insert kieu thue
insert into kieu_thue
values 
(1,'năm',1000),
(2,'tháng',100),
(3,'ngày',10),
(4,'giờ',1);
-- insert ten dich vu
insert into ten_dich_vu
values 
(1,'Villa'),
(2,'House'),
(3,'Room');

-- insert dich vu
insert into dich_vu
values 
(1,1,1,9,500,30,'5star',20,null,true,1,2),
(2,2,2,8,5000,40,'4star',20,null,true,2,3),
(3,3,3,7,200,50,'3star',20,null,true,3,1),
(4,1,4,6,300,60,'2star',null,null,true,4,2),
(5,2,5,5,4000,70,'1star',null,null,false,1,3),
(6,3,6,4,4000,80,'1star',null,null,false,2,1),
(7,1,7,3,7700,90,'2star',null,null,false,3,2),
(8,2,8,2,5000,100,'5star',20,null,false,4,3);

-- insert hop dong
insert into hop_dong
values 
(1,'2018/01/06','2020/03/07',1000,1,8,1),
(2,'2018/02/07','2020/03/08',2000,2,7,2),
(3,'2019/01/08','2020/03/09',3000,3,6,3),
(4,'2019/02/09','2020/03/10',4000,4,5,1),
(5,'2018/03/10','2020/03/11',5000,5,4,2),
(6,'2019/03/11','2020/03/12',6000,6,3,3),
(7,'2019/04/12','2020/03/13',7000,7,2,1),
(8,'2019/05/13','2020/03/14',8000,8,1,2);
insert into hop_dong
values 
(9,'2019/10/13','2020/03/14',8000,8,1,2),
(10,'2019/11/13','2020/03/14',8000,8,1,2);
insert into hop_dong
values 
(13,'2019/10/13','2020/03/14',8000,1,8,2),
(14,'2019/11/13','2020/03/14',8000,2,7,3);

-- insert dich vu di kem
insert into dich_vu_di_kem
values 
(1,'massage',1000,'VNĐ',true),
(2,'karaoke',2000,'VNĐ',true),
(3,'thức ăn',3000,'VNĐ',true),
(4,'nước uống',4000,'VNĐ',true),
(5,'thuê xe di chuyển tham quan resort',5000,'VNĐ',true);
-- insert hop dong chi tiet
insert into hop_dong_chi_tiet
values 
(1,1,1,1),
(2,2,2,2),
(3,3,3,3),
(4,4,4,4),
(5,5,5,5),
(6,6,1,6),
(7,7,2,7),
(8,8,3,8);