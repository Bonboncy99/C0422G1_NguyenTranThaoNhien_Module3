<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 7/31/2022
  Time: 12:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap-5.0.2-dist/js/bootstrap.min.js">
</head>
<body>
<h1>Danh sách khách hàng</h1>
<br>
<a href="/customer?action=add">Thêm mới khách hàng</a>
<br>


<form method="post" action="/customer?action=search" class="d-flex">
    <input class="form-control me-2" type="search" placeholder="Tìm kiếm theo tên" aria-label="Search" name="name">
    <button class="btn btn-success" type="submit">Search</button>
</form>

<table border="1">
    <tr>
        <th>STT</th>
        <th>Id</th>
        <th>Tên khách hàng</th>
        <th>Email</th>
        <th>Địa chỉ khách hàng</th>
        <th></th>
        <th></th>
    </tr>
    <c:forEach var="customer" items="${customerList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${customer.id}</td>
            <td><a href="/customer?action=view&id=${customer.id}">${customer.name}</a></td>
            <td>${customer.email}</td>
            <td>${customer.address}</td>
            <td><a href="/customer?action=update&id=${customer.id}">Update</a></td>
            <td><a href="/customer?action=delete&id=${customer.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
<script src="bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
</body>
</html>
