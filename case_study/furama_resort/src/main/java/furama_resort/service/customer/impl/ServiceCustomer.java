package furama_resort.service.customer.impl;

import furama_resort.bean.Customer;
import furama_resort.common.ICommon;
import furama_resort.common.impl.Validate;

import furama_resort.repository.customer.IRepositoryCustomer;
import furama_resort.repository.customer.impl.RepositoryCustomer;

import furama_resort.service.customer.IServiceCustomer;

import java.sql.SQLException;
import java.util.List;

public class ServiceCustomer implements IServiceCustomer {
    ICommon validate = new Validate();
    IRepositoryCustomer iRepositoryCustomer = new RepositoryCustomer();
    @Override
    public boolean createCustomer(Customer customer) throws SQLException {
        if(validate.checkCustomer(customer)) {
            iRepositoryCustomer.createCustomer(customer);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<Customer> getListCustomer() {
        if (iRepositoryCustomer.getListCustomer().size()==0){
            return null;
        }else {
            return iRepositoryCustomer.getListCustomer();
        }
    }

    @Override
    public void deleteCustomer(String customerCode) throws SQLException {
        iRepositoryCustomer.deleteCustomer(customerCode);
    }

    @Override
    public Customer selectByCustomerCode(String customerCode) {
        return iRepositoryCustomer.selectByCustomerCode(customerCode);
    }

    @Override
    public boolean updateData(Customer customer) {
        if(validate.checkCustomer(customer)) {
            iRepositoryCustomer.updateData(customer);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<Customer> selectByName(String name) {
        return iRepositoryCustomer.selectByName(name);
    }
}
