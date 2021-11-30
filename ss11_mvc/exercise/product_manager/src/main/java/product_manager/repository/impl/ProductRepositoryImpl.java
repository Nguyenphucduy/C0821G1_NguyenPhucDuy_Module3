package product_manager.repository.impl;

import product_manager.bean.Product;
import product_manager.repository.IProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepositoryImpl implements IProductRepository {
    private static Map<Integer,Product> productMap = new HashMap<>();
    static {
        productMap.put(1, new Product(1, "Galaxy 1", 10, "Galaxy 1","Sam Sung"));
        productMap.put(2, new Product(2, "IPhone X", 20, "IPhone X","Apple"));
        productMap.put(3, new Product(3, "Phone", 30, "Phone","Sony"));
        productMap.put(4, new Product(4, "1280", 40, "1280","Nokia"));
        productMap.put(5, new Product(5, "Iphone 11", 50, "Iphone 11","Apple"));
        productMap.put(6, new Product(6, "Galaxy 2", 60, "Galaxy 2","Sam Sung"));
    }


    @Override
    public List<Product> getAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void saveProduct(Product product) {
        // lấy id của thằng product làm primary key
        productMap.put(product.getId(),product);

    }

    @Override
    public Product findById(int id) {
        return productMap.get(id);
    }

    @Override
    public List<Product> update(int id, Product product) {

        return null;
//        customers.put(id, customer);
    }

    @Override
    public List<Product> remove(int id) {
        productMap.remove(id);
        return null;
    }

}
