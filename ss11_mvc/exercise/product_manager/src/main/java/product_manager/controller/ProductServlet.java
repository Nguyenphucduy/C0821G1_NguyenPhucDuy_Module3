package product_manager.controller;

import product_manager.bean.Product;
import product_manager.service.IProductService;
import product_manager.service.impl.ProductServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = {"", "/productController"})
public class ProductServlet extends HttpServlet {
    IProductService iProductService = new ProductServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String choose = request.getParameter("choose");
        switch (choose) {
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
            case "search":
                searchProduct(request, response);
                break;
        }
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("nameProduct");
        Product product =  iProductService.searchProduct(name);
        request.setAttribute("product", product);
        RequestDispatcher  dispatcher = request.getRequestDispatcher("product/search.jsp");
        dispatcher.forward(request, response);

    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idProduct"));
        String name = request.getParameter("nameProduct");
        double price = Double.parseDouble(request.getParameter("priceProduct"));
        String description = request.getParameter("descriptionProduct");
        String producer = request.getParameter("producerProduct");

        Product product = new Product(id, name, price, description, producer);
        iProductService.updateProduct(product);
        loadList(request, response);
    }


    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("nameProduct");
        double price = Double.parseDouble(request.getParameter("priceProduct"));
        String description = request.getParameter("descriptionProduct");
        String producer = request.getParameter("producerProduct");
        Product product = new Product();
        product.setName(name);
        product.setPrice(price);
        product.setDescription(description);
        product.setProducer(producer);
        boolean isCreated = iProductService.saveProductService(product);
        if (isCreated) {
            request.setAttribute("msg", "Done");
        } else {
            request.setAttribute("msg", "Not Done");
        }
        this.loadList(request, response);
    }

    private void loadList(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("productList", iProductService.getAll());
            request.getRequestDispatcher("product/list.jsp").forward(request, response);

        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
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
                goPageDelete(request, response);
                break;
            case "edit":
                goPageEdit(request, response);
                break;
            case "view":
                goPageView(request, response);
                break;
            default:
                getListProduct(request, response);
                break;
        }
    }

    private void goPageView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.iProductService.findById(id);

        request.setAttribute("product", product);
        RequestDispatcher  dispatcher = request.getRequestDispatcher("product/view.jsp");
        dispatcher.forward(request, response);

    }

    private void goPageEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = iProductService.findById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/edit.jsp");
        request.setAttribute("product", product);
        dispatcher.forward(request, response);
    }


    private void goPageDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        iProductService.goPageDelete(id);
        loadList(request, response);
    }

    private void goPageCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("product/create.jsp").forward(request, response);
    }

    private void getListProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = iProductService.getAll();
        if (productList == null) {
            request.setAttribute("msg", "not value");
        } else {
            request.setAttribute("productList", productList);
        }
        request.getRequestDispatcher("product/list.jsp").forward(request, response);
    }
}
