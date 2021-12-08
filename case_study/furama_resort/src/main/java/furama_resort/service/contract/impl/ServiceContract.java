package furama_resort.service.contract.impl;

import furama_resort.bean.Contract;
import furama_resort.common.ICommon;
import furama_resort.common.impl.Validate;
import furama_resort.repository.contract.IRepositoryContract;
import furama_resort.repository.contract.impl.RepositoryContract;
import furama_resort.service.contract.IServiceContract;

import java.sql.SQLException;
import java.util.List;

public class ServiceContract implements IServiceContract {
    ICommon validate = new Validate();
    IRepositoryContract iRepositoryContract = new RepositoryContract();
    @Override
    public List<Contract> getListContract() {
        if (iRepositoryContract.getListContract().size()==0){
            return null;
        }else {
            return iRepositoryContract.getListContract();
        }

    }

    @Override
    public boolean createContract(Contract contract) throws SQLException {
        if (!validate.checkContract(contract)){
            return false;
        }else {
            iRepositoryContract.createContract(contract);
            return true;
        }

    }

    @Override
    public void deleteContract(String code) throws SQLException {
        iRepositoryContract.deleteContract(code);
    }

    @Override
    public Contract selectByContractCode(String code) {
        return iRepositoryContract.selectByContractCode(code);
    }

    @Override
    public boolean editContract(Contract contract) {
        if (!validate.checkContract(contract)){
            return false;
        }else {
            iRepositoryContract.editContract(contract);
            return true;
        }
    }
}
