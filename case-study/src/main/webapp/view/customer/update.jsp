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
<h4 class="p-3 bg-warning text-white text-center">Cập nhật Khách hàng</h4>
<div class="d-flex justify-content-center">
    <form action="" method="post" class="text-warning fw-bold bg-light w-75 mt-5 mb-5 shadow-lg p-5">
        <div class="mb-3 w-50 d-flex justify-content-center">
            <input disabled type="text" class="form-control" id="idDichVuMoi" value="1">
        </div>
        <div class="row">
            <div class="col-md-6 col-sm-12">
                <div class="mb-3">
                    <label for="hoTenMoi" class="form-label ">1. Nhập họ tên khách hàng mới</label>
                    <input type="text" class="form-control" id="hoTenMoi" value="2">
                </div>
                <div class="mb-3">
                    <label for="ngaySinhMoi" class="form-label ">2. Nhập ngày sinh mới</label>
                    <input type="text" class="form-control" id="ngaySinhMoi" value="2">
                </div>
                <div class="mb-3">
                    <label for="gioiTinhMoi" class="form-label ">3. Nhập giới tính mới</label>
                    <input type="text" class="form-control" id="gioiTinhMoi" value="2">
                </div>
                <div class="mb-3">
                    <label for="soCmndMoi" class="form-label ">4. Nhập số CMND mới</label>
                    <input type="text" class="form-control" id="soCmndMoi" value="2">
                </div>
            </div>
            <div class="col-md-6 col-sm-12">
                <div class="mb-3">
                    <label for="soDienThoaiMoi" class="form-label ">5. Nhập số điện thoại mới</label>
                    <input type="text" class="form-control" id="soDienThoaiMoi" value="2">
                </div>
                <div class="mb-3">
                    <label for="emailMoi" class="form-label ">6. Nhập email mới</label>
                    <input type="text" class="form-control" id="emailMoi" value="2">
                </div>
                <div class="mb-3">
                    <label for="loaiKhachMoi" class="form-label ">7.Chọn loại khách mới</label>
                    <select name="kieuThue" id="loaiKhachMoi">
                        <option value="Diamond">Diamond</option>
                        <option value="Platinium">Platinium</option>
                        <option value="Gold">Gold</option>
                        <option value="Silver">Silver</option>
                        <option value="Member">Member</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="diaChimoi" class="form-label ">8. Nhập địa chỉ mới</label>
                    <input type="text" class="form-control" id="diaChimoi" aria-describedby="emailHelp"
                           value="2">
                </div>
            </div>
        </div>
        <div>
            <a class="btn btn-primary" href="/Employee">Quay lại</a>
            <button type="submit" id="add" class="btn btn-outline-warning">Cập nhật</button>
        </div>
    </form>
</div>

<script src="bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>

</body>
</html>
