package mvc.controller;

import mvc.model.Product;
import mvc.service.ProductService;
import mvc.service.ProductServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet" ,urlPatterns = {"","/product"})
public class ProductServlet extends HttpServlet {
    private ProductService productService = new ProductServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                break;
            case "delete":
                break;
            default:
                break;
        }

    }

    /**
     * Phương thức createProduct(request, response) sẽ nhận về các tham số được gửi lên từ form,
     * khởi tạo đối tượng Product và lưu trữ vào trong một danh sách khách hàng giả lập.
     * @param request
     * @param response
     */
    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = (int)(Math.random() * 10000);
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");

        Product product = new Product(id, name,price,  description,producer);
        this.productService.save(product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        request.setAttribute("message", "New product was created");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                break;
            case "view":
                break;
            default:
                productList(request, response);
                break;
        }
    }
    private void productList(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = this.productService.findAll();
        request.setAttribute("productList", productList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Phương thức showCreateForm(request, response); sẽ trả về một form được định nghĩa trong view product/create.jsp:
     * @param request
     * @param response
     */
    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Phương thức showEditForm(request, response) sẽ tìm một product theo name được truyền vào. Nếu product không tồn tại thì sẽ hiển thị thông báo lỗi.
     * Nếu product có tồn tại thì hiển thị thông tin product lên một view là product/edit.jsp:
     * @param request
     * @param response
     */

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        String name = (request.getParameter("name"));
        Product product = this.productService.findByName(name);
        RequestDispatcher dispatcher;
        if(product == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("product/edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

}
