package product_manager.repository.impl;

import product_manager.bean.Product;
import product_manager.repository.IProductRepository;

import java.sql.*;
import java.util.ArrayList;

import java.util.List;


public class ProductRepositoryImpl implements IProductRepository {

    private static final String INSERT_PRODUCT_SQL = "insert into product(`name`, price, `description`,producer)\n" + " values(?,?,?,?)";
    private static final String SELECT_PRODUCT_BY_ID = "select * from product where id =?;";
    private static final String SELECT_PRODUCT_BY_NAME = "select * from product where name =?;";
    private static final String SELECT_ALL_PRODUCT = "select * from product";
    private static final String DELETE_PRODUCT_SQL = "delete from product where id = ?;";
    private static final String UPDATE_PRODUCT_SQL = "update product set name = ?,price= ?, description = ?,producer = ? where id = ?;";

    @Override
    public List<Product> getAll() {
        List<Product> productList = new ArrayList<>();

        try {
            Statement statement = BaseRepository.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_ALL_PRODUCT);

            Product product;
            while (resultSet.next()){
                product = new Product();
                product.setId(Integer.parseInt(resultSet.getString("id")));
                product.setName(resultSet.getString("name"));
                product.setPrice(Double.parseDouble(resultSet.getString("price")));
                product.setDescription(resultSet.getString("description"));
                product.setProducer(resultSet.getString("producer"));

                productList.add(product);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return productList;
    }

    @Override
    public void saveRepository(Product product) {
        try {
            PreparedStatement preparedStatement =
                    BaseRepository.connection.prepareStatement(INSERT_PRODUCT_SQL);

            preparedStatement.setString(1,product.getName());
            preparedStatement.setString(2, String.valueOf(product.getPrice()));
            preparedStatement.setString(3,product.getDescription());
            preparedStatement.setString(4,product.getProducer());

            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public boolean deleteProduct(int id) {
        boolean rowDeleted = true;
        try {
            try (
                    PreparedStatement statement = BaseRepository.connection.prepareStatement(DELETE_PRODUCT_SQL)) {
                statement.setInt(1, id);
                rowDeleted = statement.executeUpdate() > 0;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowDeleted;
    }

    @Override
    public boolean updateProduct(Product product) {
        boolean rowUpdated = true;
        try {
            try (
                    PreparedStatement statement = BaseRepository.connection.prepareStatement(UPDATE_PRODUCT_SQL)) {
                statement.setString(1, product.getName());
                statement.setString(2, String.valueOf(product.getPrice()));
                statement.setString(3, product.getDescription());
                statement.setString(4, product.getProducer());
                statement.setInt(5, product.getId());

                rowUpdated = statement.executeUpdate() > 0;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowUpdated;
    }

    @Override
    public Product searchProduct(String name) {
        Product product = null;
        // Step 1: Establishing a Connection
        try (
                PreparedStatement preparedStatement = BaseRepository.connection.prepareStatement(SELECT_PRODUCT_BY_NAME)) {
            preparedStatement.setString(1, name);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet resultSet = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (resultSet.next()) {
                int  id = Integer.parseInt(resultSet.getString("id"));
                double price = Double.parseDouble(resultSet.getString("price"));
                String description = resultSet.getString("description");
                String producer = resultSet.getString("producer");
                product = new Product(id, name, price, description,producer);
            }
        } catch (SQLException e) {
            e.getErrorCode();
        }
        return product;
    }

    @Override
    public Product findById(int id) {
        Product product = null;
        // Step 1: Establishing a Connection
        try (
             PreparedStatement preparedStatement = BaseRepository.connection.prepareStatement(SELECT_PRODUCT_BY_ID)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet resultSet = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                double price = Double.parseDouble(resultSet.getString("price"));
                String description = resultSet.getString("description");
                String producer = resultSet.getString("producer");
                product = new Product(id, name, price, description,producer);
            }
        } catch (SQLException e) {
            e.getErrorCode();
        }
        return product;
    }

}
