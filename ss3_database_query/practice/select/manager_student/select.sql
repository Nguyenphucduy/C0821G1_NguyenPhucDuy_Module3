#Hiển thị danh sách tất cả học viên
SELECT *
FROM student;

#Hiển thị danh sách học viên đang theo học
SELECT *
FROM student
WHERE `status` = true;

#Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ.
SELECT *
FROM `subject`markmark
WHERE credit < 10;

#Hiển thị danh sách học viên lớp A1
SELECT s.student_id, s.student_name, c.class_name
FROM student s join class c on s.class_id = c.class_id
WHERE c.class_name = 'A1';

#Hiển thị điểm môn CF của các học viên.studentStatus
SELECT s.student_id, s.student_name, sub.sub_name, m.mark
FROM student s join mark m on s.student_id = m.student_id join `subject` sub on m.sub_id = sub.sub_id
WHERE sub.sub_name = 'CF';