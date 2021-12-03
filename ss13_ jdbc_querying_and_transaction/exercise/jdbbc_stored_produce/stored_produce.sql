drop database if exists exercise_sp;
CREATE DATABASE exercise_sp;
USE exercise_sp;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL unique,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);

insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');


 insert into users(name, email, country)
 values
 ('David','kante@che.uk','VietNam'),
 ('kelvin','kante@che.uk','VietNam'),
 ('Ben','kante@che.uk','VietNam'),
 ('Thomas','kante@che.uk','VietNam'),
 ('Dan','kante@che.uk','VietNam'),
 ('Tom','kante@che.uk','VietNam');
 
 

 
 <-- exercise jdbc gọi stored produce-->
 
 DELIMITER $$

CREATE PROCEDURE display_list_user()

BEGIN

   SELECT * FROM exercise_sp.users;

    END$$

DELIMITER ;

call display_list_user();





DELIMITER $$

CREATE PROCEDURE update_user(
 name_update varchar(50),
 email_update varchar(50),
 country_update varchar(50),
 id_fix int
)

BEGIN

    update users
   set `name` = name_update , email = email_update, country = country_update
   where id = id_fix;

    END$$

DELIMITER ;

--   update users
--    set `name` = 1 , email = 1, country = 1
--    where id = 1;

call update_user(?,?,?,?);

DELIMITER $$

CREATE PROCEDURE delete_user( id_fix int)

BEGIN

  DELETE FROM users
WHERE id = id_fix;

    END$$

DELIMITER ;


call delete_user(?);
  DELETE FROM users
WHERE id = 1;


