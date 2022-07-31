<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 7/31/2022
  Time: 2:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Add Customer</h1>
<c:if test="${message!=null}">
    <h3>${message}</h3>
</c:if>
<form action="/customer?action=add" method="post">
    <p>Nhập tên khách hàng</p>
    <input type="text" name="name">
    <p>Nhập email khách hàng</p>
    <input type="text" name="email">
    <p>Nhập địa chỉ khách hàng</p>
    <input type="text" name="address">
    <p></p>
    <button type="submit">Thêm mới</button>
</form>

<a href="/customer">Quay lại danh sách</a>

</body>
</html>
