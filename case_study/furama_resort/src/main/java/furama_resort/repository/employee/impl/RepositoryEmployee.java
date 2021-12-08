package furama_resort.repository.employee.impl;

import furama_resort.bean.Employee;
import furama_resort.repository.employee.IRepositoryEmployee;
import furama_resort.repository.impl.BaseRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RepositoryEmployee implements IRepositoryEmployee {


    @Override
    public List<Employee> getListEmployee() {
        List<Employee> employeeList = new ArrayList<>();

        String query = "select * \n" +
                "from employee;";

        try {
            Statement statement = BaseRepository.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            Employee employee ;
            while (resultSet.next()) {
                employee = new Employee();


                employee.setEmployeeCode(resultSet.getString("employee_id"));
                employee.setFullName(resultSet.getString("employee_name"));
                employee.setDateOfBirth(resultSet.getString("employee_birthday"));
                employee.setIdentityCardNumber(resultSet.getString("employee_id_card"));
                employee.setSalary(Double.parseDouble(resultSet.getString("employee_salary")));
                employee.setPhoneNumber(resultSet.getString("employee_phone"));
                employee.setEmail(resultSet.getString("employee_email"));
                employee.setAddress(resultSet.getString("employee_address"));
                employee.setPosition(Integer.parseInt(resultSet.getString("position_id")));
                employee.setEducationDegree(Integer.parseInt(resultSet.getString("education_degree_id")));
                employee.setDivision(Integer.parseInt(resultSet.getString("division_id")));
                employee.setUserName(resultSet.getString("user_name"));


                employeeList.add(employee);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return employeeList;
    }

    @Override
    public void createEmployee(Employee employee) throws SQLException {
        String query = "insert into employee\n" +
                "values \n" +
                "(?,?,?,?,?,?,?,?,?,?,?,?);";
        PreparedStatement preparedStatement =
                BaseRepository.connection.prepareStatement(query);
        preparedStatement.setString(1, employee.getEmployeeCode());
        preparedStatement.setString(2, employee.getFullName());
        preparedStatement.setString(3, employee.getDateOfBirth());
        preparedStatement.setString(4,employee.getIdentityCardNumber());
        preparedStatement.setString(5, String.valueOf(employee.getSalary()));
        preparedStatement.setString(6, employee.getPhoneNumber());
        preparedStatement.setString(7, employee.getEmail());
        preparedStatement.setString(8, employee.getAddress());
        preparedStatement.setString(9, String.valueOf(employee.getPosition()));
        preparedStatement.setString(10, String.valueOf(employee.getEducationDegree()));
        preparedStatement.setString(11, String.valueOf(employee.getDivision()));
        preparedStatement.setString(12, employee.getUserName());

        preparedStatement.executeUpdate();
    }

    @Override
    public void deleteEmployee(String code) throws SQLException {
        String query = "delete \n" +
                "from employee \n" +
                "where employee_id = ?;";


        PreparedStatement preparedStatement =
                BaseRepository.connection.prepareStatement(query);

        preparedStatement.setString(1, code);
        preparedStatement.executeUpdate();
    }

    @Override
    public Employee selectByEmployeeCode(String code) {
        Employee employee = null;
        String query = "select *" +
                "from employee\n" +
                "where employee_id = ?;";
        try (
                PreparedStatement preparedStatement =
                        BaseRepository.connection.prepareStatement(query)) {
            preparedStatement.setString(1, (code));
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                employee = new Employee();

                employee.setEmployeeCode(code);
                employee.setFullName(resultSet.getString("employee_name"));
                employee.setDateOfBirth(resultSet.getString("employee_birthday"));
                employee.setIdentityCardNumber(resultSet.getString("employee_id_card"));
                employee.setSalary(Double.parseDouble(resultSet.getString("employee_salary")));
                employee.setPhoneNumber(resultSet.getString("employee_phone"));
                employee.setEmail(resultSet.getString("employee_email"));
                employee.setAddress(resultSet.getString("employee_address"));
                employee.setPosition(Integer.parseInt(resultSet.getString("position_id")));
                employee.setEducationDegree(Integer.parseInt(resultSet.getString("education_degree_id")));
                employee.setDivision(Integer.parseInt(resultSet.getString("division_id")));
                employee.setUserName(resultSet.getString("user_name"));
            }
        } catch (SQLException e) {
            e.getErrorCode();
        }
        return employee;
    }

    @Override
    public void editEmployee(Employee employee) {
        String query = "update employee\n" +
                "set employee_name = ?,employee_birthday = ? ,employee_id_card = ? , employee_salary = ?, employee_phone = ?, employee_email = ?, employee_address = ?, position_id = ? ,education_degree_id = ? ,division_id = ?, user_name = ?\n" +
                "where employee_id = ?;";
        try {
            PreparedStatement preparedStatement =
                    BaseRepository.connection.prepareStatement(query);
            preparedStatement.setString(1, employee.getFullName());
            preparedStatement.setString(2, employee.getDateOfBirth());
            preparedStatement.setString(3,employee.getIdentityCardNumber());
            preparedStatement.setString(4, String.valueOf(employee.getSalary()));
            preparedStatement.setString(5, employee.getPhoneNumber());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setString(8, String.valueOf(employee.getPosition()));
            preparedStatement.setString(9, String.valueOf(employee.getEducationDegree()));
            preparedStatement.setString(10, String.valueOf(employee.getDivision()));
            preparedStatement.setString(11, employee.getUserName());
            preparedStatement.setString(12, employee.getEmployeeCode());

            preparedStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Employee> selectByEmployeeName(String name) {
        List<Employee> employeeList = new ArrayList<>();

        String nameFix = ""+name+"%";

        String query = "select * \n" +
                "from employee\n" +
                "where employee_name like ? \n" +
                "order by employee_name;";
        try (
                PreparedStatement preparedStatement =
                        BaseRepository.connection.prepareStatement(query)) {
            preparedStatement.setString(1, nameFix);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Employee employee = new Employee();

                employee.setEmployeeCode(resultSet.getString("employee_id"));
                employee.setFullName(resultSet.getString("employee_name"));
                employee.setDateOfBirth(resultSet.getString("employee_birthday"));
                employee.setIdentityCardNumber(resultSet.getString("employee_id_card"));
                employee.setSalary(Double.parseDouble(resultSet.getString("employee_salary")));
                employee.setPhoneNumber(resultSet.getString("employee_phone"));
                employee.setEmail(resultSet.getString("employee_email"));
                employee.setAddress(resultSet.getString("employee_address"));
                employee.setPosition(Integer.parseInt(resultSet.getString("position_id")));
                employee.setEducationDegree(Integer.parseInt(resultSet.getString("education_degree_id")));
                employee.setDivision(Integer.parseInt(resultSet.getString("division_id")));
                employee.setUserName(resultSet.getString("user_name"));




                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.getErrorCode();
        }
        return employeeList;
    }
}
