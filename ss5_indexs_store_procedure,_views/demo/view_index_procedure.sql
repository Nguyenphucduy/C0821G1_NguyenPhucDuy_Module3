-- 1. INDEX
select *
from student
where `name` = 'Vy';
​
create index idx_student_name
on student(`name`);
​
-- 2. VIEW
create view v_get_all_student
as
select s.id 'student_id'
		, s.`name` as 'student_name'
        , c.id 'class_id'
        , c.`name` 'class_name'
        , toc.id 'type_id'
        , toc.`name` 'type_name'
        , aj.`account`
        , i.id 'instructor_id'
        , i.`name` 'instructor_name'
from account_james aj
	inner join student s on aj.`account` = s.account_james_account
    inner join class c on s.class_id = c.id
    inner join type_of_class toc on c.type_of_class_id = toc.id
    inner join instructor_teach_class itc on c.id = itc.class_id
    inner join instructor i on i.id = itc.instructor_id
where c.`name` like 'C%';
​
select *
from v_get_all_student
where student_name = 'Vy';
​
-- 3. STORED PROCEDURE
delimiter //
create procedure sp_find_student_by_keyword(p_keyword varchar(10))
begin
	select id, `name`, date_of_birth, email
    from student
    where `name` like concat('%', p_keyword, '%');
    
    -- query...
end;
// delimiter ;
​
drop procedure sp_find_student_by_keyword;
​
call sp_find_student_by_keyword('t');
​
-- 4. TRIGGER
delimiter //
create trigger save_account_james	
before insert
on student for each row
begin
	insert into account_james
    values (lcase(new.email), '12345678');
    
    if new.account_james_account is null then
		set new.account_james_account = new.email;
    end if;
end;
// delimiter ;
​
insert into student(`name`, date_of_birth, email)
values('Nguyễn Văn A', '2000-11-18', 'a@gmail.com');
​
-- 5. FUNCTION
delimiter //
create function sum2num (num1 int, num2 int)
returns int
deterministic
begin
	declare total int;
    set total = num1 + num2;
	return total;
end;
// delimiter ;
​
select sum2num(4, 8);