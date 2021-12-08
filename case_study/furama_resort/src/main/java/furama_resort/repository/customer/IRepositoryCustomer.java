package furama_resort.repository.customer;

import furama_resort.bean.Customer;

import java.sql.SQLException;
import java.util.List;

public interface IRepositoryCustomer {
    void createCustomer(Customer customer) throws SQLException;

    List<Customer> getListCustomer();

    void deleteCustomer(String customerCode) throws SQLException;

    Customer selectByCustomerCode(String customerCode);

    void updateData(Customer customer);

    List<Customer> selectByName(String name);
}
