<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 8/5/2022
  Time: 11:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap-5.0.2-dist/css/bootstrap.min.css">

</head>
<body>
<div class="fixed-top container-fluid">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class=" navbar-nav me-auto mb-2 mb-lg-0">
                    <div class="container" style="width: 60px;height: 60px">
                        <a class="navbar-brand" href="/Furama">
                            <img class="img-fluid"
                                 src="https://furamavietnam.com/wp-content/uploads/2018/08/logo@2x.png" alt="">
                        </a>
                    </div>

                    <li class="nav-item">
                        <a class="nav-link  fw-bold" href="#">Employee</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link  fw-bold" href="#" tabindex="-1" aria-disabled="true">Customer</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link  fw-bold" href="/Furama?action=service" tabindex="-1" aria-disabled="true">Service</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link  fw-bold" href="#" tabindex="-1" aria-disabled="true">Contract</a>
                    </li>
                </ul>
                <form class="d-flex ">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
                <div>
                    <a href="">Nguyễn Trần Thảo Nhiên</a>
                </div>
            </div>
        </div>
    </nav>
</div>
<h1 class="bg-info text-center text-white p-3" style="margin-top: 150px">DANH SÁCH KHÁCH HÀNG</h1>

<a class="btn btn-success" href="/Customer?action=addCustomer">Thêm mới khách hàng</a>
<table class="table table-bordered table-hover table-light table-striped table-responsive">
    <thead class="table-primary text-center">
    <tr>
        <th>#</th>
        <th>Loại khách</th>
        <th>Họ và tên</th>
        <th>Ngày sinh</th>
        <th>Giới tính</th>
        <th>Số CMND</th>
        <th>Số điện thoại</th>
        <th>Email</th>
        <th>Địa chỉ</th>
        <th colspan="3">Các chức năng</th>
    </tr>
    </thead>


    <c:forEach items="${customerList}" var="customer">
        <tr>
            <td>${customer.maKhachHang}</td>
                <%--            <c:forEach  items="${customerTypeList}" var="customerType">--%>
                <%--               <c:if test="${customerType.maLoaiKhach==customer.maLoaiKhach}">--%>
                <%--                   <td>${customerType.tenLoaiKhach}</td>--%>
                <%--                   <td>1</td>--%>
                <%--               </c:if>--%>
                <%--            </c:forEach>--%>
            <td>${customer.maLoaiKhach}</td>
            <td>${customer.hoTen}</td>
            <td>${customer.ngaySinh}</td>
            <td>
                <c:if test="${customer.gioiTinh == true}">
                    Nam
                </c:if>
                <c:if test="${customer.gioiTinh == false}">
                    Nữ
                </c:if>
            </td>
            <td>${customer.soCmnd}</td>
            <td>${customer.soDienThoai}</td>
            <td>${customer.email}</td>

            <td>${customer.diaChi}</td>
            <td>
                <a class="btn btn-outline-warning"
                   href="/Customer?action=updateCustomer&maKhachHang=${customer.maKhachHang}">Update</a>
            </td>
            <td>
                <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal"
                        data-bs-target="#deleteModal"
                        onclick="getIdToDelete('${customer.maKhachHang}','${customer.hoTen}')">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
</table>


<!-- The Delete Modal ok-->
<div class="modal" id="deleteModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <h4 class="modal-title">DELETE SERVICE</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form method="post" action="/Customer?action=deleteCustomer">
                <div class="modal-body">
                    <input type="hidden" name="idDelete" id="idDelete">
                    Bạn muốn xóa khách hàng có
                    ID: <span id="idkhachHang"></span>,
                    Tên: <span id="tenKhachHang"></span>.

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function getIdToDelete(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("idkhachHang").innerText = id;
        document.getElementById("tenKhachHang").innerText = name;
    }
</script>
<script src="bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
</body>
</html>
