package furama_resort.controller;

import furama_resort.bean.Customer;
import furama_resort.bean.ServiceResort;
import furama_resort.service.IService;
import furama_resort.service.impl.Service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ServiceServlet" , urlPatterns = "/service_servlet")
public class ServiceServlet extends HttpServlet {
    IService iService = new Service();
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
        iService.updateService(serviceResort);
        getListService(request,response);
    }

    private void searchService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("nameService");
        List<ServiceResort> serviceResortList = iService.selectServiceByName(name);
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

        iService.createService(serviceResort);
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
            case "delete":
                try {
                    deleteService(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            default:
                getListService(request,response);
                break;
        }
    }

    private void goPageEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String codeService = request.getParameter("codeService");
        ServiceResort serviceResort = iService.selectByServiceCode(codeService);
        RequestDispatcher dispatcher = request.getRequestDispatcher("furama/service/edit.jsp");
        request.setAttribute("service", serviceResort);
        dispatcher.forward(request, response);
    }

    private void deleteService(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String codeService = request.getParameter("codeService");
        iService.deleteService(codeService);
        getListService(request,response);
    }


    private void goPageCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("furama/service/create.jsp").forward(request, response);
    }

    private void getListService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ServiceResort> serviceResortList = iService.getListSerVice();

        request.setAttribute("serviceResortList",serviceResortList);
        request.getRequestDispatcher("furama/service/list.jsp").forward(request,response);


    }
}
