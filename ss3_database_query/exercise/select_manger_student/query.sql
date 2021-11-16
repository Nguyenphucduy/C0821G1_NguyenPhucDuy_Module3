use manager_student;
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * 
from student 
where student_name like "H%";

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select *
from class 
where start_date >= "2008-12-01 00:00:00" and start_date <= "2008-12-31 00:00:00";



-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.

SELECT *
FROM `subject`
WHERE credit > 3  and credit < 5 ;


-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
SET SQL_SAFE_UPDATES=0;
UPDATE student
SET class_id = 2
WHERE student_name = "Hung";
SET SQL_SAFE_UPDATES = 1;



-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp xếp theo tên tăng dần.

 select s.student_name,su.sub_name,mark
 from student s 
 inner join `subject` su on s.student_id = su.sub_id
 inner join mark m on su.sub_id = m.mark_id
 order by mark desc;
