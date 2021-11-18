-- DÒ BÀI CŨ
-- Lấy ra các lớp đang chưa có học viên học. 
-- (HAVING, truy vấn con – sub query, left join (right join))
select *
from class c
	left join student s on c.id = s.class_id
where s.class_id is null;

select *
from student s
	right join class c on c.id = s.class_id
where s.class_id is null;

-- Bài tập GROUP BY: Lấy ra số lượng học viên của từng lớp. 
select c.id, c.`name`, count(s.class_id)
from class c
	left join student s on c.id = s.class_id
group by c.id;

select max(id)
from student;

-- Bài tập UNION/UNION ALL: Lấy ra toàn bộ các instructor và student ở CodeGym.
select id, `name`, date_of_birth
from student
union all
select id, `name`, date_of_birth
from instructor;


-- Bài tập LIMIT: Lấy ra 3 học viên trẻ tuổi nhất ở CodeGym.
select *
from student
order by date_of_birth desc
limit 3;

-- Bài tập EXISTS/IN: Lấy ra các lớp đang chưa có học viên học.

-- danh sach toan bo cac lop
select *
from class
where id not in (
-- danh sach cac lop co hoc vien hoc (sub query)
	select class_id
	from student
    where class_id is not null
);

select *
from class c
where not exists (
-- danh sach cac lop co hoc vien hoc (sub query)
	select *
	from student s
    where c.id = s.class_id
);

-- CAC HAM THONG DUNG
SELECT CONCAT(id, `name`)
from student;

SELECT CONCAT_WS("-", "SQL", "Tutorial", "is", "fun!");

SELECT year(date_of_birth)
from student;

select s.id, s.`name`, c.`name`
from student s
	left join class c on s.class_id = c.id
where c.id is null
union
select s.id, s.`name`, c.`name`
from student s
	right join class c on s.class_id = c.id
where s.class_id is null;