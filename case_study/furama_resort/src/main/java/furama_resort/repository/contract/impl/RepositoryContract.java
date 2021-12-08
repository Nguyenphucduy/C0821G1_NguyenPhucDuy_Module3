package furama_resort.repository.contract.impl;

import furama_resort.bean.Contract;
import furama_resort.repository.contract.IRepositoryContract;
import furama_resort.repository.BaseRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RepositoryContract implements IRepositoryContract {
    @Override
    public List<Contract> getListContract() {
        List<Contract> contractList = new ArrayList<>();

        String query = "select *\n" +
                "from contract;";

        try {
            Statement statement = BaseRepository.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            Contract contract ;
            while (resultSet.next()) {
                contract = new Contract();


                contract.setContractCode(resultSet.getString("contract_id"));
                contract.setContractStartDate(resultSet.getString("contract_start_date"));
                contract.setContractEndDate(resultSet.getString("contract_end_date"));
                contract.setContractDeposit(Double.parseDouble(resultSet.getString("contract_deposit")));
                contract.setContractTotalMoney(Double.parseDouble(resultSet.getString("contract_total_money")));
                contract.setEmployeeCode(resultSet.getString("employee_id"));
                contract.setCustomerCode(resultSet.getString("customer_id"));
                contract.setServiceCode(resultSet.getString("service_id"));

                contractList.add(contract);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return contractList;
    }

    @Override
    public void createContract(Contract contract) throws SQLException {
        String query = "insert into contract\n" +
                "values \n" +
                "(?,?,?,?,?,?,?,?);";
        PreparedStatement preparedStatement =
                BaseRepository.connection.prepareStatement(query);
        preparedStatement.setString(1, contract.getContractCode());
        preparedStatement.setString(2, contract.getContractStartDate());
        preparedStatement.setString(3, contract.getContractEndDate());
        preparedStatement.setString(4, String.valueOf(contract.getContractDeposit()));
        preparedStatement.setString(5, String.valueOf(contract.getContractTotalMoney()));
        preparedStatement.setString(6, contract.getEmployeeCode());
        preparedStatement.setString(7, contract.getCustomerCode());
        preparedStatement.setString(8, contract.getServiceCode());

        preparedStatement.executeUpdate();
    }

    @Override
    public void deleteContract(String code) throws SQLException {
        String query = " delete \n" +
                " from contract \n" +
                " where contract_id = ?;";
        PreparedStatement preparedStatement =
                BaseRepository.connection.prepareStatement(query);
        preparedStatement.setString(1, code);


        preparedStatement.executeUpdate();
    }

    @Override
    public Contract selectByContractCode(String code) {
        Contract contract = null;
        String query = "select *" +
                "from contract\n" +
                "where contract_id = ?;";
        try (
                PreparedStatement preparedStatement =
                        BaseRepository.connection.prepareStatement(query)) {
            preparedStatement.setString(1, (code));
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                contract = new Contract();

                contract.setContractCode(code);
                contract.setContractStartDate(resultSet.getString("contract_start_date"));
                contract.setContractEndDate(resultSet.getString("contract_end_date"));
                contract.setContractDeposit(Double.parseDouble(resultSet.getString("contract_deposit")));
                contract.setContractTotalMoney(Double.parseDouble(resultSet.getString("contract_total_money")));
                contract.setEmployeeCode(resultSet.getString("employee_id"));
                contract.setCustomerCode(resultSet.getString("customer_id"));
                contract.setServiceCode(resultSet.getString("service_id"));
            }
        } catch (SQLException e) {
            e.getErrorCode();
        }
        return contract;
    }

    @Override
    public void editContract(Contract contract) {
        String query = "update contract \n" +
                "set contract_start_date = ?,contract_end_date = ? ,contract_deposit = ? , contract_total_money = ?, employee_id = ?, customer_id = ?, service_id = ?\n" +
                "where contract_id = ?;";
        try {
            PreparedStatement preparedStatement =
                    BaseRepository.connection.prepareStatement(query);
            preparedStatement.setString(1, contract.getContractStartDate());
            preparedStatement.setString(2, contract.getContractEndDate());
            preparedStatement.setString(3, String.valueOf(contract.getContractDeposit()));
            preparedStatement.setString(4, String.valueOf(contract.getContractTotalMoney()));
            preparedStatement.setString(5, contract.getEmployeeCode());
            preparedStatement.setString(6, contract.getCustomerCode());
            preparedStatement.setString(7, contract.getServiceCode());
            preparedStatement.setString(8, contract.getContractCode());

            preparedStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

}
