drop database if exists furama;

create database furama;

use furama;

create table `position` (
position_id int not null primary key,
position_name varchar(50) not null
);

create table education_degree (
education_degree_id int not null primary key,
education_degree_name varchar(50) not null
);

create table division (
division_id int not null primary key,
division_name varchar(50) not null
);

create table customer_type (
customer_type_id int not null primary key,
customer_type_name varchar(50) not null
);

create table rent_type (
rent_type_id int not null unique primary key auto_increment,
rent_type_name varchar(50) not null,
rent_type_cost double not null
);

create table service_type (
service_type_id int not null unique primary key auto_increment,
service_type_name varchar(50) not null
);

create table `user` (
user_name varchar(50) not null primary key,
`password` varchar(50) not null 
);

create table `role` (
role_id int not null primary key,
role_name varchar(50) not null
);

create table user_role (
role_id int not null primary key,
user_name varchar(50) not null,
foreign key (role_id) references `role` (role_id),
foreign key (user_name) references `user` (user_name)
);




create table employee (
employee_id varchar(6) not null unique primary key,
employee_name varchar(50) not null,
employee_birthday date not null,
employee_id_card int(12) not null,
employee_salary double not null,
employee_phone int(11) not null,
employee_email  varchar(50) not null,
employee_address varchar(50) not null,
position_id int not null,
education_degree_id int not null,
division_id int not null,
user_name varchar(50),
foreign key (position_id) references `position` (position_id),
foreign key (education_degree_id) references education_degree (education_degree_id),
foreign key (division_id) references division (division_id),
foreign key (user_name) references user (user_name)
);

create table customer (
customer_id varchar(6) not null unique primary key,
customer_name varchar(50) not null,
customer_birthday date not null,
customer_gender varchar(6) not null,
customer_id_card int(12) not null,
customer_phone int(11) not null,
customer_email varchar(50) not null,
customer_address varchar(50) not null,
customer_type_id int not null,
foreign key (customer_type_id ) references customer_type(customer_type_id )
);


create table attach_service (
attach_service_id  int not null primary key,
attach_service_name  varchar(50) not null,
attach_service_cost double not null,
attach_service_unit  varchar(50) not null,
attach_service_quantity  int not null,
attach_service_status  varchar(10) not null
);

create table service (
service_id varchar(6) not null unique primary key,
service_name varchar(50) not null,
service_area int  not null,
service_cost double not null,
service_max_people int not null,
standard_room varchar(50) not null,
description_other_convenience varchar(50),
pool_area double,
number_of_floors int ,
rent_type_id int not null,
service_type_id int not null,
foreign key (rent_type_id) references rent_type(rent_type_id),
foreign key (service_type_id) references service_type(service_type_id)
);

create table contract (
contract_id varchar(6) not null unique primary key,
contract_start_date date not null,
contract_end_date date not null,
contract_deposit double not null,
contract_total_money double not null,
employee_id varchar(6) not null,
customer_id varchar(6) not null,
service_id varchar(6) not null,
foreign key (employee_id) references employee (employee_id),
foreign key (customer_id) references customer (customer_id),
foreign key (service_id) references service (service_id)
);


create table contract_detail (
contract_detail_id int not null unique primary key auto_increment,
contract_id varchar(6) not null,
attach_service_id int not null,
foreign key (contract_id) references contract (contract_id),
foreign key (attach_service_id) references attach_service (attach_service_id)
);



