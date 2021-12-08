package furama_resort.controller;

import furama_resort.bean.Contract;
import furama_resort.bean.ContractDetail;
import furama_resort.service.contract.IServiceContract;
import furama_resort.service.contract.impl.ServiceContract;
import furama_resort.service.contract_detail.IServiceContractDetail;
import furama_resort.service.contract_detail.impl.ServiceContractDetail;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ContractDetailServlet" , urlPatterns = "/contract_detail_servlet")
public class ContractDetailServlet extends HttpServlet {
    IServiceContractDetail iServiceContractDetail = new ServiceContractDetail();
    IServiceContract iServiceContract = new ServiceContract();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String choose = request.getParameter("choose");

        if (choose == null) {
            choose = "";
        }
        switch (choose) {
            case "create":
                try {
                    createContractDetail(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "edit":
                break;
            case "search":
                break;
        }
    }

    private void createContractDetail(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
//        int contractDetailCode = Integer.parseInt(request.getParameter("contractDetailCode"));
        String contractCode = request.getParameter("contractCode");
        int attachServiceCode = Integer.parseInt(request.getParameter("attachServiceCode"));
        ContractDetail contractDetail = new ContractDetail(contractCode,attachServiceCode);
        iServiceContractDetail.createContractDetail(contractDetail);
        getListContractDetail(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String choose = request.getParameter("choose");

        if (choose == null) {
            choose = "";
        }
        switch (choose) {
            case "create":
                goPageCreate(request,response);
                break;
            case "edit":
                break;
            case "search":
                break;
            default:
                getListContractDetail(request,response);
                break;
        }
    }

    private void goPageCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Contract> contractList = iServiceContract.getListContract();
        request.setAttribute("contractList",contractList);
        request.getRequestDispatcher("furama/contract_detail/create.jsp").forward(request, response);
    }

    private void getListContractDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ContractDetail>  contractDetailList = iServiceContractDetail.getListContractDetail();
        request.setAttribute("contractDetailList",contractDetailList);
        request.getRequestDispatcher("furama/contract_detail/list.jsp").forward(request, response);
    }
}
