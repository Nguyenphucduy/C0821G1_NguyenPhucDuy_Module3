drop database if exists furama_resort;

create database furama_resort;

use furama_resort;

create table vi_tri (
id_vi_tri int primary key,
ten_vi_tri varchar(50)
);

create table trinh_do (
id_trinh_do int primary key,
name_trinh_do varchar(50)
);

create table bo_phan (
id_bo_phan int primary key,
ten_bo_phan varchar(50)
);

create table loai_khach (
id_loai_khach int primary key,
ten_loai_khachn varchar(50)
);

create table kieu_thue (
id_kieu_thue int primary key,
ten_kieu_thue varchar(50),
gia_thue double
);

create table loai_dich_vu (
id_loai_dich_vu int primary key,
ten_loai_dich_vu varchar(50)
);




create table nhan_vien (
id_nhan_vien int primary key,
ho_ten varchar(50),
ngay_sinh date,
so_cmnd int,
luong double,
sdt int,
email varchar(50),
dia_chi varchar(50),
id_vi_tri int,
id_trinh_do int,
id_bo_phan int,
foreign key (id_vi_tri) references vi_tri (id_vi_tri),
foreign key (id_trinh_do) references trinh_do (id_trinh_do),
foreign key (id_bo_phan) references bo_phan (id_bo_phan)
);

create table khach_hang (
id_khach_hang int primary key,
ho_ten varchar(50),
ngay_sinh date,
so_cmnd int,
sdt int,
email varchar(50),
dia_chi varchar(50),
id_loai_khach int,
foreign key (id_loai_khach) references loai_khach(id_loai_khach)
);


create table dich_vu_di_kem (
id_dich_vu_di_kem int primary key,
ten_dich_vu_di_kem varchar(50),
gia double,
don_vi varchar(10),
trang_thai_kha_dung boolean
);

create table dich_vu (
id_dich_vu int primary key,
ten_dich_vu varchar(50),
so_tang int ,
so_nguoi_toi_da int,
chi_phi_thue double,
trang_thai boolean,
id_kieu_thue int,
id_loai_dich_vu int,
foreign key (id_kieu_thue) references kieu_thue (id_kieu_thue),
foreign key (id_loai_dich_vu) references loai_dich_vu (id_loai_dich_vu)
);

create table hop_dong (
id_hop_dong int primary key,
ngay_lam_hop_dong date,
ngay_ket_thuc date,
tien_dat_coc double,
tong_tien double,
id_nhan_vien int ,
id_khach_hang int ,
id_dich_vu int ,
foreign key (id_nhan_vien) references nhan_vien (id_nhan_vien),
foreign key (id_khach_hang) references khach_hang (id_khach_hang),
foreign key (id_dich_vu) references dich_vu (id_dich_vu)
);


create table hop_dong_chi_tiet (
id_hop_dong_chi_tiet int primary key,
id_hop_dong int,
id_dich_vu_di_kem int,
foreign key (id_hop_dong) references hop_dong (id_hop_dong),
foreign key (id_dich_vu_di_kem) references dich_vu_di_kem (id_dich_vu_di_kem)
);



