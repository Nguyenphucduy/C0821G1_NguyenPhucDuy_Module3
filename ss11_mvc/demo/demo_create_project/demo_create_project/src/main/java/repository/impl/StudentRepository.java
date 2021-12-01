package repository.impl;

import bean.Student;
import repository.IStudentRepository;

import java.util.*;

public class StudentRepository implements IStudentRepository {
    private static Map<Integer,Student> studentList = new HashMap<>();
    static {
        studentList.put(1, new Student(1,"HaiTT","01/01/1998",1,8.0));
        studentList.put(2, new Student(2,"TrungDP","01/01/1998",1,8.0));
        studentList.put(3, new Student(3,"TrungDC","01/01/1998",1,8.0));
    }

    @Override
    public List<Student> getAll() {
        return new ArrayList<>(studentList.values());
    }

    @Override
    public void saveStudentRepository(Student student) {
       studentList.put(student.getId(),student);
    }
}
