package demo_database.repository;

import demo_database.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {


    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;
    void addUserTransaction(User user);
}
