package service;

import bean.Student;

import java.util.List;

public interface IStudentService {
    List<Student> getAll();

    boolean saveStudentService(Student student);
}
