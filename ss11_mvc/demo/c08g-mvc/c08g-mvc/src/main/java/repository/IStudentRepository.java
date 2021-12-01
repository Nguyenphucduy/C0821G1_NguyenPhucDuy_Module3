package repository;

import bean.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> findAll();
    Student findById(Integer id);
    boolean save(Student studentObj);
}
