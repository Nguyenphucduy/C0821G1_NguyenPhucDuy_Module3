package product_manager.service;

import product_manager.bean.Product;

import java.util.List;

public interface IProductService {
    List<Product> getAll();

    boolean saveProductService(Product product);

    Product findById(int id);

    void update(int id, Product product);

    void remove(int id);
}
