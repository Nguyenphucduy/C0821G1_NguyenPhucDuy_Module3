drop database if exists manager_sell;

create database manager_sell;

use manager_sell;

create table customer (
customer_id int not null unique primary key,
customer_name varchar (50) not null,
customer_age int not null
);


create table `order` (
order_id int not null unique primary key,
customer_id int not null,
order_date date not null,
order_total_price double,
foreign key (customer_id) references customer (customer_id)
);

create table product (
product_id int not null unique primary key,
product_name varchar (50) not null,
product_price double not null
);


create table order_detail (
order_id int not null ,
product_id int not null ,
od_qty varchar (60),
primary key(order_id,product_id),
foreign key (order_id) references `order` (order_id),
foreign key (product_id) references product (product_id)
);


