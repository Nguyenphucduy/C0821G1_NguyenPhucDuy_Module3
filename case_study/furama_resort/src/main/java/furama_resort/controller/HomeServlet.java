package furama_resort.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "HomeServlet" , urlPatterns = "/home_servlet")
public class HomeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String choose = request.getParameter("choose");

        if (choose == null) {
            choose = "";
        }
        switch (choose) {
            case "login":
                // Get cookie
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

                break;
            default:
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
        }


    }
}
