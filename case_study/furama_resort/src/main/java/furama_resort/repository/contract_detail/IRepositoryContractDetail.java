package furama_resort.repository.contract_detail;

import furama_resort.bean.ContractDetail;
import furama_resort.bean.Customer;
import furama_resort.bean.ServiceAttach;

import java.sql.SQLException;
import java.util.List;

public interface IRepositoryContractDetail {
    List<ContractDetail> getListContractDetail();

    void createContractDetail(ContractDetail contractDetail) throws SQLException;

    List<Customer> getListCustomerUsingService();

    List<ServiceAttach> getListAttachService();
}
