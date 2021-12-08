package furama_resort.service.user;

import furama_resort.bean.UserEmployee;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    void createUserEmployee(UserEmployee userEmployee) throws SQLException;

    void createUserEmployeeMore(UserEmployee userEmployee) throws SQLException;

    List<UserEmployee> getListUser();
}
