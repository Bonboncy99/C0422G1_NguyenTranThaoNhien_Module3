<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 7/31/2022
  Time: 3:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post">
    <p>Nhập tên khách hàng</p>
    <input type="text" name="name" value="${customer.name}">
    <p>Nhập email khách hàng</p>
    <input type="text" name="email" value="${customer.email}">
    <p>Nhập địa chỉ khách hàng</p>
    <input type="text" name="address" value="${customer.address}">
    <p></p>
    <button type="submit">Cập nhật</button>
</form>

<a href="/customer">Quay lại danh sách</a>
</body>
</html>
