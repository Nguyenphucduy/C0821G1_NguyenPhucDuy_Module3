package furama_resort.repository.contract;

import furama_resort.bean.Contract;

import java.sql.SQLException;
import java.util.List;

public interface IRepositoryContract {
    List<Contract> getListContract();

    void createContract(Contract contract) throws SQLException;

    void deleteContract(String code) throws SQLException;

    Contract selectByContractCode(String code);

    void editContract(Contract contract);
}
