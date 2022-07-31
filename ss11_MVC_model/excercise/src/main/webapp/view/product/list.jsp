<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 7/29/2022
  Time: 1:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh sách sản phẩm</h1>
<a href="/product?action=add">Thêm mới sản phẩm</a>
<form action="/product?action=search" method="post">
    <input type="text" placeholder="Tìm kiếm sản phẩm theo tên" name="name">
    <button type="submit">tìm Kiếm</button>
</form>

<table border="1">
    <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Price</td>
        <td>Description</td>
        <td>Producer</td>
        <td colspan="2"></td>
    </tr>
    <c:forEach var="product" items="${productList}">
        <tr>
            <td>${product.id}</td>
            <td><a href="/product?action=view&id=${product.id}">${product.name}</a></td>
            <td>${product.price}</td>
            <td>${product.description}</td>
            <td>${product.producer}</td>
            <td><a href="/product?action=update&id=${product.id}">Update</a></td>
            <td><a href="/product?action=delete&id=${product.id}">Delete</a></td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
