package mvc.service;

import mvc.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {
    private static Map<Integer,Product> productMap;

    static {
        productMap = new  HashMap<>();
        productMap.put(1, new Product(1, "Galaxy 1", 10, "Hanoi","Sam Sung"));
        productMap.put(2, new Product(2, "IPhone X", 20, "Danang","Apple"));
        productMap.put(3, new Product(3, "Phone", 30, "Saigon","Sony"));
        productMap.put(4, new Product(4, "1280", 40, "Beijin","Nokia"));
        productMap.put(5, new Product(5, "Iphone 11", 50, "Miami","Apple"));
        productMap.put(6, new Product(6, "Galaxy 2", 60, "Newyork","Sam Sung"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());
        // lấy value add vào Array
    }


    @Override
    public void save(Product product) {
        productMap.put(product.getId(), product);

    }

    @Override
    public void update(int id, Product product) {
       productMap.put(id, product);
    }

    @Override
    public void remove(int id) {
        productMap.remove(id);
    }

    @Override
    public Product findByName(String name) {
         return productMap.get(name);
    }
}
