package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DiscountServlet" , urlPatterns = "/DiscountServlet")
public class DiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description = request.getParameter("Description");
        String price = request.getParameter("Price");
        String percent = request.getParameter("Percent");
       double discount_Amount = Double.parseDouble(price) * Integer.parseInt(percent) * 0.01;
       double discount_Price = Double.parseDouble(price) - discount_Amount;

        request.setAttribute("description",description);
        request.setAttribute("price",price);
        request.setAttribute("percent",percent);

        request.setAttribute("discount_Amount",discount_Amount);
        request.setAttribute("discount_Price",discount_Price);
        request.getRequestDispatcher("display-discount.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
