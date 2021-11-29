package mvc.controller;

import mvc.model.Customer;
import mvc.service.CustomerService;
import mvc.service.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet" , urlPatterns = "/customers")

public class CustomerServlet extends javax.servlet.http.HttpServlet {
    private CustomerService customerService = new CustomerServiceImpl();
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                break;
            case "edit":
                break;
            case "delete":
                break;
            case "view":
                break;
            default:
                listCustomers(request,response);
                break;
        }

    }
    private void listCustomers(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response){
        List<Customer> customers = this.customerService.findAll();
        request.setAttribute("customers",customers);

        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/list.jsp");
        try{
            dispatcher.forward(request,response);
        }catch (ServletException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }

    }
}

