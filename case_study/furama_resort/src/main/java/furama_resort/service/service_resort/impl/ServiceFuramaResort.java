package furama_resort.service.service_resort.impl;

import furama_resort.bean.TotalMoneyService;
import furama_resort.common.impl.Validate;
import furama_resort.repository.service.IRepositoryService;
import furama_resort.repository.service.impl.RepositoryService;
import furama_resort.service.service_resort.IServiceResort;

import java.sql.SQLException;
import java.util.List;

public class ServiceFuramaResort implements IServiceResort {
    IRepositoryService iRepositoryService = new RepositoryService();
    Validate validate = new Validate();
    @Override
    public List<furama_resort.bean.ServiceResort> getListSerVice() {
        if (iRepositoryService.getListService().size()==0){
            return null;
        }else {
            return iRepositoryService.getListService();
        }

    }

    @Override
    public boolean createService(furama_resort.bean.ServiceResort serviceResort) throws SQLException {
        if (!validate.checkService(serviceResort)){
            return false;
        }else {
            iRepositoryService.createService(serviceResort);
            return true;
        }
    }

    @Override
    public void deleteService(String codeService) throws SQLException {
        iRepositoryService.deleteService(codeService);
    }

    @Override
    public List<furama_resort.bean.ServiceResort> selectServiceByName(String name) {
        return  iRepositoryService.selectServiceByName(name);
    }

    @Override
    public furama_resort.bean.ServiceResort selectByServiceCode(String codeService) {
        return iRepositoryService.selectServiceByCode(codeService);
    }

    @Override
    public boolean updateService(furama_resort.bean.ServiceResort serviceResort) {
        if (!validate.checkService(serviceResort)){
            return false;

        }else {
            iRepositoryService.updateService(serviceResort);
            return true;
        }

    }

    @Override
    public List<TotalMoneyService> getListTotalMoneyService() {
        return iRepositoryService.getListTotalMoneyService();
    }
}
