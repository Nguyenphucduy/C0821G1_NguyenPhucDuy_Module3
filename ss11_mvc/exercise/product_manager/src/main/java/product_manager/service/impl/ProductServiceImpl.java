package product_manager.service.impl;

import product_manager.bean.Product;
import product_manager.repository.IProductRepository;
import product_manager.repository.impl.ProductRepositoryImpl;
import product_manager.service.IProductService;

import java.util.List;

public class ProductServiceImpl implements IProductService {
    IProductRepository iProductRepository = new ProductRepositoryImpl();
    @Override
    public List<Product> getAll() {
       try {
            List<Product> productList = iProductRepository.getAll();
            if (productList.size() == 0) {
                return null;
            }
            return productList;
        } catch (Exception e) {
            System.out.println("Gặp lỗi");
            return null;
        }
    }

    @Override
    public boolean saveProductService(Product product) {
        if (checkProduct(product)){
            iProductRepository.saveProduct(product);
            return true;
        }else {
            return false;
        }
    }


    @Override
    public Product findById(int id) {
        return null;
    }


    @Override
    public void update(int id, Product product) {

        List<Product> productList = iProductRepository.update(id,product);
    }

    @Override
    public void remove(int id) {
        List<Product> productList = iProductRepository.remove(id);

    }

    public boolean checkProduct(Product product){
        if (!product.getName().matches("^[a-z A-z]{5,}$")){
            return false;
        }
        if (product.getId()<0){
            return false;
        }
        return true;
    }

}
