package controller;

import customer.model.Customer;
import customer.model.CustomerType;
import customer.service.ICustomerService;
import customer.service.ICustomerType;
import customer.service.impl.CustomerService;
import customer.service.impl.CustomerTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/Customer")
public class CustomerServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerService();
    private ICustomerType customerType = new CustomerTypeService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "addCustomer":
                showAddCustomer(request,response);
                break;
            case "updateCustomer":
                showUpdateCustomer(request,response);
            default:
                showListCustomer(request,response);
        }
    }

    private void showUpdateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("maKhachHang"));
        Customer customer = customerService.findById(id);
        request.setAttribute("customer",customer);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/update.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "addCustomer":
                addCustomer(request,response);
                break;
            case "deleteCustomer":
                deleteCustomer(request,response);
                break;
            case "updateCustomer":
                updateCustomer(request,response);
                break;
            default:
                showListCustomer(request,response);
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("maKhachHang"));
        int maLoaiKhach = Integer.parseInt(request.getParameter("loaiKhachMoi"));
        String hoTen = request.getParameter("hoTenMoi");
        String ngaySinh = request.getParameter("ngaySinhMoi");
        boolean gioiTinh = Boolean.parseBoolean("gioiTinhMoi");
        String soCmnd = request.getParameter("soCmndMoi");
        String soDienThoai = request.getParameter("soDienThoaiMoi");
        String email = request.getParameter("emailMoi");
        String diaChi = request.getParameter("diaChiMoi");
        Customer customer = new Customer(maLoaiKhach,hoTen,ngaySinh,gioiTinh,soCmnd,soDienThoai,email,diaChi);
        customerService.update(id,customer);
        showListCustomer(request,response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        customerService.delete(id);
//        response.sendRedirect("view/customer/list.jsp");
        showListCustomer(request,response);
    }

    private void addCustomer(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/add.jsp");
        int maLoaiKhach = Integer.parseInt(request.getParameter("loaiKhach"));
        String hoTen = request.getParameter("hoTen");
        String ngaySinh = request.getParameter("ngaySinh");
        boolean gioiTinh = Boolean.parseBoolean("gioiTinh");
        String soCmnd = request.getParameter("soCmnd");
        String soDienThoai = request.getParameter("soDienThoai");
        String email = request.getParameter("email");
        String diaChi = request.getParameter("diaChi");
        Customer customer = new Customer(maLoaiKhach,hoTen,ngaySinh,gioiTinh,soCmnd,soDienThoai,email,diaChi);
        String mess = "Thêm mới Thất bại";
        if (customerService.add(customer)) {
            mess = "Thêm mới thành công";
        }
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showAddCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/add.jsp");
        requestDispatcher.forward(request,response);
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        List<Customer> customerList = customerService.findAll();
        List<CustomerType> customerTypeList = customerType.findAll();
        request.setAttribute("customerList",customerList);
        request.setAttribute("customerTypeList",customerTypeList);
        requestDispatcher.forward(request,response);
    }



}
