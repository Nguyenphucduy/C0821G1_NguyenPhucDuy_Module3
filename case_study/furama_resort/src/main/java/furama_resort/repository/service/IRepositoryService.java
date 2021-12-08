package furama_resort.repository.service;

import furama_resort.bean.ServiceResort;
import furama_resort.bean.TotalMoneyService;

import java.sql.SQLException;
import java.util.List;

public interface IRepositoryService {
    List<ServiceResort> getListService();

    void createService(ServiceResort serviceResort) throws SQLException;

    void deleteService(String codeService) throws SQLException;

    List<ServiceResort> selectServiceByName(String name);

    ServiceResort selectServiceByCode(String codeService);

    void updateService(ServiceResort serviceResort);

    List<TotalMoneyService> getListTotalMoneyService();
}
