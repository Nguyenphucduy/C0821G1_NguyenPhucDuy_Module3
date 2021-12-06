package furama_resort.service.impl;

import furama_resort.bean.*;
import furama_resort.repository.IRepositoryService;
import furama_resort.repository.impl.RepositoryService;
import furama_resort.service.IService;

import java.sql.SQLException;
import java.util.List;

public class Service implements IService {
    IRepositoryService iRepositoryService = new RepositoryService();

    @Override
    public void createCustomer(Customer customer) throws SQLException {
        iRepositoryService.createCustomer(customer);
    }

    @Override
    public List<Customer> getListCustomer() {
        return iRepositoryService.getListCustomer();
    }

    @Override
    public void deleteCustomer(String customerCode) throws SQLException {
        iRepositoryService.deleteCustomer(customerCode);
    }

    @Override
    public Customer selectByCustomerCode(String customerCode) {
        return iRepositoryService.selectByCustomerCode(customerCode);
    }

    @Override
    public void updateData(Customer customer) {
        iRepositoryService.updateData(customer);
    }

    @Override
    public List<Customer> selectByName(String name) {
        return iRepositoryService.selectByName(name);
    }
// Service -------------------------------------------------------------------------
    @Override
    public List<ServiceResort> getListSerVice() {
        return iRepositoryService.getListService();
    }

    @Override
    public void createService(ServiceResort serviceResort) throws SQLException {
        iRepositoryService.createService(serviceResort);
    }

    @Override
    public void deleteService(String codeService) throws SQLException {
        iRepositoryService.deleteService(codeService);
    }

    @Override
    public List<ServiceResort> selectServiceByName(String name) {
        return  iRepositoryService.selectServiceByName(name);
    }

    @Override
    public ServiceResort selectByServiceCode(String codeService) {
        return iRepositoryService.selectServiceByCode(codeService);
    }

    @Override
    public void updateService(ServiceResort serviceResort) {
        iRepositoryService.updateService(serviceResort);
    }
//Employee -----------------------------------------------------------------------------------------------------
    @Override
    public List<Employee> getListEmployee() {
        return iRepositoryService.getListEmployee();
    }

    @Override
    public void createEmployee(Employee employee) throws SQLException {
        iRepositoryService.createEmployee(employee);
    }

    @Override
    public void deleteEmployee(String code) throws SQLException {
        iRepositoryService.deleteEmployee(code);
    }

    @Override
    public Employee selectByEmployeCode(String code) {
        return iRepositoryService.selectByEmployeeCode(code);
    }

    @Override
    public void editEmployee(Employee employee) {
        iRepositoryService.editEmployee(employee);
    }

    @Override
    public List<Employee> selectByEmployeeName(String name) {
        return iRepositoryService.selectByEmployeeName(name);
    }
// Contract---------------------------------------------------------------------------------------------
    @Override
    public List<Contract> getListContract() {
        return iRepositoryService.getListContract();
    }

    @Override
    public void createContract(Contract contract) throws SQLException {
        iRepositoryService.createContract(contract);
    }

    @Override
    public void deleteContract(String code) throws SQLException {
        iRepositoryService.deleteContract(code);
    }

    @Override
    public Contract selectByContractCode(String code) {
        return iRepositoryService.selectByContractCode(code);
    }

    @Override
    public void editContract(Contract contract) {
        iRepositoryService.editContract(contract);
    }
// Contract Detail -----------------------------------------------------------
    @Override
    public List<ContractDetail> getListContractDetail() {
        return iRepositoryService.getListContractDetail();
    }

    @Override
    public void createContractDetail(ContractDetail contractDetail) throws SQLException {
        iRepositoryService.createContractDetail(contractDetail);
    }
}
