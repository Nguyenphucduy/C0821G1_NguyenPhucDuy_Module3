drop database if exists demo;
CREATE DATABASE demo;
USE demo;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);

insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');

insert into users(name, email, country)
 values
 ('Kante','kante@che.uk','Russia'),
 ('Kante','kante@che.uk','Canada'),
 ('Kante','kante@che.uk','American'),
 ('Kante','kante@che.uk','Korea'),
 ('Kante','kante@che.uk','Japan'),
 ('Kante','kante@che.uk','China');
 insert into users(name, email, country)
 values
 ('David','kante@che.uk','Russia'),
 ('kelvin','kante@che.uk','Canada'),
 ('Ben','kante@che.uk','American'),
 ('Thomas','kante@che.uk','Korea'),
 ('Dan','kante@che.uk','Japan'),
 ('Tom','kante@che.uk','China');
 
 select * 
 from users
 where country = "Viet Nam";
 
 
  select * 
 from users
 order by `name`;
 