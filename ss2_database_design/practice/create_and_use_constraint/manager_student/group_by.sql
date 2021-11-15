#Hiển thị số lượng sinh viên ở từng nơi
SELECT address, COUNT(student_id) AS 'Số lượng học viên'
FROM student
GROUP BY address;

#Tính điểm trung bình các môn học của mỗi học viên
SELECT s.student_id, s.student_name, AVG(mark)
FROM student s
         join mark m on s.student_id = m.student_id
GROUP BY s.student_id, s.student_name
HAVING AVG(mark) > 15;

#Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
SELECT s.student_id, s.student_name, AVG(mark)
FROM student s join mark m on s.student_id = m.student_id
GROUP BY s.student_id, s.student_name
HAVING AVG(mark) >= ALL (SELECT AVG(mark) FROM mark GROUP BY mark.student_id);