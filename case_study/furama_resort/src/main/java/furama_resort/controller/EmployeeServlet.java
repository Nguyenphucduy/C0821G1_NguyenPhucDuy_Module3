package furama_resort.controller;

import furama_resort.bean.Employee;
import furama_resort.bean.ServiceResort;
import furama_resort.service.IService;
import furama_resort.service.impl.Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "EmployeeServlet" , urlPatterns = "/employee_servlet")
public class EmployeeServlet extends HttpServlet {
    IService iService = new Service();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String choose = request.getParameter("choose");

        if (choose == null) {
            choose = "";
        }
        switch (choose) {
            case "create":
                try {
                    createEmployee(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "edit":
                editEmployee(request,response);
                break;
            case "search":
                selectEmployee(request,response);
                break;
            
        }
    }

    private void selectEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("nameEmployee");
        List<Employee> employeeList = iService.selectByEmployeeName(name);
        request.setAttribute("employeeList",employeeList);
        request.getRequestDispatcher("furama/employee/list.jsp").forward(request,response);
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Employee employee = new Employee();
        employee.setEmployeeCode(request.getParameter("employeeCode"));
        employee.setFullName(request.getParameter("fullName"));
        employee.setDateOfBirth(request.getParameter("dateOfBirth"));
        employee.setIdentityCardNumber(request.getParameter("identityCardNumber"));
        employee.setSalary(Double.parseDouble(request.getParameter("salary")));
        employee.setPhoneNumber(request.getParameter("phoneNumber"));
        employee.setEmail(request.getParameter("email"));
        employee.setAddress(request.getParameter("address"));
        employee.setPosition(Integer.parseInt(request.getParameter("position")));
        employee.setEducationDegree(Integer.parseInt(request.getParameter("educationDegree")));
        employee.setDivision(Integer.parseInt(request.getParameter("division")));
        employee.setUserName(request.getParameter("userName"));
        iService.editEmployee(employee);
        getListEmployee(request,response);
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        Employee employee = new Employee();
        employee.setEmployeeCode(request.getParameter("employeeCode"));
        employee.setFullName(request.getParameter("fullName"));
        employee.setDateOfBirth(request.getParameter("dateOfBirth"));
        employee.setIdentityCardNumber(request.getParameter("identityCardNumber"));
        employee.setSalary(Double.parseDouble(request.getParameter("salary")));
        employee.setPhoneNumber(request.getParameter("phoneNumber"));
        employee.setEmail(request.getParameter("email"));
        employee.setAddress(request.getParameter("address"));
        employee.setPosition(Integer.parseInt(request.getParameter("position")));
        employee.setEducationDegree(Integer.parseInt(request.getParameter("educationDegree")));
        employee.setDivision(Integer.parseInt(request.getParameter("division")));
        employee.setUserName(request.getParameter("userName"));
        iService.createEmployee(employee);
        getListEmployee(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String choose = request.getParameter("choose");

        if (choose == null) {
            choose = "";
        }
        switch (choose) {
            case "create":
                goPageCreate(request,response);
                break;
            case "delete":
                try {
                    deleteEmployee(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "edit":
                goPageEdit(request,response);
                break;
            default:
                getListEmployee(request,response);
                break;
        }
    }

    private void goPageEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("employeeCode");
        Employee employee = iService.selectByEmployeCode(code);
        request.setAttribute("employee",employee);
        request.getRequestDispatcher("furama/employee/edit.jsp").forward(request, response);
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String code = request.getParameter("employeeCode");
        iService.deleteEmployee(code);
        getListEmployee(request,response);
    }

    private void goPageCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("furama/employee/create.jsp").forward(request, response);
    }

    private void getListEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> employeeList = iService.getListEmployee();

        request.setAttribute("employeeList",employeeList);
        request.getRequestDispatcher("furama/employee/list.jsp").forward(request,response);
    }
}
