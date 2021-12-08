package furama_resort.controller;

import furama_resort.bean.UserEmployee;
import furama_resort.service.user.IUserService;
import furama_resort.service.user.impl.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoginServlet", urlPatterns = {"", "/login_servlet"})

public class LoginServlet extends HttpServlet {
    IUserService iUserService = new UserService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");


        List<UserEmployee> userEmployeeList = this.iUserService.getListUser();
        boolean check = false;

        for (UserEmployee userEmployee : userEmployeeList ){
            if ((userEmployee.getUserName().equals(username)) & (userEmployee.getPassword().equals(password))){
                check = true;
                break;
            }
        }
        if (check){
            // Check login
            //..
            // Save session
            request.getSession().setAttribute("usernameSession", username);
            // Save cookie
            Cookie cookie = new Cookie("usernameCookie", username);
            cookie.setMaxAge(3600);

            Cookie cookiePassword = new Cookie("passwordCookie", password);
            cookiePassword.setMaxAge(3600);

            response.addCookie(cookie);
            response.addCookie(cookiePassword);

            response.sendRedirect("/home_servlet");

        }else {
            request.setAttribute("messenger","The password you entered is incorrect or the account does not exist");
            request.getRequestDispatcher("furama/login/login.jsp").forward(request,response);
        }

    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String save = null;
         save = request.getParameter("save");
        if (save!=null){
            Cookie[] cookies = request.getCookies();

            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("usernameCookie")) {
                    request.setAttribute("usernameC", cookie.getValue());
                }

                if (cookie.getName().equals("passwordCookie")) {
                    request.setAttribute("passwordC", cookie.getValue());
                }
            }

//        response.sendRedirect("home.jsp");
            request.getRequestDispatcher("furama/login/login.jsp").forward(request, response);
        }else {
            request.getRequestDispatcher("furama/login/login.jsp").forward(request, response);
        }
    }
}
