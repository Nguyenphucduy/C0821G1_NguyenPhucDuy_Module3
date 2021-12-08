package furama_resort.service.contract;

import furama_resort.bean.Contract;

import java.sql.SQLException;
import java.util.List;

public interface IServiceContract {
    List<Contract> getListContract();


    boolean createContract(Contract contract) throws SQLException;

    void deleteContract(String code) throws SQLException;

    Contract selectByContractCode(String code);

    boolean editContract(Contract contract);
}
