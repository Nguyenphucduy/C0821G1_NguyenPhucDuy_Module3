package furama_resort.service.contract_detail.impl;

import furama_resort.bean.ContractDetail;
import furama_resort.bean.Customer;
import furama_resort.bean.ServiceAttach;
import furama_resort.repository.contract_detail.IRepositoryContractDetail;
import furama_resort.repository.contract_detail.impl.RepositoryContractDetail;
import furama_resort.service.contract_detail.IServiceContractDetail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;

public class ServiceContractDetail implements IServiceContractDetail {
    IRepositoryContractDetail iRepositoryContractDetail = new RepositoryContractDetail();
    @Override
    public List<ContractDetail> getListContractDetail() {
        return iRepositoryContractDetail.getListContractDetail();
    }

    @Override
    public void createContractDetail(ContractDetail contractDetail) throws SQLException {
        iRepositoryContractDetail.createContractDetail(contractDetail);
    }
    // Customer Using Service
    @Override
    public List<Customer> getListCustomerUsingService(HttpServletRequest request, HttpServletResponse response) {
        return iRepositoryContractDetail.getListCustomerUsingService();
    }

    @Override
    public List<ServiceAttach> getListAttachService(HttpServletRequest request, HttpServletResponse response) {
        return iRepositoryContractDetail.getListAttachService();
    }
}
