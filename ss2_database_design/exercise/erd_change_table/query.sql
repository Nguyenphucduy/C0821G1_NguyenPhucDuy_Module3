drop database if exists quan_ly_don_hang;

create database quan_ly_don_hang;

use quan_ly_don_hang;


create table phieu_xuat(
 so_px int primary key,
 ngay_xuat date
);

create table vat_tu(
 ma_vt int primary key,
 ten_vt varchar(50)
);

create table phieu_nhap(
 so_pn int primary key,
 ngay_nhap date
);
create table so_don_hang(
 so_dh int primary key ,
 ngay_dh date
);

create table nha_cc(
 ma_ncc int primary key ,
 ten_ncc varchar(50),
 dia_chi varchar(60),
 so_dien_thoai int,
 so_don_hang int,
 foreign key (so_don_hang) references so_don_hang (so_dh)
);
create table chi_tiet_phieu_xuat(
don_gia_xuat double,
so_luong_xuat int,
so_px_phieu_xuat int,
ma_vat_tu int,
primary key(so_px_phieu_xuat,ma_vat_tu),
foreign key (so_px_phieu_xuat) references phieu_xuat (so_px),
foreign key (ma_vat_tu) references vat_tu (ma_vt)
);
create table chi_tiet_don_dat_hang(
ma_vat_tu int,
so_don_hang int,
primary key (ma_vat_tu,so_don_hang),
foreign key (ma_vat_tu) references vat_tu (ma_vt),
foreign key (so_don_hang) references so_don_hang (so_dh)
);
create table chi_tiet_phieu_nhap(
don_gia_nhap double,
so_luong_nhap int,
so_pn_phieu_nhap int,
ma_vat_tu int,
primary key (so_pn_phieu_nhap,ma_vat_tu),
foreign key (so_pn_phieu_nhap) references phieu_nhap (so_pn),
foreign key (ma_vat_tu) references vat_tu (ma_vt)
);
