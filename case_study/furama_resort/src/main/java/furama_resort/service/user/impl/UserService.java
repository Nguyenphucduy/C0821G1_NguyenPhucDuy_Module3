package furama_resort.service.user.impl;

import furama_resort.bean.UserEmployee;
import furama_resort.repository.user.IRepositoryUser;
import furama_resort.repository.user.impl.RepositoryUser;
import furama_resort.service.user.IUserService;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    IRepositoryUser iUserRepository = new RepositoryUser();
    @Override
    public void createUserEmployee(UserEmployee userEmployee) throws SQLException {
        iUserRepository.createUserEmployee(userEmployee);
    }

    @Override
    public void createUserEmployeeMore(UserEmployee userEmployee) throws SQLException {
        iUserRepository.createUserEmployeeMore(userEmployee);
    }

    @Override
    public List<UserEmployee> getListUser() {
        return iUserRepository.getListUser();
    }
}
