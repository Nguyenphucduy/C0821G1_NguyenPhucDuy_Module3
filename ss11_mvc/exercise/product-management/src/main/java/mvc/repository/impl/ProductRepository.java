package mvc.repository.impl;

import mvc.bean.Product;
import mvc.repository.IProductRepository;

import java.util.*;

public class ProductRepository implements IProductRepository {
    private static  Map<Integer,Product> productMap = new HashMap<>();
    /**
     *
     * Method của database để lấy data
     */

    static {
        productMap.put(1, new Product(1, "Galaxy 1", 10, "Ha noi","Sam Sung"));
        productMap.put(2, new Product(2, "IPhone X", 20, "Da nẵng","Apple"));
        productMap.put(3, new Product(3, "Phone", 30, "Sai gon","Sony"));
        productMap.put(4, new Product(4, "1280", 40, "Beijing","Nokia"));
        productMap.put(5, new Product(5, "Iphone 11", 50, "Miami","Apple"));
        productMap.put(6, new Product(6, "Galaxy 2", 60, "New York","Sam Sung"));
    }

    @Override
    public List<Product> getALL() {
        return new ArrayList<>(productMap.values());
    }



}
