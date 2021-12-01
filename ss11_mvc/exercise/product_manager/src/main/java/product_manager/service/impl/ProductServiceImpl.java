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
            System.out.println("Error");
            return null;
        }
    }

    @Override
    public boolean saveProductService(Product product) {
        this.iProductRepository.saveRepository(product);
        return false;
    }

    @Override
    public Product findById(int id) {
        return this.iProductRepository.findById(id);
    }

    @Override
    public void goPageDelete(int id) {
        iProductRepository.deleteProduct(id);
    }

    @Override
    public void updateProduct(Product product) {
       iProductRepository.updateProduct(product);

    }

    @Override
    public Product searchProduct(String name) {
        return iProductRepository.searchProduct(name);
    }


}
