package product_manager.repository;

import product_manager.bean.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> getAll();

    void saveProduct(Product product);

    Product findById(int id);

    List<Product> update(int id, Product product);

    List<Product> remove(int id);

}
