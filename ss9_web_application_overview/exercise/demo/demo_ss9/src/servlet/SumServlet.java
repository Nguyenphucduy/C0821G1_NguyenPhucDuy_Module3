package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "SumServlet" ,urlPatterns = "/sumServlet")
public class SumServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String a = request.getParameter("num1");
        String b = request.getParameter("num2");
        int result = Integer.parseInt(a) + Integer.parseInt(b);
        // Cách 1

//        PrintWriter printWriter = response.getWriter();
//        printWriter.println("<html>");
//        printWriter.println("<body>");
//        printWriter.println("<h2 style='color: red' >Sum : " + result + "</h2>");
//        printWriter.println("</body>");
//        printWriter.println("</html>");

        // Cách 3
        request.setAttribute("resultNum",result);
        request.getRequestDispatcher("index.jsp").forward(request,response);

    }
}
