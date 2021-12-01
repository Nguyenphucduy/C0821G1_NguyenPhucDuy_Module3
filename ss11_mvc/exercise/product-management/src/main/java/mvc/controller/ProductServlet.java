package mvc.controller;

import mvc.bean.Product;
import mvc.service.ProductService;
import mvc.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = {"", "/product_servlet"})
public class ProductServlet extends HttpServlet {

    private static ProductService productService = new ProductServiceImpl();
    // khi dùng form có method là post
    //-> dùng để thao tác edit, create, delete
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String choose = request.getParameter("choose");
//        if (choose == null) {
//            choose = "";
//        }
//        switch (choose) {
//            case "create":
//                break;
//            case "edit":
//                break;
//            case "delete":
//                break;
//            default:
//                break;
//        }
    }
    // khi nhập url,dùng herf and form có method là get
    // -> dùng để hiển thị thông tin hoặc lấy dữ liệu thông tin
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //        String choose = request.getParameter("choose");
//        if (choose == null) {
//            choose = "";
//        }
//        switch (choose) {
//            case "create":
//                break;
//            case "edit":
//                break;
//            case "delete":
//                break;
//            case "view":
//                break;
//            default:
//                productList(request, response);
//                break;
//        }
        productList(request, response);
    }
    private void productList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.getALL();
        if (productList==null){
            request.setAttribute("msg","not value");
        }else {
            request.setAttribute("productList",productList);
        }
        request.getRequestDispatcher("product/list.jsp").forward(request,response);

    }
}
