package furama_resort.repository.employee;

import furama_resort.bean.Employee;

import java.sql.SQLException;
import java.util.List;

public interface IRepositoryEmployee {

    List<Employee> getListEmployee();

    void createEmployee(Employee employee) throws SQLException;

    void deleteEmployee(String code) throws SQLException;

    Employee selectByEmployeeCode(String code);

    void editEmployee(Employee employee);

    List<Employee> selectByEmployeeName(String name);
}
