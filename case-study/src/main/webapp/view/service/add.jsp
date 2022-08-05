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

<div class="d-flex justify-content-center">
    <select class="form-select-lg w-50 m-auto mt-3 border-success rounded-pill" name="" id="addSelect"
            onchange="displayInputAdd()">
        <option value="none">Chọn loại dịch vụ</option>
        <option value="house">Thêm mới House</option>
        <option value="villa">Thêm mới Villa</option>
        <option value="room">Thêm mới Room</option>
    </select>
</div>
<div class="d-flex justify-content-center">
    <form action="" class="text-success fw-bold bg-light w-75 mt-5 mb-5 shadow-lg p-5">
        <div class="row">
            <div class="col-md-6 col-sm-12 ">
                <div class="mb-3">
                    <label for="tenDv" class="form-label ">1. Nhập Tên dịch vụ</label>
                    <input type="text" class="form-control" id="tenDv" aria-describedby="emailHelp"
                           placeholder="Nhập Tên dịch vụ">
                </div>
                <div class="mb-3">
                    <label for="dienTich" class="form-label ">2. Nhập Diện tích sử dụng</label>
                    <input type="text" class="form-control" id="dienTich" aria-describedby="emailHelp"
                           placeholder="Nhập Diện tích">
                </div>
                <div class="mb-3">
                    <label for="chiPhiThue" class="form-label ">3. Nhập chi phí thuê</label>
                    <input type="text" class="form-control" id="chiPhiThue" aria-describedby="emailHelp"
                           placeholder="Nhập chi phí thuê">
                </div>
                <div class="mb-3">
                    <label for="soNguoiToiDa" class="form-label ">4. Nhập số người tối đa</label>
                    <input type="text" class="form-control" id="soNguoiToiDa" aria-describedby="emailHelp"
                           placeholder="4. Nhập số người tối đa">
                </div>
                <div class="mb-3">
                    <label for="soNguoiToiDa" class="form-label ">5. Nhập kiểu thuê</label>
                    <select name="kieuThue" id="kieuThue">
                        <option value="nam">Thuê theo năm</option>
                        <option value="thang">Thuê theo tháng</option>
                        <option value="ngay">Thuê theo ngày</option>
                        <option value="gio">Thuê theo giờ</option>
                    </select>
                </div>
            </div>
            <div class="col-md-6 col-sm-12 ">
                <div class="mb-3 " style="display: none" id="divTieuChuanPhong">
                    <label for="tieuChuanPhong" class="form-label ">Nhập Tiêu chuẩn phòng</label>
                    <input type="text" class="form-control" id="tieuChuanPhong" aria-describedby="emailHelp"
                           placeholder="Nhập Tiêu chuẩn phòng">
                </div>
                <div class="mb-3 " style="display: none" id="divTienNghiKhac">
                    <label for="tienNghiKhac" class="form-label ">Nhập Mô tả tiện nghi khác</label>
                    <input type="text" class="form-control" id="tienNghiKhac" aria-describedby="emailHelp"
                           placeholder="Nhập Mô tả tiện nghi khác">
                </div>
                <div class="mb-3 " style="display: none" id="divDienTichHoBoi">
                    <label for="dienTichHoBoi" class="form-label ">Nhập Diện tích hồ bơi</label>
                    <input type="text" class="form-control" aria-describedby="emailHelp"
                           placeholder="Nhập Diện tích hồ bơi" id="dienTichHoBoi">
                </div>
                <div class="mb-3 " style="display: none" id="divSoTang">
                    <label for="soTang" class="form-label ">Nhập Số tầng</label>
                    <input type="text" class="form-control" aria-describedby="emailHelp"
                           placeholder="Nhập Số tầng" id="soTang">
                </div>
                <div class="mb-3 " style="display: none" id="divDichVuMienPhi">
                    <label for="dichVuMienPhi" class="form-label ">Nhập dịch vụ miễn phí đi kèm</label>
                    <input type="text" class="form-control" aria-describedby="emailHelp"
                           placeholder="Nhập dịch vụ miễn phí đi kèm" id="dichVuMienPhi">
                </div>
            </div>
        </div>
        <div>
            <a class="btn btn-primary" href="/Service">Quay lại</a>
            <button type="submit" id="add" class="btn btn-outline-success">Thêm mới</button>
        </div>
    </form>
</div>

<script>
    window.onload = function () {
        setStatusSummitBtn(false);
    }

    function setStatusSummitBtn(action) {
        // false => tắt ~ disable
        // true => bật ~ enable
        if (action === false) {
            document.getElementById("add").disabled = true;
        } else
            document.getElementById("add").disabled = false;
    }

    function displayInputAdd() {
        let value = document.getElementById("addSelect").value;
        let divTieuChuanPhong = document.getElementById("divTieuChuanPhong");
        let divTienNghiKhac = document.getElementById("divTienNghiKhac");
        let dienTichHoBoi = document.getElementById("divDienTichHoBoi");
        let divSoTang = document.getElementById("divSoTang");
        let divDichVuMienPhi = document.getElementById("divDichVuMienPhi");


        switch (value) {
            case "none":
                divTieuChuanPhong.style.display = "none"
                divTienNghiKhac.style.display = "none"
                dienTichHoBoi.style.display = "none"
                divSoTang.style.display = "none"
                divDichVuMienPhi.style.display = "none"
                setStatusSummitBtn(false);
                console.log(0)
                break;
            case "villa":
                divTieuChuanPhong.style.display = "block"
                divTienNghiKhac.style.display = "block"
                dienTichHoBoi.style.display = "block"
                divSoTang.style.display = "block"
                divDichVuMienPhi.style.display = "none"
                setStatusSummitBtn(true);
                console.log(2)
                break;
            case "house":
                divTieuChuanPhong.style.display = "block"
                divTienNghiKhac.style.display = "block"
                dienTichHoBoi.style.display = "none"
                divSoTang.style.display = "block"
                divDichVuMienPhi.style.display = "none"
                setStatusSummitBtn(true);
                console.log(1)
                break;
            case "room":
                divTieuChuanPhong.style.display = "none"
                divTienNghiKhac.style.display = "none"
                dienTichHoBoi.style.display = "none"
                divSoTang.style.display = "none"
                divDichVuMienPhi.style.display = "block"
                setStatusSummitBtn(true);
                console.log(3)
                break;
        }
    }
</script>
<script src="bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>

</body>

</html>
