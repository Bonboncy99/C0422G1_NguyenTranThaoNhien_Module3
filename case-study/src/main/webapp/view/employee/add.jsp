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
  <h4 class="p-3 bg-success text-white text-center">Thêm Khách hàng mới</h4>
  <div class="d-flex justify-content-center">
      <form action="" method="post" class="text-success fw-bold bg-light w-75 mt-5 mb-5 shadow-lg p-5">
          <div class="row">
              <div class="col-md-6 col-sm-12">
                  <div class="mb-3">
                      <label for="hoTen" class="form-label ">1. Nhập họ tên khách hàng </label>
                      <input type="text" class="form-control" id="hoTen" placeholder="Nhập họ tên khách hàng" name="hoTen">
                  </div>
                  <div class="mb-3">
                      <label for="ngaySinh" class="form-label ">2. Nhập ngày sinh </label>
                      <input type="text" class="form-control" id="ngaySinh"placeholder=" Nhập ngày sinh" name="ngaySinh">
                  </div>
                  <div class="mb-3">
                      <label for="gioiTinh" class="form-label ">3. Nhập giới tính </label>
                      <input type="text" class="form-control" id="gioiTinh" placeholder="Nhập giới tính" name="gioiTinh">
                  </div>
                  <div class="mb-3">
                      <label for="soCmnd" class="form-label ">4. Nhập số CMND </label>
                      <input type="text" class="form-control" id="soCmnd" placeholder="Nhập số CMND " name="soCmnd">
                  </div>
              </div>
              <div class="col-md-6 col-sm-12">
                  <div class="mb-3">
                      <label for="soDienThoai" class="form-label ">5. Nhập số điện thoại </label>
                      <input type="text" class="form-control" id="soDienThoai" placeholder="Nhập số điện thoại" name="soDienThoai">
                  </div>
                  <div class="mb-3">
                      <label for="email" class="form-label ">6. Nhập email </label>
                      <input type="text" class="form-control" id="email" placeholder="Nhập email" name="email">
                  </div>
                  <div class="mb-3">
                      <label for="loaiKhach" class="form-label ">7.Chọn loại khách </label>
                      <select name="loaiKhach" id="loaiKhach">
                          <option value="Diamond">Diamond</option>
                          <option value="Platinium">Platinium</option>
                          <option value="Gold">Gold</option>
                          <option value="Silver">Silver</option>
                          <option value="Member">Member</option>
                      </select>
                  </div>
                  <div class="mb-3">
                      <label for="diaChi" class="form-label ">8. Nhập địa chỉ </label>
                      <input type="text" class="form-control" id="diaChi" aria-describedby="emailHelp" name="diaChi"
                             placeholder="Nhập địa chỉ">
                  </div>
              </div>
          </div>
          <div>
              <a class="btn btn-primary" href="/Employee">Quay lại</a>
              <button type="submit" id="add" class="btn btn-outline-success">Thêm mới</button>
          </div>
      </form>
  </div>

  <script src="bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
  </body>
</html>
