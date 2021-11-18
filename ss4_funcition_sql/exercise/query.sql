use manager_student;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT *
FROM `subject`
WHERE credit = (SELECT MAX(credit) FROM `subject`);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.

select s.sub_name,s.credit,m.mark,m.exam_times
from `subject` s
inner join mark m on s.sub_id = m.mark_id
WHERE mark = (SELECT MAX(mark) FROM mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần

select s.student_id,s.student_name,  AVG(mark) 
from student s
inner join mark m on s.student_id = m.student_id
GROUP BY s.student_id, s.student_name
order by mark desc;
