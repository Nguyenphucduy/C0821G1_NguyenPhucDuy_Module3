package furama_resort.service.customer;

import furama_resort.bean.Customer;

import java.sql.SQLException;
import java.util.List;

public interface IServiceCustomer {
    boolean createCustomer(Customer customer) throws SQLException;

    List<Customer> getListCustomer();

    void deleteCustomer(String customerCode) throws SQLException;

    Customer selectByCustomerCode(String customerCode);

    boolean updateData(Customer customer);

    List<Customer> selectByName(String name);
}
