package repository;

import bean.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> getAll();

    void saveStudentRepository(Student student);
}
