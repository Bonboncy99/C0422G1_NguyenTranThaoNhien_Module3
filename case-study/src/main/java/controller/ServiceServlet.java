package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServiceServlet", value = "/Service")
public class ServiceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String action = request.getParameter("action");
            if (action==null){
                action = "";
            }
            switch (action){
                case "addService":
                    showAddService(request,response);
                    break;
                case "updateService":
                    showUpdateService(request,response);
                    break;
                default:
                    showListService(request,response);
            }
        }

    private void showUpdateService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/service/update.jsp");
        requestDispatcher.forward(request,response);
    }

    private void showAddService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher= request.getRequestDispatcher("view/service/add.jsp");
        requestDispatcher.forward(request,response);
    }

    private void showListService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/service/list.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action = "";
        }
        switch (action){
            case "addService":
//                AddService(request,response);
                break;
            case "deleteService":
//                deleteService(request,response);
                break;
            case "updateService":
//                UpdateService(request,response);
                break;
            default:
                showListService(request,response);
        }
    }
}
