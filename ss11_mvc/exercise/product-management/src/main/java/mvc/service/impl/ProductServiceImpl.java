package mvc.service.impl;

import mvc.bean.Product;
import mvc.repository.IProductRepository;
import mvc.repository.impl.ProductRepository;
import mvc.service.ProductService;


import java.util.List;

public class ProductServiceImpl implements ProductService {

    /*
  Method của Servlet để xử lý request
  */

    // Dependency Inversion
    private static IProductRepository productRepository = new ProductRepository();

   @Override
   public List<Product> getALL() {
       List<Product> productList = productRepository.getALL();

       try{
           if (productList.size()==0){
               return null;
           }
           return productList;
       }catch (Exception e){
           System.out.println("Error");
           return null;
       }
   }

}
