<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 8/5/2022
  Time: 1:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
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
<h1 class="bg-info text-center text-white p-3" style="margin-top: 150px">Danh sách dịch vụ</h1>

<%--<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addModal">--%>
<%--    Thêm mới dịch vụ--%>
<%--</button>--%>
<a class="btn btn-success" href="/Service?action=?">Thêm mới dịch vụ</a>
<table class="table table-bordered table-hover table-light table-striped table-responsive">
    <thead class="table-success text-center">
    <tr>
        <th>#</th>
        <th>Tên dịch vụ</th>
        <th>Diện tích</th>
        <th>Chi phí thuê</th>
        <th>Số người tối đa</th>
        <th>Kiểu thuê</th>
        <th colspan="3">Các chức năng</th>
    </tr>
    </thead>
    <tr>
        <td>1</td>
        <td>Villa Beach Front</td>
        <td>25000</td>
        <td>1000000</td>
        <td>10</td>
        <td>theo ngày</td>
        <td>
            <button type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#viewModal">
                View
            </button>
        </td>
        <td>
            <button type="button" class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#updateModal">
                Update
            </button>
        </td>
        <td>
            <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
                Delete
            </button>
        </td>
    </tr>
    <tr>
        <td>2</td>
        <td>House Princess 01</td>
        <td>14000</td>
        <td>5000000</td>
        <td>7</td>
        <td>theo ngày</td>
        <td>
            <button type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#viewModal">
                View
            </button>
        </td>
        <td>
            <button type="button" class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#updateModal">
                Update
            </button>
        </td>
        <td>
            <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
                Delete
            </button>
        </td>
    </tr>
    <tr>
        <td>3</td>
        <td>Room Twin 01</td>
        <td>5000</td>
        <td>1000000</td>
        <td>2</td>
        <td>theo ngày</td>
        <td>
            <button type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#viewModal">
                View
            </button>
        </td>
        <td>
            <button type="button" class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#updateModal">
                Update
            </button>
        </td>
        <td>
            <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
                Delete
            </button>
        </td>
    </tr>
    <tr>
        <td>4</td>
        <td>Villa No Beach Front</td>
        <td>22000</td>
        <td>9000000</td>
        <td>8</td>
        <td>theo ngày</td>
        <td>
            <button type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#viewModal">
                View
            </button>
        </td>
        <td>
            <button type="button" class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#updateModal">
                Update
            </button>
        </td>
        <td>
            <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
                Delete
            </button>
        </td>
    </tr>
    <tr>
        <td>5</td>
        <td>House Princess 02</td>
        <td>10000</td>
        <td>4000000</td>
        <td>5</td>
        <td>theo ngày</td>
        <td>
            <button type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#viewModal">
                View
            </button>
        </td>
        <td>
            <button type="button" class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#updateModal">
                Update
            </button>
        </td>
        <td>
            <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
                Delete
            </button>
        </td>
    </tr>
    <tr>
        <td>6</td>
        <td>Room Twin 02</td>
        <td>3000</td>
        <td>9000000</td>
        <td>2</td>
        <td>theo ngày</td>
        <td>
            <button type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#viewModal">
                View
            </button>
        </td>
        <td>
            <button type="button" class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#updateModal">
                Update
            </button>
        </td>
        <td>
            <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
                Delete
            </button>
        </td>
    </tr>
</table>

<!--The Add modal ok-->
<div class="modal" id="addModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-success text-white">
                <h4 class="modal-title ">Thêm mới dịch vụ</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <select class="form-select-lg w-50 m-auto mt-3 border-success rounded-pill" name="" id="addSelect"
                    onchange="displayInputAdd()">
                <option value="none">Chọn loại dịch vụ</option>
                <option value="house">Thêm mới House</option>
                <option value="villa">Thêm mới Villa</option>
                <option value="room">Thêm mới Room</option>
            </select>

            <form action="">
                <div class="modal-body">
                    <div class="mb-3">
                        <input type="text" class="form-control" id="tenDv" aria-describedby="emailHelp"
                               placeholder="1. Nhập Tên dịch vụ">
                    </div>
                    <div class="mb-3">
                        <input type="text" class="form-control" id="dienTich" aria-describedby="emailHelp"
                               placeholder="2. Nhập Diện tích">
                    </div>
                    <div class="mb-3">
                        <input type="text" class="form-control" id="chiPhiThue" aria-describedby="emailHelp"
                               placeholder="3. Nhập chi phí thuê">
                    </div>
                    <div class="mb-3">
                        <input type="text" class="form-control" id="soNguoiToiDa" aria-describedby="emailHelp"
                               placeholder="4. Nhập số người tối đa">
                    </div>
                    <div class="mb-3">
                        <input type="text" class="form-control" id="tieuChuanPhong" aria-describedby="emailHelp"
                               placeholder="5. Nhập Tiêu chuẩn phòng">
                    </div>
                    <div class="mb-3">
                        <input type="text" class="form-control" id="tienNghiKhac" aria-describedby="emailHelp"
                               placeholder="6. Nhập Mô tả tiện nghi khác">
                    </div>
                    <div class="mb-3 dienTichHoBoi" style="display: none" id="dienTichHoBoi">
                        <input type="text" class="form-control" aria-describedby="emailHelp"
                               placeholder="Nhập Diện tích hồ bơi">
                    </div>
                    <div class="mb-3 soTang" style="display: none" id="soTang">
                        <input type="text" class="form-control" aria-describedby="emailHelp"
                               placeholder="Nhập Số tầng">
                    </div>
                    <div class="mb-3 dichVuMienPhi" style="display: none" id="dichVuMienPhi">
                        <input type="text" class="form-control" aria-describedby="emailHelp"
                               placeholder="Nhập dịch vụ miễn phí đi kèm">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                    <button type="submit" id="add" class="btn btn-outline-success">Thêm mới</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- The View Modal -->
<div class="modal" id="viewModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <h4 class="modal-title">VIEW SERVICE</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">
                <table class="table table-bordered table-success table-hover">

                    <tr>
                        <th>#</th>
                        <td>1</td>
                    </tr>
                    <tr>
                        <th>Tên dịch vụ</th>
                        <td>Villa Beach Front</td>
                    </tr>
                    <tr>
                        <th>Diện tích</th>
                        <td>25000</td>
                    </tr>
                    <tr>
                        <th>Chi phí thuê</th>
                        <td>1000000</td>
                    </tr>
                    <tr>
                        <th>Số người tối đa</th>
                        <td>10</td>
                    </tr>
                    <tr>
                        <th>Tiêu chuẩn phòng</th>
                        <td>vip</td>
                    </tr>
                    <tr>
                        <th>Mô tả tiện nghi khác</th>
                        <td>Có hồ bơi</td>
                    </tr>
                    <tr>
                        <th>Diện tích hồ bơi</th>
                        <td>500</td>
                    </tr>
                    <tr>
                        <th>Số tầng</th>
                        <td>4</td>
                    </tr>
                    <tr>
                        <th>Dịch vụ miễn phí đi kèm</th>
                        <td>Không</td>
                    </tr>
                </table>

                <button type="button" class="btn btn-outline-warning" data-bs-toggle="modal"
                        data-bs-target="#updateModal">
                    Update
                </button>
                <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal"
                        data-bs-target="#deleteModal">
                    Delete
                </button>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>

<!-- The Update Modal ok-->
<div class="modal" id="updateModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <h4 class="modal-title">UPDATE SERVICE</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <form action="">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="tenDvMoi" class="form-label">ID</label>
                        <input disabled type="text" class="form-control" id="idDichVu" aria-describedby="emailHelp"
                               value="1">
                    </div>
                    <div class="mb-3">
                        <label for="tenDvMoi" class="form-label">Tên dịch vụ</label>
                        <input type="text" class="form-control" id="tenDvMoi" aria-describedby="emailHelp"
                               value="Villa Beach Front">
                    </div>
                    <div class="mb-3">
                        <label for="dienTichMoi" class="form-label">Diện tích</label>
                        <input type="text" class="form-control" id="dienTichMoi" aria-describedby="emailHelp"
                               value="25000">
                    </div>
                    <div class="mb-3">
                        <label for="chiPhiThueMoi" class="form-label">Chi phí thuê</label>
                        <input type="text" class="form-control" id="chiPhiThueMoi" aria-describedby="emailHelp"
                               value="1000000">
                    </div>
                    <div class="mb-3">
                        <label for="soNguoiToiDaMoi" class="form-label">Số người tối đa</label>
                        <input type="text" class="form-control" id="soNguoiToiDaMoi" aria-describedby="emailHelp"
                               value="10">
                    </div>
                    <div class="mb-3">
                        <label for="tieuChuanPhongMoi" class="form-label">Tiêu chuẩn phòng</label>
                        <input type="text" class="form-control" id="tieuChuanPhongMoi" aria-describedby="emailHelp"
                               value="vip">
                    </div>
                    <div class="mb-3">
                        <label for="tienNghiKhacMoi" class="form-label">Mô tả tiện nghi khác</label>
                        <input type="text" class="form-control" id="tienNghiKhacMoi" aria-describedby="emailHelp"
                               value="Có hồ bơi">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-warning">Update</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- The Delete Modal ok-->
<div class="modal" id="deleteModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <h4 class="modal-title">DELETE SERVICE</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">
                <p>Bạn muốn xóa service ......?</p>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-danger">Delete</button>
            </div>

        </div>
    </div>
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
        } else document.getElementById("add").disabled = false;

    }

    function displayInputAdd() {
        let value = document.getElementById("addSelect").value;
        let dienTichHoBoi = document.getElementById("dienTichHoBoi");
        let soTang = document.getElementById("soTang");
        let dichVuMienPhi = document.getElementById("dichVuMienPhi");
        // let addBtn = document.getElementById("add");
        // console.log(addBtn)
        switch (value) {
            case "none":
                setStatusSummitBtn(false);
                break;
            case "house":
                dienTichHoBoi.style.display = "none"
                soTang.style.display = "block"
                dichVuMienPhi.style.display = "none"
                setStatusSummitBtn(true);
                console.log(1)
                break;
            case "villa":
                soTang
                //villa
                dienTichHoBoi.style.display = "block"
                soTang.style.display = "block"
                dichVuMienPhi.style.display = "none"
                setStatusSummitBtn(true);
                console.log(2)
                break;
            case "room":
                //room
                dienTichHoBoi.style.display = "none"
                soTang.style.display = "none"
                dichVuMienPhi.style.display = "block"
                setStatusSummitBtn(true);
                console.log(3)
                break;
        }
    }

</script>
<script src="bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
</body>
</html>