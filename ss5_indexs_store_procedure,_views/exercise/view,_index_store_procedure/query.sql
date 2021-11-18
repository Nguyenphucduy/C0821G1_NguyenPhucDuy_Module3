drop database if exists products_manager;

create database products_manager;

use products_manager;

create table products  (
id int not null unique primary key ,
product_code int not null,
product_name varchar(50) not null,
product_price double not null,
product_amount int not null,
product_description varchar(100) not null,
product_status boolean not null
);