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
 
 DELIMITER $$

CREATE PROCEDURE get_user_by_id(IN user_id INT)

BEGIN

    SELECT users.name, users.email, users.country

    FROM users

    where users.id = user_id;

    END$$

DELIMITER ;

  

DELIMITER $$

CREATE PROCEDURE insert_user(

IN user_name varchar(50),

IN user_email varchar(50),

IN user_country varchar(50)

)

BEGIN

    INSERT INTO users(name, email, country) VALUES(user_name, user_email, user_country);

    END$$

DELIMITER ;

--  mysql transaction 



create table Permision(

id int(11) primary key,

name varchar(50)

);


insert into Permision(id, name) values(1, 'add');

insert into Permision(id, name) values(2, 'edit');

insert into Permision(id, name) values(3, 'delete');

insert into Permision(id, name) values(4, 'view');

 

create table User_Permision(

permision_id int(11),

user_id int(11)

);