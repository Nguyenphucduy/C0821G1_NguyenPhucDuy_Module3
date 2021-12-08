package furama_resort.repository.customer.impl;

import furama_resort.bean.Customer;
import furama_resort.repository.customer.IRepositoryCustomer;
import furama_resort.repository.impl.BaseRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RepositoryCustomer implements IRepositoryCustomer {
    @Override
    public void createCustomer(Customer customer) throws SQLException {

        String query = "INSERT INTO customer \n" +
                "VALUES (?,?,?,?,?,?,?,?,?);";
        PreparedStatement preparedStatement =
                BaseRepository.connection.prepareStatement(query);
        preparedStatement.setString(1, customer.getCustomerCode());
        preparedStatement.setString(2, customer.getFullName());
        preparedStatement.setString(3, customer.getDateOfBirth());
        preparedStatement.setString(4, customer.getGender());
        preparedStatement.setString(5, customer.getIdentityCardNumber());
        preparedStatement.setString(6, customer.getPhoneNumber());
        preparedStatement.setString(7, customer.getEmail());
        preparedStatement.setString(8, customer.getAddress());
        preparedStatement.setString(9, String.valueOf(customer.getCustomerType()));

        preparedStatement.executeUpdate();
    }

    @Override
    public List<Customer> getListCustomer() {
        List<Customer> customerList = new ArrayList<>();

        String query = "select * \n" +
                "from customer;";

        try {
            Statement statement = BaseRepository.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            Customer customer ;
            while (resultSet.next()) {
                customer = new Customer();
                customer.setCustomerCode(resultSet.getString("customer_id"));
                customer.setFullName(resultSet.getString("customer_name"));
                customer.setDateOfBirth(resultSet.getString("customer_birthday"));
                customer.setGender(resultSet.getString("customer_gender"));
                customer.setIdentityCardNumber(resultSet.getString("customer_id_card"));
                customer.setPhoneNumber(resultSet.getString("customer_phone"));
                customer.setEmail(resultSet.getString("customer_email"));
                customer.setCustomerCode(resultSet.getString("customer_id"));
                customer.setAddress(resultSet.getString("customer_address"));
                customer.setCustomerType(Integer.parseInt(resultSet.getString("customer_type_id")));

                customerList.add(customer);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return customerList;
    }

    @Override
    public void deleteCustomer(String customerCode) throws SQLException {
        String query = "delete \n" +
                "from customer \n" +
                "where customer_id = ?;";


        PreparedStatement preparedStatement =
                BaseRepository.connection.prepareStatement(query);

        preparedStatement.setString(1, customerCode);
        preparedStatement.executeUpdate();

    }

    @Override
    public Customer selectByCustomerCode(String customerCode) {
        Customer customer = null;
        String query = "select customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address,customer_type_id\n" +
                "from customer\n" +
                "where customer_id = ?;";
        try (
                PreparedStatement preparedStatement =
                        BaseRepository.connection.prepareStatement(query)) {
            preparedStatement.setString(1, (customerCode));
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("customer_name");
                String dateOfBirth = resultSet.getString("customer_birthday");
                String gender = resultSet.getString("customer_gender");
                String idCard = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                int typeId = Integer.parseInt(resultSet.getString("customer_type_id"));

                customer = new Customer(name, dateOfBirth, gender, idCard, phone, email, address, typeId);
            }
        } catch (SQLException e) {
            e.getErrorCode();
        }
        return customer;
    }

    @Override
    public void updateData(Customer customer) {

        String query = "update customer\n" +
                "set customer_name = ?,customer_birthday = ?,customer_gender = ?,customer_id_card = ?\n" +
                ",customer_phone = ? ,customer_email = ?,customer_address = ?,customer_type_id = ?\n" +
                "where customer_id = ?;";
        try {
            PreparedStatement statement =
                    BaseRepository.connection.prepareStatement(query);
            statement.setString(1, customer.getFullName());
            statement.setString(2, customer.getDateOfBirth());
            statement.setString(3, customer.getGender());
            statement.setString(4, customer.getIdentityCardNumber());
            statement.setString(5, customer.getPhoneNumber());
            statement.setString(6, customer.getEmail());
            statement.setString(7, customer.getAddress());
            statement.setString(8, String.valueOf(customer.getCustomerType()));
            statement.setString(9, String.valueOf(customer.getCustomerCode()));

            statement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Customer> selectByName(String name) {
        List<Customer> customerList = new ArrayList<>();

        String nameFix = ""+name+"%";


        String query = "select * \n" +
                "from customer\n" +
                "where customer_name like ?  \n" +
                "order by customer_name;";
        try (
                PreparedStatement preparedStatement =
                        BaseRepository.connection.prepareStatement(query)) {
            preparedStatement.setString(1, nameFix);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String codeCustomer = resultSet.getString("customer_id");
                String nameCustomer = resultSet.getString("customer_name");
                String birthdayCustomer = resultSet.getString("customer_birthday");
                String genderCustomer = resultSet.getString("customer_gender");
                String idCardCustomer = resultSet.getString("customer_id_card");
                String phoneCustomer = resultSet.getString("customer_phone");
                String emailCustomer = resultSet.getString("customer_email");
                String addressCustomer = resultSet.getString("customer_address");
                int idTypeCustomer = Integer.parseInt(resultSet.getString("customer_type_id"));

                customerList.add(new Customer( nameCustomer, birthdayCustomer, genderCustomer,idCardCustomer,phoneCustomer,emailCustomer,codeCustomer,addressCustomer,idTypeCustomer));
            }
        } catch (SQLException e) {
            e.getErrorCode();
        }
        return customerList;
    }
}
