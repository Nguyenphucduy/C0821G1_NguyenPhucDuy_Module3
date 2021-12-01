package product_manager.service;

import product_manager.bean.Product;

import java.util.List;

public interface IProductService {
    List<Product> getAll();

    boolean saveProductService(Product product);

    Product findById(int id);

    void goPageDelete(int id);

    void  updateProduct(Product product);

    Product searchProduct(String name);
}
