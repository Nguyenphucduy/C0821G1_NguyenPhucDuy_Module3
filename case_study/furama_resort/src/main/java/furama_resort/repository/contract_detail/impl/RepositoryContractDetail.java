package furama_resort.repository.contract_detail.impl;

import furama_resort.bean.ContractDetail;
import furama_resort.bean.Customer;
import furama_resort.bean.ServiceAttach;
import furama_resort.repository.contract_detail.IRepositoryContractDetail;
import furama_resort.repository.BaseRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RepositoryContractDetail implements IRepositoryContractDetail {

    @Override
    public List<ContractDetail> getListContractDetail() {
        List<ContractDetail> contractDetailList = new ArrayList<>();

        String query = "select * \n" +
                "from contract_detail;";

        try {
            Statement statement = BaseRepository.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            ContractDetail contractDetail ;
            while (resultSet.next()) {
                contractDetail = new ContractDetail();


                contractDetail.setContractDetailCode(Integer.parseInt(resultSet.getString("contract_detail_id")));
                contractDetail.setContractCode(resultSet.getString("contract_id"));
                contractDetail.setAttachServiceCode(Integer.parseInt(resultSet.getString("attach_service_id")));


                contractDetailList.add(contractDetail);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return contractDetailList;
    }

    @Override
    public void createContractDetail(ContractDetail contractDetail) throws SQLException {

        String query = "insert into contract_detail\n" +
                "(contract_id,attach_service_id)\n" +
                "values \n" +
                "(?,?);";
        PreparedStatement preparedStatement =
                BaseRepository.connection.prepareStatement(query);
        preparedStatement.setString(1, contractDetail.getContractCode());
        preparedStatement.setString(2, String.valueOf(contractDetail.getAttachServiceCode()));

        preparedStatement.executeUpdate();
    }
    // List Customer Using Service
    @Override
    public List<Customer> getListCustomerUsingService() {
        List<Customer> customerList = new ArrayList<>();


        String query = "select  customer.customer_id,customer.customer_name,customer.customer_birthday,customer.customer_gender,customer.customer_id_card,customer.customer_phone,customer.customer_email,customer.customer_address,customer.customer_type_id,attach_service.attach_service_name\n" +
                "from customer\n" +
                "join contract on customer.customer_id = contract.customer_id\n" +
                "join service on contract.service_id = service.service_id\n" +
                "join contract_detail on contract.contract_id = contract_detail.contract_id\n" +
                "join attach_service on contract_detail.attach_service_id = attach_service.attach_service_id\n" +
                "group by customer.customer_id,attach_service.attach_service_id;";

        try {
            Statement statement = BaseRepository.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            Customer customer ;
            while (resultSet.next()) {
                customer = new Customer();
                customer.setCustomerCode(resultSet.getString("customer_id"));
                customer.setFullName(resultSet.getString("customer_name"));
                customer.setDateOfBirth(resultSet.getString("customer_birthday"));
                customer.setGender(resultSet.getString("customer_gender"));
                customer.setIdentityCardNumber(resultSet.getString("customer_id_card"));
                customer.setPhoneNumber(resultSet.getString("customer_phone"));
                customer.setEmail(resultSet.getString("customer_email"));
                customer.setCustomerCode(resultSet.getString("customer_id"));
                customer.setAddress(resultSet.getString("customer_address"));
                customer.setCustomerType(Integer.parseInt(resultSet.getString("customer_type_id")));

                customerList.add(customer);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return customerList;
    }

    @Override
    public List<ServiceAttach> getListAttachService() {
        List<ServiceAttach> serviceAttachList = new ArrayList<>();


        String query = "select attach_service.attach_service_id,attach_service.attach_service_name,attach_service.attach_service_cost,attach_service.attach_service_unit,attach_service.attach_service_quantity,attach_service.attach_service_status\n" +
                "from customer\n" +
                "join contract on customer.customer_id = contract.customer_id\n" +
                "join service on contract.service_id = service.service_id\n" +
                "join contract_detail on contract.contract_id = contract_detail.contract_id\n" +
                "join attach_service on contract_detail.attach_service_id = attach_service.attach_service_id\n" +
                "group by customer.customer_id,attach_service.attach_service_id;";

        try {
            Statement statement = BaseRepository.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            ServiceAttach serviceAttach ;
            while (resultSet.next()) {
                serviceAttach = new ServiceAttach();
                serviceAttach.setAttachServiceCode(Integer.parseInt(resultSet.getString("attach_service_id")));
                serviceAttach.setAttachServiceName(resultSet.getString("attach_service_name"));
                serviceAttach.setAttachServiceCost(Double.parseDouble(resultSet.getString("attach_service_cost")));
                serviceAttach.setAttachServiceUnit(resultSet.getString("attach_service_unit"));
                serviceAttach.setAttachServiceQuantity(Integer.valueOf(resultSet.getString("attach_service_quantity")));
                serviceAttach.setAttachServiceStatus(resultSet.getString("attach_service_status"));

                serviceAttachList.add(serviceAttach);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return serviceAttachList;
    }
}
