package furama_resort.service.employee.impl;

import furama_resort.bean.Employee;
import furama_resort.common.ICommon;
import furama_resort.common.impl.Validate;
import furama_resort.repository.employee.IRepositoryEmployee;
import furama_resort.repository.employee.impl.RepositoryEmployee;
import furama_resort.service.employee.IServiceEmployee;

import java.sql.SQLException;
import java.util.List;

public class ServiceEmployee implements IServiceEmployee {
    ICommon validate = new Validate();
    IRepositoryEmployee iRepositoryEmployee = new RepositoryEmployee();
    @Override
    public List<Employee> getListEmployee() {
        return iRepositoryEmployee.getListEmployee();
    }

    @Override
    public boolean createEmployee(Employee employee) throws SQLException {
        if (!validate.checkEmployee(employee)){
            return false;
        }else {
            iRepositoryEmployee.createEmployee(employee);
            return true;
        }

    }

    @Override
    public void deleteEmployee(String code) throws SQLException {
        iRepositoryEmployee.deleteEmployee(code);
    }

    @Override
    public Employee selectByEmployeCode(String code) {
        return iRepositoryEmployee.selectByEmployeeCode(code);
    }

    @Override
    public boolean editEmployee(Employee employee) {
        if (!validate.checkEmployee(employee)){
            return false;
        }else {
            iRepositoryEmployee.editEmployee(employee);
            return true;
        }
    }

    @Override
    public List<Employee> selectByEmployeeName(String name) {
        return iRepositoryEmployee.selectByEmployeeName(name);
    }
}
