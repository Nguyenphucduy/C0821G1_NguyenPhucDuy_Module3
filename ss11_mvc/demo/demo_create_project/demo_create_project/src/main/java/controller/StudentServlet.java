package controller;

import bean.Student;
import service.IStudentService;
import service.impl.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentServlet", urlPatterns = "/students")
public class StudentServlet extends HttpServlet {
    //DI tiêm phụ thuộc -> module 4.
    private static IStudentService iStudentService = new StudentService();
    //Dùng form mà method là post -> edit, create, delete
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "create":
                createStudent(request,response);
                break;
            case "edit":
                break;
        }
    }

    private void createStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("dateOfBirth");
        int gender = Integer.parseInt(request.getParameter("gender"));
        double grade = Double.parseDouble(request.getParameter("grade"));
        Student student= new Student(id,name,dateOfBirth,gender,grade);
        boolean isCreated = iStudentService.saveStudentService(student);
        if(isCreated) {
            request.setAttribute("msg", "Thêm mới thành công");
        } else {
            request.setAttribute("msg","Thêm mới thất bại");
        }
        request.setAttribute("students",iStudentService.getAll());
        request.getRequestDispatcher("/list.jsp").forward(request,response);
    }

    //Khi nhập url, dùng href hoặc dùng form có method là get
    //-> hiển thị form nhập thông tin hoặc lấy dữ liệu hoặc hiển thị thông tin
    //https://localhost:8080/students
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if(action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                goPageCreate(request,response);
                break;
            case "edit":
//                goPageEdit();
                break;
            default:
               getListStudent(request,response);
               break;
        }
    }

    private void goPageCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/create.jsp").forward(request,response);
    }

    //fuction hiển thị danh sách student.
    private void getListStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> students = iStudentService.getAll();
        if(students == null) {
            request.setAttribute("msg","Không có giá trị nào hiển thị");
        } else {
            request.setAttribute("students",students);
        }
        request.getRequestDispatcher("/list.jsp").forward(request,response);
    }
}
