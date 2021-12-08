//package furama_resort.service.z.impl;
//
//import furama_resort.bean.*;
//import furama_resort.common.ICommon;
//import furama_resort.common.impl.Validate;
//import furama_resort.repository.IRepositoryService;
//import furama_resort.repository.z.impl.RepositoryService;
//import furama_resort.service.IService;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.sql.SQLException;
//import java.util.List;
//
//public class Service implements IService {
//    IRepositoryService iRepositoryService = new RepositoryService();
//    ICommon validate = new Validate();
//    @Override
//    public boolean createCustomer(Customer customer) throws SQLException {
//        if(validate.checkCustomer(customer)) {
//            iRepositoryService.createCustomer(customer);
//            return true;
//        } else {
//            return false;
//        }
//    }
//
//    @Override
//    public List<Customer> getListCustomer() {
//        if (iRepositoryService.getListCustomer().size()==0){
//            return null;
//        }else {
//            return iRepositoryService.getListCustomer();
//        }
//    }
//
//    @Override
//    public void deleteCustomer(String customerCode) throws SQLException {
//        iRepositoryService.deleteCustomer(customerCode);
//    }
//
//    @Override
//    public Customer selectByCustomerCode(String customerCode) {
//        return iRepositoryService.selectByCustomerCode(customerCode);
//    }
//
//    @Override
//    public boolean updateData(Customer customer) {
//        if(validate.checkCustomer(customer)) {
//            iRepositoryService.updateData(customer);
//            return true;
//        } else {
//            return false;
//        }
//    }
//
//    @Override
//    public List<Customer> selectByName(String name) {
//        return iRepositoryService.selectByName(name);
//    }
//// Service -------------------------------------------------------------------------
//    @Override
//    public List<ServiceResort> getListSerVice() {
//        return iRepositoryService.getListService();
//    }
//
//    @Override
//    public boolean createService(ServiceResort serviceResort) throws SQLException {
//        if (!validate.checkService(serviceResort)){
//            return false;
//        }else {
//            iRepositoryService.createService(serviceResort);
//            return true;
//        }
//    }
//
//    @Override
//    public void deleteService(String codeService) throws SQLException {
//        iRepositoryService.deleteService(codeService);
//    }
//
//    @Override
//    public List<ServiceResort> selectServiceByName(String name) {
//        return  iRepositoryService.selectServiceByName(name);
//    }
//
//    @Override
//    public ServiceResort selectByServiceCode(String codeService) {
//        return iRepositoryService.selectServiceByCode(codeService);
//    }
//
//    @Override
//    public boolean updateService(ServiceResort serviceResort) {
//        if (!validate.checkService(serviceResort)){
//            return false;
//
//        }else {
//            iRepositoryService.updateService(serviceResort);
//            return true;
//        }
//
//    }
////Employee -----------------------------------------------------------------------------------------------------
//    @Override
//    public List<Employee> getListEmployee() {
//        return iRepositoryService.getListEmployee();
//    }
//
//    @Override
//    public boolean createEmployee(Employee employee) throws SQLException {
//        if (!validate.checkEmployee(employee)){
//            return false;
//        }else {
//            iRepositoryService.createEmployee(employee);
//            return true;
//        }
//
//    }
//
//    @Override
//    public void deleteEmployee(String code) throws SQLException {
//        iRepositoryService.deleteEmployee(code);
//    }
//
//    @Override
//    public Employee selectByEmployeCode(String code) {
//        return iRepositoryService.selectByEmployeeCode(code);
//    }
//
//    @Override
//    public boolean editEmployee(Employee employee) {
//        if (!validate.checkEmployee(employee)){
//            return false;
//        }else {
//            iRepositoryService.editEmployee(employee);
//            return true;
//        }
//    }
//
//    @Override
//    public List<Employee> selectByEmployeeName(String name) {
//        return iRepositoryService.selectByEmployeeName(name);
//    }
//// Contract---------------------------------------------------------------------------------------------
//    @Override
//    public List<Contract> getListContract() {
//        return iRepositoryService.getListContract();
//    }
//
//    @Override
//    public boolean createContract(Contract contract) throws SQLException {
//        if (!validate.checkContract(contract)){
//            return false;
//        }else {
//            iRepositoryService.createContract(contract);
//            return true;
//        }
//
//    }
//
//    @Override
//    public void deleteContract(String code) throws SQLException {
//        iRepositoryService.deleteContract(code);
//    }
//
//    @Override
//    public Contract selectByContractCode(String code) {
//        return iRepositoryService.selectByContractCode(code);
//    }
//
//    @Override
//    public boolean editContract(Contract contract) {
//        if (!validate.checkContract(contract)){
//            return false;
//        }else {
//            iRepositoryService.editContract(contract);
//            return true;
//        }
//    }
//// Contract Detail -----------------------------------------------------------
//    @Override
//    public List<ContractDetail> getListContractDetail() {
//        return iRepositoryService.getListContractDetail();
//    }
//
//    @Override
//    public void createContractDetail(ContractDetail contractDetail) throws SQLException {
//        iRepositoryService.createContractDetail(contractDetail);
//    }
//    // Customer Using Service
//    @Override
//    public List<Customer> getListCustomerUsingService(HttpServletRequest request, HttpServletResponse response) {
//        return iRepositoryService.getListCustomerUsingService();
//    }
//
//    @Override
//    public List<ServiceAttach> getListAttachService(HttpServletRequest request, HttpServletResponse response) {
//        return iRepositoryService.getListAttachService();
//    }
//// User-----------------------------------------------
//    @Override
//    public void createUserEmployee(UserEmployee userEmployee) throws SQLException {
//        iRepositoryService.createUserEmployee(userEmployee);
//    }
//
//    @Override
//    public void createUserEmployeeMore(UserEmployee userEmployee) throws SQLException {
//        iRepositoryService.createUserEmployeeMore(userEmployee);
//    }
//
//
//}
