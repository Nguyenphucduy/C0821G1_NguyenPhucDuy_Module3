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
 ('David','kante@che.uk','VietNam'),
 ('kelvin','kante@che.uk','VietNam'),
 ('Ben','kante@che.uk','VietNam'),
 ('Thomas','kante@che.uk','VietNam'),
 ('Dan','kante@che.uk','VietNam'),
 ('Tom','kante@che.uk','VietNam');
 
 select * 
 from users
 where country = "VietNam";
 
 
  select * 
 from users
 order by `name`;
 
 <-- thực hành jdbc gọi stored produce-->
 
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
insert_user
DELIMITER ;