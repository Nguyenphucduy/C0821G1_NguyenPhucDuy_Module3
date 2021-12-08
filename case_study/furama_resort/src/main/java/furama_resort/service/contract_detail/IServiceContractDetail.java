package furama_resort.service.contract_detail;

import furama_resort.bean.ContractDetail;
import furama_resort.bean.Customer;
import furama_resort.bean.ServiceAttach;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;

public interface IServiceContractDetail {

    List<ContractDetail> getListContractDetail();

    void createContractDetail(ContractDetail contractDetail) throws SQLException;

    List<Customer> getListCustomerUsingService(HttpServletRequest request, HttpServletResponse response);

    List<ServiceAttach> getListAttachService(HttpServletRequest request, HttpServletResponse response);
}
