package furama_resort.service;

import furama_resort.bean.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;

public interface IService {
    boolean createCustomer(Customer customer) throws SQLException;

    List<Customer> getListCustomer();

    void deleteCustomer(String customerCode) throws SQLException;

    Customer selectByCustomerCode(String customerCode);

    boolean updateData(Customer customer);

    List<Customer> selectByName(String name);
    //Service-------------------------------------------------

    List<ServiceResort> getListSerVice();

    boolean createService(ServiceResort serviceResort) throws SQLException;

    void deleteService(String codeService) throws SQLException;

    List<ServiceResort> selectServiceByName(String name);

    ServiceResort selectByServiceCode(String codeService);

    boolean updateService(ServiceResort serviceResort);
    //Employee-------------------------------------------------

    List<Employee> getListEmployee();

    boolean createEmployee(Employee employee) throws SQLException;

    void deleteEmployee(String code) throws SQLException;

    Employee selectByEmployeCode(String code);

    boolean editEmployee(Employee employee);

    List<Employee> selectByEmployeeName(String name);

    List<Contract> getListContract();
    //Contract-------------------------------------------------

    boolean createContract(Contract contract) throws SQLException;

    void deleteContract(String code) throws SQLException;

    Contract selectByContractCode(String code);

    boolean editContract(Contract contract);
    //Contract Detail -------------------------------------------------------

    List<ContractDetail> getListContractDetail();

    void createContractDetail(ContractDetail contractDetail) throws SQLException;

    List<Customer> getListCustomerUsingService(HttpServletRequest request, HttpServletResponse response);

    List<ServiceAttach> getListAttachService(HttpServletRequest request, HttpServletResponse response);

    // User --------------------------------------------

    void createUserEmployee(UserEmployee userEmployee) throws SQLException;

    void createUserEmployeeMore(UserEmployee userEmployee) throws SQLException;
}
