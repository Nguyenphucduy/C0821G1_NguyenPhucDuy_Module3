package furama_resort.service.employee;

import furama_resort.bean.Employee;

import java.sql.SQLException;
import java.util.List;

public interface IServiceEmployee {

    List<Employee> getListEmployee();

    boolean createEmployee(Employee employee) throws SQLException;

    void deleteEmployee(String code) throws SQLException;

    Employee selectByEmployeCode(String code);

    boolean editEmployee(Employee employee);

    List<Employee> selectByEmployeeName(String name);
}
