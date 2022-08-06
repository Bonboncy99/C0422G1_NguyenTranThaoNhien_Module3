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
int maLoaiKhach;
String ;
String ngaySinh;
boolean gioiTinh;
String ;
String ;
String ;
String ;
<h4 class="p-3 bg-warning text-white text-center">Cập nhật Khách hàng</h4>
<div class="d-flex justify-content-center">
    <form action="/Customer?action=updateCustomer" method="post" class="text-warning fw-bold bg-light w-75 mt-5 mb-5 shadow-lg p-5">
        <div class="mb-3 w-50 d-flex justify-content-center">
            <input readonly type="text" class="form-control" name="maKhachHang" id="idKhachHang" value="${customer.maKhachHang}">
        </div>
        <div class="row">
            <div class="col-md-6 col-sm-12">
                <div class="mb-3">
                    <label for="hoTenMoi" class="form-label ">1. Nhập họ tên khách hàng mới</label>
                    <input type="text" class="form-control" id="hoTenMoi" value="${customer.hoTen}" name="hoTenMoi">
                </div>
                <div class="mb-3">
                    <label for="ngaySinhMoi" class="form-label ">2. Nhập ngày sinh mới</label>
                    <input type="text" class="form-control" id="ngaySinhMoi" value="${customer.ngaySinh}" name="ngaySinhMoi">
                </div>
                <div class="mb-3">
                    <label for="gioiTinhMoi" class="form-label ">3. Chọn giới tính mới</label>
                    <select name="gioiTinhMoi" id="gioiTinhMoi">
                        <c:if test="${customer.gioiTinh == true}">
                            <option value="true">Nam</option>
                            <option value="false">Nữ</option>
                        </c:if>
                        <c:if test="${customer.gioiTinh == false}">
                            <option value="false">Nữ</option>
                            <option value="true">Nam</option>
                        </c:if>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="soCmndMoi" class="form-label ">4. Nhập số CMND mới</label>
                    <input type="text" class="form-control" id="soCmndMoi" name="soCmndMoi" value="${customer.soCmnd}">
                </div>
            </div>
            <div class="col-md-6 col-sm-12">
                <div class="mb-3">
                    <label for="soDienThoaiMoi" class="form-label ">5. Nhập số điện thoại mới</label>
                    <input type="text" class="form-control" id="soDienThoaiMoi" value="${customer.soDienThoai}" name="soDienThoaiMoi">
                </div>
                <div class="mb-3">
                    <label for="emailMoi" class="form-label ">6. Nhập email mới</label>
                    <input type="text" class="form-control" id="emailMoi" value="${customer.email}" name="emailMoi">
                </div>
                <div class="mb-3">
                    <label for="loaiKhachMoi" class="form-label ">7.Chọn loại khách mới</label>
                    <select name="loaiKhachMoi" id="loaiKhachMoi">
                        <c:if test="${customer.maLoaiKhach==1}">
                            <option value="1">Diamond</option>
                            <option value="2">Platinium</option>
                            <option value="3">Gold</option>
                            <option value="4">Silver</option>
                            <option value="5">Member</option>
                        </c:if>
                        <c:if test="${customer.maLoaiKhach==2}">
                            <option value="2">Platinium</option>
                            <option value="1">Diamond</option>
                            <option value="3">Gold</option>
                            <option value="4">Silver</option>
                            <option value="5">Member</option>
                        </c:if>
                        <c:if test="${customer.maLoaiKhach==3}">
                            <option value="3">Gold</option>
                            <option value="1">Diamond</option>
                            <option value="2">Platinium</option>
                            <option value="4">Silver</option>
                            <option value="5">Member</option>
                        </c:if>
                        <c:if test="${customer.maLoaiKhach==4}">
                            <option value="4">Silver</option>
                            <option value="1">Diamond</option>
                            <option value="2">Platinium</option>
                            <option value="3">Gold</option>
                            <option value="5">Member</option>
                        </c:if>
                        <c:if test="${customer.maLoaiKhach==5}">
                            <option value="5">Member</option>
                            <option value="1">Diamond</option>
                            <option value="2">Platinium</option>
                            <option value="3">Gold</option>
                            <option value="4">Silver</option>
                        </c:if>

                    </select>
                </div>
                <div class="mb-3">
                    <label for="diaChimoi" class="form-label ">8. Nhập địa chỉ mới</label>
                    <input type="text" class="form-control" id="diaChimoi" aria-describedby="emailHelp" name="diaChiMoi"
                           value="${customer.diaChi}">
                </div>
            </div>
        </div>
        <div>
            <a class="btn btn-primary" href="/Customer">Quay lại</a>
            <button type="submit" id="updateCustomer" class="btn btn-outline-warning">Cập nhật</button>
        </div>
    </form>
</div>

<script src="bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>

</body>
</html>
