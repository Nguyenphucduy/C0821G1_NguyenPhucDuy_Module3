package service.impl;

import bean.Student;
import repository.IStudentRepository;
import repository.impl.StudentRepository;
import service.IStudentService;

import java.util.List;

public class StudentService implements IStudentService {
    private static IStudentRepository iStudentRepository = new StudentRepository();

    @Override
    public List<Student> getAll() {
        try {
            List<Student> students = iStudentRepository.getAll();
            if (students.size() == 0) {
                return null;
            }
            return students;
        } catch (Exception e) {
            System.out.println("Gặp lỗi");
            return null;
        }
    }

    @Override
    public boolean saveStudentService(Student student) {
      if(checkStudent(student)) {
          iStudentRepository.saveStudentRepository(student);
          return true;
      } else {
          return false;
      }
    }
    public boolean checkStudent(Student student) {
        if(!student.getName().matches("^[a-z A-Z]{5,}$")){
            return false;
        }
        if(student.getId()<0) {
            return false;
        }
        return true;
    }
}
