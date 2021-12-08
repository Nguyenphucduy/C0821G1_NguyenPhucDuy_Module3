package furama_resort.controller;

import furama_resort.bean.Contract;
import furama_resort.bean.Customer;
import furama_resort.bean.Employee;
import furama_resort.bean.ServiceResort;
import furama_resort.service.IService;
import furama_resort.service.impl.Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ContractServlet", urlPatterns =  "/contract_servlet")
public class ContractServlet extends HttpServlet {
    IService iService = new Service();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String choose = request.getParameter("choose");

        if (choose == null) {
            choose = "";
        }
        switch (choose) {
            case "create":
                try {
                    createContract(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "edit":
                editContract(request,response);
                break;
//            case "search":
//                searchContract(request,response);
//                break;
        }
    }

    private void editContract(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String contractCode = request.getParameter("contractCode");
        String contractStartDate = request.getParameter("contractStartDate");
        String contractEndDate = request.getParameter("contractEndDate");
        double contractDeposit = Double.parseDouble(request.getParameter("contractDeposit"));
        double contractTotalMoney = Double.parseDouble(request.getParameter("contractTotalMoney"));
        String employeeCode = request.getParameter("employeeCode");
        String customerCode = request.getParameter("customerCode");
        String serviceCode = request.getParameter("serviceCode");
        Contract contract = new Contract(contractCode, contractStartDate, contractEndDate, contractDeposit, contractTotalMoney, employeeCode, customerCode, serviceCode);
        boolean check = iService.editContract(contract);
        if (!check){
            request.setAttribute("messenger","Error Validate");
        }else {
            request.setAttribute("messenger","Update Done");
        }
        getListContract(request, response);
    }

    private void createContract(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String contractCode = request.getParameter("contractCode");
        String contractStartDate = request.getParameter("contractStartDate");
        String contractEndDate = request.getParameter("contractEndDate");
        double contractDeposit = Double.parseDouble(request.getParameter("contractDeposit"));
        double contractTotalMoney = Double.parseDouble(request.getParameter("contractTotalMoney"));
        String employeeCode = request.getParameter("employeeCode");
        String customerCode = request.getParameter("customerCode");
        String serviceCode = request.getParameter("serviceCode");
        Contract contract = new Contract(contractCode, contractStartDate, contractEndDate, contractDeposit, contractTotalMoney, employeeCode, customerCode, serviceCode);

        boolean check = iService.createContract(contract);
        if (!check){
            request.setAttribute("messenger","Error Validate");
        }else {
            request.setAttribute("messenger","Create Done");
        }
        getListContract(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String choose = request.getParameter("choose");

        if (choose == null) {
            choose = "";
        }
        switch (choose) {
            case "create":
                goPageCreate(request, response);
                break;
            case "delete":
                try {
                    deleteContract(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "edit":
                goPageEdit(request,response);
                break;
            default:
                getListContract(request, response);
                break;
        }
    }

    private void goPageEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("contractCode");
        Contract contract = iService.selectByContractCode(code);
        List<Employee> employeeList = iService.getListEmployee();
        List<Customer> customerList = iService.getListCustomer();
        List<ServiceResort> serviceResortList = iService.getListSerVice();
        request.setAttribute("employeeList",employeeList);
        request.setAttribute("customerList",customerList);
        request.setAttribute("serviceResortList",serviceResortList);
        request.setAttribute("contract",contract);
        request.getRequestDispatcher("furama/contract/edit.jsp").forward(request,response);

    }

    private void deleteContract(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String code = request.getParameter("contractCode");
        iService.deleteContract(code);
        getListContract(request,response);
    }

    private void goPageCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> employeeList = iService.getListEmployee();
        List<Customer> customerList = iService.getListCustomer();
        List<ServiceResort> serviceResortList = iService.getListSerVice();
        request.setAttribute("employeeList",employeeList);
        request.setAttribute("customerList",customerList);
        request.setAttribute("serviceResortList",serviceResortList);
        request.getRequestDispatcher("furama/contract/create.jsp").forward(request,response);
    }

    private void getListContract(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Contract> contractList = iService.getListContract();
        request.setAttribute("contractList", contractList);
        request.getRequestDispatcher("furama/contract/list.jsp").forward(request, response);

    }
}
