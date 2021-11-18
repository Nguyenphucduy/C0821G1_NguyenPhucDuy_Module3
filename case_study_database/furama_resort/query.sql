drop database if exists furama_resort;

create database furama_resort;

use furama_resort;

create table vi_tri (
id_vi_tri int not null primary key,
ten_vi_tri varchar(50) not null
);

create table trinh_do (
id_trinh_do int not null primary key,
name_trinh_do varchar(50) not null
);

create table bo_phan (
id_bo_phan int not null primary key,
ten_bo_phan varchar(50) not null
);

create table loai_khach (
id_loai_khach int not null primary key,
ten_loai_khach varchar(50) not null
);

create table kieu_thue (
id_kieu_thue int not null primary key,
ten_kieu_thue varchar(50) not null,
gia_thue double not null
);

create table ten_dich_vu (
id_ten_dich_vu int not null primary key,
ten_dich_vu varchar(50) not null
);

create table loai_dich_vu (
id_loai_dich_vu int not null primary key,
ten_loai_dich_vu varchar(50) not null
);




create table nhan_vien (
id_nhan_vien int not null primary key,
ho_ten varchar(50) not null,
ngay_sinh date not null,
so_cmnd int not null,
luong double not null,
sdt int not null,
email varchar(50) not null,
dia_chi varchar(50) not null,
id_vi_tri int not null,
id_trinh_do int not null,
id_bo_phan int not null,
foreign key (id_vi_tri) references vi_tri (id_vi_tri),
foreign key (id_trinh_do) references trinh_do (id_trinh_do),
foreign key (id_bo_phan) references bo_phan (id_bo_phan)
);

create table khach_hang (
id_khach_hang int not null primary key,
ho_ten varchar(50) not null,
ngay_sinh date not null,
so_cmnd int not null,
sdt int not null,
email varchar(50) not null,
dia_chi varchar(50) not null,
id_loai_khach int not null,
foreign key (id_loai_khach) references loai_khach(id_loai_khach)
);


create table dich_vu_di_kem (
id_dich_vu_di_kem int not null primary key,
ten_dich_vu_di_kem varchar(50) not null,
gia double not null,
don_vi varchar(10) not null,
trang_thai_kha_dung boolean
);

create table dich_vu (
id_dich_vu int not null primary key,
id_ten_dich_vu int not null,
so_tang int  not null,
so_nguoi_toi_da int not null,
chi_phi_thue double not null,
dien_tich double not null,
tieu_chuan_phong varchar(50),
dien_tich_ho_boi double,
mo_ta_tien_nghi_khac varchar(50),
trang_thai boolean ,
id_kieu_thue int not null,
id_loai_dich_vu int not null,
foreign key (id_ten_dich_vu) references ten_dich_vu (id_ten_dich_vu),
foreign key (id_kieu_thue) references kieu_thue (id_kieu_thue),
foreign key (id_loai_dich_vu) references loai_dich_vu (id_loai_dich_vu)
);

create table hop_dong (
id_hop_dong int not null primary key,
ngay_lam_hop_dong date not null,
ngay_ket_thuc date not null,
tien_dat_coc double not null,
id_nhan_vien int not null,
id_khach_hang int not null,
id_dich_vu int not null,
foreign key (id_nhan_vien) references nhan_vien (id_nhan_vien),
foreign key (id_khach_hang) references khach_hang (id_khach_hang),
foreign key (id_dich_vu) references dich_vu (id_dich_vu)
);


create table hop_dong_chi_tiet (
id_hop_dong_chi_tiet int not null primary key,
id_hop_dong int not null,
id_dich_vu_di_kem int not null,
so_luong int not null,
foreign key (id_hop_dong) references hop_dong (id_hop_dong),
foreign key (id_dich_vu_di_kem) references dich_vu_di_kem (id_dich_vu_di_kem)
);



