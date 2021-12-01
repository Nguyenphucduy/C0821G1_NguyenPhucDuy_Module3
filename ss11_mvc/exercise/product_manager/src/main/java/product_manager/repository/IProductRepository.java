package product_manager.repository;

import product_manager.bean.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> getAll();


    void saveRepository(Product product);

    Product findById(int id);

    boolean deleteProduct(int id);

    boolean updateProduct(Product product);

    Product searchProduct(String name);
}
