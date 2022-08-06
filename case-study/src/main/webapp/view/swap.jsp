<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 8/6/2022
  Time: 9:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap-5.0.2-dist/css/bootstrap.min.css">
</head>
<body>
<%--navbar--%>
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

<h1 class="bg-danger text-center text-white p-3" style="margin-top: 150px">DANH SÁCH NHÂN VIÊN</h1>

<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addModal">
    Thêm mới nhân viên
</button>
<table class="table table-bordered table-hover table-light table-striped table-responsive">
    <thead class="table-danger text-center">
    <tr>
        <th>#</th>
        <th>Tên nhân viên</th>
        <th>Ngày sinh</th>
        <th>Số CMND</th>
        <th>Số điện thoại</th>
        <th>Email</th>
        <th>Trình độ</th>
        <th>Vị trí</th>
        <th>Bộ phận</th>
        <th>Lương</th>
        <th colspan="3">Các chức năng</th>
    </tr>
    </thead>
    <tr>
        <td>1</td>
        <td>Nguyễn Văn An</td>
        <td>1970-11-07</td>
        <td>456231786</td>
        <td>0901234121</td>
        <td>annguyen@gmail.com</td>
        <td>3</td>
        <td>1</td>
        <td>2</td>
        <td>10000000</td>
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
        <td>1</td>
        <td>Nguyễn Văn An</td>
        <td>1970-11-07</td>
        <td>456231786</td>
        <td>0901234121</td>
        <td>annguyen@gmail.com</td>
        <td>3</td>
        <td>1</td>
        <td>2</td>
        <td>10000000</td>
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
        <td>1</td>
        <td>Nguyễn Văn An</td>
        <td>1970-11-07</td>
        <td>456231786</td>
        <td>0901234121</td>
        <td>annguyen@gmail.com</td>
        <td>3</td>
        <td>1</td>
        <td>2</td>
        <td>10000000</td>
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
        <td>1</td>
        <td>Nguyễn Văn An</td>
        <td>1970-11-07</td>
        <td>456231786</td>
        <td>0901234121</td>
        <td>annguyen@gmail.com</td>
        <td>3</td>
        <td>1</td>
        <td>2</td>
        <td>10000000</td>
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
        <td>1</td>
        <td>Nguyễn Văn An</td>
        <td>1970-11-07</td>
        <td>456231786</td>
        <td>0901234121</td>
        <td>annguyen@gmail.com</td>
        <td>3</td>
        <td>1</td>
        <td>2</td>
        <td>10000000</td>
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
        <div class="modal-content text-success fw-bold">
            <div class="modal-header bg-success text-white">
                <h4 class="modal-title text-center">Thêm mới Nhân viên</h4>
            </div>
            <form action="">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="ten" class="form-label ">1. Nhập tên nhân viên</label>
                        <input type="text" class="form-control" id="ten" aria-describedby="emailHelp"
                               name="ten" placeholder="Nhập tên nhân viên">
                    </div>
                    <div class="mb-3">
                        <label for="ngaySinh" class="form-label ">2. Nhập ngày sinh </label>
                        <input type="text" class="form-control" id="ngaySinh" aria-describedby="emailHelp"
                               name="ngaySinh" placeholder="Nhập ngày sinh">
                    </div>
                    <div class="mb-3">
                        <label for="soCMND" class="form-label ">3. Nhập số CMND</label>
                        <input type="text" class="form-control" id="soCMND" aria-describedby="emailHelp"
                               name="soCMND" placeholder="Nhập số CMND">
                    </div>
                    <div class="mb-3">
                        <label for="soDienThoai" class="form-label ">4. Nhập số điện thoại</label>
                        <input type="text" class="form-control" id="soDienThoai" aria-describedby="emailHelp"
                               name="soDienThoai" placeholder="Nhập số điện thoại">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label ">5. Nhập email</label>
                        <input type="text" class="form-control" id="email" aria-describedby="emailHelp"
                               name="email" placeholder="Nhập email">
                    </div>
                    <div class="mb-3">
                        <label for="trinhDo" class="form-label ">6. Chọn trình độ</label>
                        <select name="viTri" id="trinhDo">
                            <option value="1"> Trung cấp</option>
                            <option value="2">Cao đẳng</option>
                            <option value="3">Đại học</option>
                            <option value="4">sau đại học</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="viTri" class="form-label ">7. Chọn vị trí</label>
                        <select name="viTri" id="viTri">
                            <option value="1">Lễ tân</option>
                            <option value="2">Phục vụ</option>
                            <option value="3">Chuyên viên</option>
                            <option value="4">Giám sát</option>
                            <option value="5">Quản lý</option>
                            <option value="6">Giám đốc</option>
                        </select>
                    </div>
                    <div class="mb-3">.
                        <label for="boPhan" class="form-label ">8. Chọn bộ phận</label>
                        <select name="boPhan" id="boPhan">
                            <option value="1">Sale – Marketing</option>
                            <option value="2">Hành Chính</option>
                            <option value="3">Phục vụ</option>
                            <option value="4">Quản lý</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="luong" class="form-label ">9.Nhập lương</label>
                        <input type="text" class="form-control" id="luong" aria-describedby="emailHelp"
                               name="luong" placeholder="Nhập Mô tả tiện nghi khác">
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
<div class="modal " id="updateModal">
    <div class="modal-dialog text-warning fw-bold">
        <div class="modal-content">

            <div class="modal-header bg-warning text-center text-white">
                <h4 class="modal-title">Thay đổi nhân viên</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <form action="">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="tenMoi" class="form-label ">1. Nhập tên nhân viên</label>
                        <input type="text" class="form-control" id="tenMoi" aria-describedby="emailHelp"
                               name="tenMoi" placeholder="Nhập tên nhân viên">
                    </div>
                    <div class="mb-3">
                        <label for="ngaySinhMoi" class="form-label ">2. Nhập ngày sinh </label>
                        <input type="text" class="form-control" id="ngaySinhMoi" aria-describedby="emailHelp"
                               name="ngaySinhMoi" placeholder="Nhập ngày sinh">
                    </div>
                    <div class="mb-3">
                        <label for="soCMNDMoi" class="form-label ">3. Nhập số CMND</label>
                        <input type="text" class="form-control" id="soCMNDMoi" aria-describedby="emailHelp"
                               name="soCMNDMoi" placeholder="Nhập số CMND">
                    </div>
                    <div class="mb-3">
                        <label for="soDienThoaiMoi" class="form-label ">4. Nhập số điện thoại</label>
                        <input type="text" class="form-control" id="soDienThoaiMoi" aria-describedby="emailHelp"
                               name="soDienThoaiMoi" placeholder="Nhập số điện thoại">
                    </div>
                    <div class="mb-3">
                        <label for="emailMoi" class="form-label ">5. Nhập email</label>
                        <input type="text" class="form-control" id="emailMoi" aria-describedby="emailHelp"
                               name="emailMoi" placeholder="Nhập email">
                    </div>
                    <div class="mb-3">
                        <label for="trinhDoMoi" class="form-label ">6. Chọn trình độ</label>
                        <select name="trinhDoMoi" id="trinhDoMoi">
                            <option value="1"> Trung cấp</option>
                            <option value="2">Cao đẳng</option>
                            <option value="3">Đại học</option>
                            <option value="4">sau đại học</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="viTriMoi" class="form-label ">7. Chọn vị trí</label>
                        <select name="viTriMoi" id="viTriMoi">
                            <option value="1">Lễ tân</option>
                            <option value="2">Phục vụ</option>
                            <option value="3">Chuyên viên</option>
                            <option value="4">Giám sát</option>
                            <option value="5">Quản lý</option>
                            <option value="6">Giám đốc</option>
                        </select>
                    </div>
                    <div class="mb-3">.
                        <label for="boPhanMoi" class="form-label ">8. Chọn bộ phận</label>
                        <select name="boPhanMoi" id="boPhanMoi">
                            <option value="1">Sale – Marketing</option>
                            <option value="2">Hành Chính</option>
                            <option value="3">Phục vụ</option>
                            <option value="4">Quản lý</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="luongMoi" class="form-label ">9.Nhập lương</label>
                        <input type="text" class="form-control" id="luongMoi" aria-describedby="emailHelp"
                               name="luongMoi" placeholder="Nhập Lương mơi">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                    <button type="submit" id="addBtn"  class="btn btn-outline-warning">Thêm mới</button>
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
                <p>Bạn muốn xóa nhân viên ......?</p>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-danger">Delete</button>
            </div>

        </div>
    </div>
</div>

<script src="bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
</body>
</html>