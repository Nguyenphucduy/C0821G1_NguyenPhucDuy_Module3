package furama_resort.controller;

import furama_resort.bean.Customer;
import furama_resort.bean.ServiceAttach;
import furama_resort.bean.ServiceResort;

import furama_resort.bean.TotalMoneyService;
import furama_resort.service.contract_detail.IServiceContractDetail;
import furama_resort.service.contract_detail.impl.ServiceContractDetail;

import furama_resort.service.service_resort.IServiceResort;
import furama_resort.service.service_resort.impl.ServiceFuramaResort;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ServiceServlet" , urlPatterns = "/service_servlet")
public class ServiceServlet extends HttpServlet {
    IServiceResort iServiceResort = new ServiceFuramaResort();
    IServiceContractDetail iServiceContractDetail = new ServiceContractDetail();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String choose = request.getParameter("choose");

        if (choose == null) {
            choose = "";
        }
        switch (choose) {
            case "create":
                try {
                    createService(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "edit":
                editService(request,response);
                break;
            case "delete":
                try {
                    deleteService(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "search":
                searchService(request,response);
                break;
        }
    }

    private void editService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("codeService");
        String name = request.getParameter("nameService");
        double area = Double.parseDouble(request.getParameter("usableArea"));
        double rentCost = Double.parseDouble(request.getParameter("rentCost"));
        int numberOfPeople = Integer.parseInt(request.getParameter("numberOfPeople"));
        int serviceTypeId = Integer.parseInt(request.getParameter("serviceTypeId"));
        int rentalType = Integer.parseInt(request.getParameter("rentalType"));
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        ServiceResort serviceResort = new ServiceResort(code,name,area,rentCost,numberOfPeople,serviceTypeId,rentalType,standardRoom,descriptionOtherConvenience,poolArea,numberOfFloors);
        boolean check = iServiceResort.updateService(serviceResort);
        if (check){
            request.setAttribute("messenger","Update Done");
        }else {
            request.setAttribute("messenger","Error Validate");
        }
        getListService(request,response);
    }

    private void searchService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("nameService");
        List<ServiceResort> serviceResortList = iServiceResort.selectServiceByName(name);
        request.setAttribute("serviceResortList",serviceResortList);
        request.getRequestDispatcher("furama/service/list.jsp").forward(request, response);

     }

    private void createService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String code = request.getParameter("codeService");
        String name = request.getParameter("nameService");
        double area = Double.parseDouble(request.getParameter("usableArea"));
        double rentCost = Double.parseDouble(request.getParameter("rentCost"));
        int numberOfPeople = Integer.parseInt(request.getParameter("numberOfPeople"));
        int serviceTypeId = Integer.parseInt(request.getParameter("serviceTypeId"));
        int rentalType = Integer.parseInt(request.getParameter("rentalType"));
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));

        ServiceResort serviceResort = new ServiceResort(code,name,area,rentCost,numberOfPeople,serviceTypeId,rentalType,standardRoom,descriptionOtherConvenience,poolArea,numberOfFloors);

        boolean check = iServiceResort.createService(serviceResort);
        if (check){
            request.setAttribute("messenger","Create Done");
        }else {
            request.setAttribute("messenger","Error Validate");
        }

        getListService(request,response);
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
                goPageEdit(request,response);
                break;
//            case "delete":
//                try {
//                    deleteService(request,response);
//                } catch (SQLException throwables) {
//                    throwables.printStackTrace();
//                }
//                break;
            case "totalMoney":
                getListTotalMoneyService(request,response);
                break;
            case "getListCustomer":
                getListCustomerUsingService(request,response);
                break;
            default:
                getListService(request,response);
                break;
        }
    }

    private void getListTotalMoneyService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<TotalMoneyService> totalMoneyServices = this.iServiceResort.getListTotalMoneyService();
        request.setAttribute("totalMoneyServices",totalMoneyServices);
        request.getRequestDispatcher("furama/service/list_total.jsp").forward(request, response);
    }

    private void getListCustomerUsingService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = iServiceContractDetail.getListCustomerUsingService(request,response);
        List<ServiceAttach> serviceAttachList = iServiceContractDetail.getListAttachService(request,response);
        request.setAttribute("customerListUsingService",customerList);
        request.setAttribute("serviceAttachList",serviceAttachList);
        request.getRequestDispatcher("furama/service/list_customer.jsp").forward(request, response);
    }

    private void goPageEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String codeService = request.getParameter("codeService");
        ServiceResort serviceResort = iServiceResort.selectByServiceCode(codeService);
        RequestDispatcher dispatcher = request.getRequestDispatcher("furama/service/edit.jsp");
        request.setAttribute("service", serviceResort);
        dispatcher.forward(request, response);
    }

    private void deleteService(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String codeService = request.getParameter("codeService");
        iServiceResort.deleteService(codeService);
        getListService(request,response);
    }


    private void goPageCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("furama/service/create.jsp").forward(request, response);
    }

    private void getListService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ServiceResort> serviceResortList = iServiceResort.getListSerVice();
        if (serviceResortList .size()==0){
            request.setAttribute("messenger","empty list");
        }else {
            request.setAttribute("serviceResortList",serviceResortList);
            request.getRequestDispatcher("furama/service/list.jsp").forward(request,response);
        }



    }
}
