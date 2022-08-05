<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 8/5/2022
  Time: 1:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap-5.0.2-dist/css/bootstrap.min.css">
</head>
<body>
<h4 class="p-3 bg-success text-white text-center">Thêm mới dịch vụ</h4>

<select class="form-select-lg w-50 m-auto mt-3 border-success rounded-pill" name="" id="addSelect"
        onchange="displayInputAdd()">
    <option value="none">Chọn loại dịch vụ</option>
    <option value="house">Thêm mới House</option>
    <option value="villa">Thêm mới Villa</option>
    <option value="room">Thêm mới Room</option>
</select>
<div class="d-flex justify-content-center">
    <form action="" class="w-75 mt-5">
        <div class="mb-3">
            <label for="tenDv" class="form-label">1. Nhập Tên dịch vụ</label>
            <input type="text" class="form-control" id="tenDv" aria-describedby="emailHelp"
                   placeholder="Nhập Tên dịch vụ">
        </div>
        <div class="mb-3">
            <label for="dienTich" class="form-label">2. Nhập Diện tích</label>
            <input type="text" class="form-control" id="dienTich" aria-describedby="emailHelp"
                   placeholder="Nhập Diện tích">
        </div>
        <div class="mb-3">
            <label for="chiPhiThue" class="form-label">3. Nhập chi phí thuê</label>
            <input type="text" class="form-control" id="chiPhiThue" aria-describedby="emailHelp"
                   placeholder="3. Nhập chi phí thuê">
        </div>
        <div class="mb-3">
            <label for="soNguoiToiDa" class="form-label">4. Nhập số người tối đa</label>
            <input type="text" class="form-control" id="soNguoiToiDa" aria-describedby="emailHelp"
                   placeholder="4. Nhập số người tối đa">
        </div>
        <div class="mb-3">
            <label for="tieuChuanPhong" class="form-label">5. Nhập Tiêu chuẩn phòng</label>
            <input type="text" class="form-control" id="tieuChuanPhong" aria-describedby="emailHelp"
                   placeholder="5. Nhập Tiêu chuẩn phòng">
        </div>
        <div class="mb-3">
            <label for="tienNghiKhac" class="form-label">6. Nhập Mô tả tiện nghi khác</label>
            <input type="text" class="form-control" id="tienNghiKhac" aria-describedby="emailHelp"
                   placeholder="6. Nhập Mô tả tiện nghi khác">
        </div>
        <div class="mb-3 dienTichHoBoi" style="display: none" id="dienTichHoBoi1">
            <label for="dienTichHoBoi" class="form-label">Nhập Diện tích hồ bơi</label>
            <input type="text" class="form-control" aria-describedby="emailHelp"
                   placeholder="Nhập Diện tích hồ bơi" id="dienTichHoBoi">
        </div>
        <div class="mb-3 soTang" style="display: none" id="soTang1">
            <label for="soTang" class="form-label">Nhập Số tầng</label>
            <input type="text" class="form-control" aria-describedby="emailHelp"
                   placeholder="Nhập Số tầng" id="soTang">
        </div>
        <div class="mb-3 dichVuMienPhi" style="display: none" id="dichVuMienPhi1">
            <label for="dichVuMienPhi" class="form-label">Nhập dịch vụ miễn phí đi kèm</label>
            <input type="text" class="form-control" aria-describedby="emailHelp"
                   placeholder="Nhập dịch vụ miễn phí đi kèm" id="dichVuMienPhi">
        </div>
    </form>
</div>
<button type="button" class="btn btn-danger">Close</button>
<button type="submit" id="add" class="btn btn-outline-success">Thêm mới</button>
</div>
</form>
</div>


<script src="bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
</body>
</html>
