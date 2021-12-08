package furama_resort.repository.user.impl;

import furama_resort.bean.ServiceResort;
import furama_resort.bean.UserEmployee;
import furama_resort.repository.BaseRepository;
import furama_resort.repository.user.IRepositoryUser;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RepositoryUser implements IRepositoryUser {
    @Override
    public void createUserEmployee(UserEmployee userEmployee) throws SQLException {

        String query = "insert into user\n" +
                "values\n" +
                "(?,?);";
        PreparedStatement preparedStatement =
                BaseRepository.connection.prepareStatement(query);
        preparedStatement.setString(1, userEmployee.getUserName());
        preparedStatement.setString(2, userEmployee.getPassword());


        preparedStatement.executeUpdate();
    }
    @Override
    public void createUserEmployeeMore(UserEmployee userEmployee) throws SQLException {

        String query = "insert into user\n" +
                "(user_name)\n" +
                "values\n" +
                "(?);";
        PreparedStatement preparedStatement =
                BaseRepository.connection.prepareStatement(query);
        preparedStatement.setString(1, userEmployee.getUserName());


        preparedStatement.executeUpdate();
    }

    @Override
    public List<UserEmployee> getListUser() {
        List<UserEmployee> userEmployeeList = new ArrayList<>();

        String query = "select * \n" +
                " from `user`;";

        try {
            Statement statement = BaseRepository.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            UserEmployee userEmployee ;
            while (resultSet.next()) {
                userEmployee = new UserEmployee();

                userEmployee.setUserName(resultSet.getString("user_name"));
                userEmployee.setPassword(resultSet.getString("password"));

                userEmployeeList.add(userEmployee);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return userEmployeeList;
    }
}
