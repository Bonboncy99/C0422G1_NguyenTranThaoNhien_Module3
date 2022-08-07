package controller;

import model.facility.Facility;
import model.facility.FacilityType;
import model.facility.RentType;
import model.people.Customer;
import repository.facility.IFacilityrepository;
import service.facility.IFacilityService;
import service.facility.IFacilityTypeService;
import service.facility.IRentTypeService;
import service.facility.impl.FacilityService;
import service.facility.impl.FacilityTypeService;
import service.facility.impl.RentTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FacilityServlet", urlPatterns = {"","/Facility"})
public class FacilityServlet extends HttpServlet {
    IFacilityService facilityService = new FacilityService();

//    IFacilityTypeService facilityTypeService = new FacilityTypeService();
    FacilityTypeService facilityTypeService = new FacilityTypeService();
    IRentTypeService rentTypeService = new RentTypeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action==null){
            action = "";
        }
        switch (action){
            case "addFacility":
                showAddFacility(request,response);
                break;
            case "updateFacility":
                showUpdateFacility(request,response);
                break;
            default:
                showListFacility(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action==null){
            action = "";
        }
        switch (action){
            case "addFacility":
                AddFacility(request,response);
                break;
            case "updateFacility":
                updateFacility(request,response);
                break;
            case "deleteFacility":
                deleteFacility(request,response);
                break;
            default:
                showListFacility(request,response);
        }
    }

    private void deleteFacility(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idDeLete"));
        facilityService.deleteFacility(id);
        showListFacility(request,response);
    }

    private void showUpdateFacility(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idUpdate"));
        Facility facility = facilityService.findById(id);
        List<FacilityType> facilityTypeList = facilityTypeService.FindAll();
        List<RentType>rentTypeList = rentTypeService.FindAll();
        if (facility==null){
            request.setAttribute("mess","Not Found");
        } else {
            request.setAttribute("facility",facility);
        }
        request.setAttribute("facilityTypeList",facilityTypeList);
        request.setAttribute("rentTypeList",rentTypeList);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/update.jsp");
        requestDispatcher.forward(request,response);
    }

    private void showAddFacility(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/add.jsp");
        List<FacilityType>facilityTypeList = facilityTypeService.FindAll();
        List<RentType>rentTypeList = rentTypeService.FindAll();
        request.setAttribute("facilityTypeList",facilityTypeList);
        request.setAttribute("rentTypeList",rentTypeList);
        requestDispatcher.forward(request,response);
    }

    private void showListFacility(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/list.jsp");
        List<Facility>facilityList = facilityService.FindAll();
        List<FacilityType>facilityTypeList = facilityTypeService.FindAll();
        List<RentType>rentTypeList = rentTypeService.FindAll();
        if (facilityList.isEmpty()){
            request.setAttribute("mess","Chưa Có dữ liệu");
        } else {
            request.setAttribute("facilityList",facilityList);
        }
        request.setAttribute("facilityTypeList",facilityTypeList);
        request.setAttribute("rentTypeList",rentTypeList);
        requestDispatcher.forward(request,response);
    }



    private void updateFacility(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idUpdate"));
        String facilityName = request.getParameter("name");
        int area= Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople= Integer.parseInt(request.getParameter("maxPeople"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facilityTypeId"));
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        double poolArea =Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloor= Integer.parseInt(request.getParameter("numberOfFloor"));
        String facilityFree = request.getParameter("facilityFree");
        Facility facility = new Facility(id,facilityName,area,cost,maxPeople,
                rentTypeId,facilityTypeId,standardRoom,descriptionOtherConvenience
                ,poolArea,numberOfFloor,facilityFree);
        String mess = "FAIL";
        if (facilityService.updateFacility(facility)){
            mess = "SUCCESS";
        }
        request.setAttribute(mess,mess);
        RequestDispatcher requestDispatcher= request.getRequestDispatcher("view/facility/update.jsp");
        requestDispatcher.forward(request,response);
    }


    private void AddFacility(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String facilityName = request.getParameter("name");
         int area= Integer.parseInt(request.getParameter("area"));
         double cost = Double.parseDouble(request.getParameter("cost"));
         int maxPeople= Integer.parseInt(request.getParameter("maxPeople"));
         int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
         int facilityTypeId = Integer.parseInt(request.getParameter("facilityTypeId"));
         String standardRoom = request.getParameter("standardRoom");
         String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
         double poolArea =Double.parseDouble(request.getParameter("poolArea"));
         int numberOfFloor= Integer.parseInt(request.getParameter("numberOfFloor"));
         String facilityFree = request.getParameter("facilityFree");
         Facility facility = new Facility(facilityName,area,cost,maxPeople,
                 rentTypeId,facilityTypeId,standardRoom,descriptionOtherConvenience
                 ,poolArea,numberOfFloor,facilityFree);
         String message = "FAIL";
         if (facilityService.addFacility(facility)) {
             message = "SUCCESS";
         }
         request.setAttribute("message",message);
         RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/add.jsp");
         requestDispatcher.forward(request,response);
    }
}
