package furama_resort.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet" , urlPatterns = "/login_servlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// Get username, password
        String username = request.getParameter("username");
        String password = request.getParameter("password");
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
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
