package furama_resort.controller;

import furama_resort.bean.Customer;
import furama_resort.service.customer.IServiceCustomer;
import furama_resort.service.customer.impl.ServiceCustomer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CustomerServlet" ,urlPatterns = "/customer_servlet")
public class CustomerServlet extends HttpServlet {

    IServiceCustomer iServiceCustomer = new ServiceCustomer();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String choose = request.getParameter("choose");

        if (choose == null) {
            choose = "";
        }
        switch (choose) {
            case "create":
                try {
                    createCustomer(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "edit":
                goEditData(request,response);
                break;
            case "search":
                SearchData(request,response);
                break;
        }
    }

    private void SearchData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("nameCustomer");
        List<Customer> customerList = iServiceCustomer.selectByName(name);
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("furama/customer/list.jsp").forward(request, response);
    }

    private void goEditData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerCode = request.getParameter("customerCode");
        String name = request.getParameter("nameCustomer");
        String dateOfBirth = request.getParameter("dateOfBirthCustomer");
        String gender = request.getParameter("genderCustomer");
        String idCard = request.getParameter("idCardCustomer");
        String phone = request.getParameter("phoneCustomer");
        String email = request.getParameter("emailCustomer");
        String address = request.getParameter("addressCustomer");
        int typeId = Integer.parseInt(request.getParameter("typeIdCustomer"));
        // Truyền tham số theo đúng thứ tự constructor
        Customer customer = new Customer(name,dateOfBirth,gender,idCard,phone,email,customerCode,address,typeId);

        boolean check = iServiceCustomer.updateData(customer);
        if (!check){
            request.setAttribute("messenger","Error Validate");
        }else {
            request.setAttribute("messenger","Update Done");
        }
        getListCustomer(request,response);
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String codeCustomer = request.getParameter("codeCustomer");
        String name = request.getParameter("nameCustomer");
        String dateOfBirth = request.getParameter("dateOfBirthCustomer");
        String gender = request.getParameter("genderCustomer");
        String idCard = request.getParameter("idCardCustomer");
        String phone = request.getParameter("phoneCustomer");
        String email = request.getParameter("emailCustomer");
        String address = request.getParameter("addressCustomer");
        int typeId = Integer.parseInt(request.getParameter("typeIdCustomer"));

        Customer customer = new Customer(name,dateOfBirth,gender,idCard,phone,email,codeCustomer,address,typeId);
//        customer.setFullName(name);
//        customer.setDateOfBirth(dateOfBirth);
//        customer.setGender(gender);
//        customer.setIdentityCardNumber(idCard);
//        customer.setPhoneNumber(phone);
//        customer.setEmail(email);
//        customer.setAddress(address);
//        customer.setCustomerType(typeId);

        boolean checkValidate = this.iServiceCustomer.createCustomer(customer);

        if(checkValidate) {
            request.setAttribute("messenger", "successfully added new");
        } else {
            request.setAttribute("messenger","new add failure");
        }

        getListCustomer(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String choose = request.getParameter("choose");

        if (choose == null) {
            choose = "";
        }
        switch (choose) {
            case "create":
                goPageCreate(request, response);
                break;
            case "delete":
                try {
                    deleteCustomer(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "edit":
                goPageEdit(request,response);
                break;
            default:
                getListCustomer(request,response);
                break;
        }
    }

    private void goPageEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerCode = request.getParameter("customerCode");
        Customer customer = iServiceCustomer.selectByCustomerCode(customerCode);
        RequestDispatcher dispatcher = request.getRequestDispatcher("furama/customer/edit.jsp");
        request.setAttribute("customer", customer);
        dispatcher.forward(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String customerCode = request.getParameter("customerCode");
        iServiceCustomer.deleteCustomer(customerCode);
        getListCustomer(request,response);
    }

    private void getListCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Customer> customerList = iServiceCustomer.getListCustomer();
        if (customerList.size()==0){
            request.setAttribute("messenger","empty list");
        }else {
            request.setAttribute("customerList", customerList);
            request.getRequestDispatcher("furama/customer/list.jsp").forward(request, response);
        }
    }


    private void goPageCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("furama/customer/create.jsp").forward(request, response);
    }
}
