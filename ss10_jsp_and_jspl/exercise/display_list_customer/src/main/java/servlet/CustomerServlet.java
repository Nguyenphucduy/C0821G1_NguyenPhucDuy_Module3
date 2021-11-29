package servlet;

import bean.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = {"","/customer_list"})
public class CustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer("Mai Văn Hoàn" ,"1983-08-20","Hà Nội",0,5,"02-still-for-america-room-loop-superJumbo.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam" ,"1983-08-21","Bắc Giang",1,2,"02-still-for-america-room-loop-superJumbo.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hoà" ,"1983-08-22","Nam Định",0,8,"02-still-for-america-room-loop-superJumbo.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa" ,"1983-08-17","Hà Tây",1,9,"02-still-for-america-room-loop-superJumbo.jpg"));
        customerList.add(new Customer("Nguyễn Đình Thi    " ,"1983-08-19","Ha Nội",1,4,"02-still-for-america-room-loop-superJumbo.jpg"));
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("index.jsp").forward(request,response);


    }
}
