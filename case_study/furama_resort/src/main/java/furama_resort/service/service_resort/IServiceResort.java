package furama_resort.service.service_resort;

import furama_resort.bean.ServiceResort;
import furama_resort.bean.TotalMoneyService;

import java.sql.SQLException;
import java.util.List;

public interface IServiceResort {
    List<ServiceResort> getListSerVice();

    boolean createService(ServiceResort serviceResort) throws SQLException;

    void deleteService(String codeService) throws SQLException;

    List<ServiceResort> selectServiceByName(String name);

    ServiceResort selectByServiceCode(String codeService);

    boolean updateService(ServiceResort serviceResort);

    List<TotalMoneyService> getListTotalMoneyService();
}
