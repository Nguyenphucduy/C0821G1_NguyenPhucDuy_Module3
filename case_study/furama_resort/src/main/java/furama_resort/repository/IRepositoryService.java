package furama_resort.repository;

import furama_resort.bean.*;

import java.sql.SQLException;
import java.util.List;

public interface IRepositoryService {
    void createCustomer(Customer customer) throws SQLException;

    List<Customer> getListCustomer();

    void deleteCustomer(String customerCode) throws SQLException;

    Customer selectByCustomerCode(String customerCode);

    void updateData(Customer customer);

    List<Customer> selectByName(String name);

    List<ServiceResort> getListService();

    void createService(ServiceResort serviceResort) throws SQLException;

    void deleteService(String codeService) throws SQLException;

    List<ServiceResort> selectServiceByName(String name);

    ServiceResort selectServiceByCode(String codeService);

    void updateService(ServiceResort serviceResort);

    List<Employee> getListEmployee();

    void createEmployee(Employee employee) throws SQLException;

    void deleteEmployee(String code) throws SQLException;

    Employee selectByEmployeeCode(String code);

    void editEmployee(Employee employee);

    List<Employee> selectByEmployeeName(String name);

    List<Contract> getListContract();

    void createContract(Contract contract) throws SQLException;

    void deleteContract(String code) throws SQLException;

    Contract selectByContractCode(String code);

    void editContract(Contract contract);

    List<ContractDetail> getListContractDetail();

    void createContractDetail(ContractDetail contractDetail) throws SQLException;

    List<Customer> getListCustomerUsingService();

    List<ServiceAttach> getListAttachService();

    void createUserEmployee(UserEmployee userEmployee) throws SQLException;

    void createUserEmployeeMore(UserEmployee userEmployee) throws SQLException;
}
