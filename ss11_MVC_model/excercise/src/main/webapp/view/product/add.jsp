<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 7/29/2022
  Time: 1:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Thêm mới sản phẩm</h1>
<a href="/product">Quay lại danh sách sản phẩm</a>
<form action="/product?action=add" method="post">
    <input type="text" name="id" placeholder="Nhập id sản phẩm">
    <input type="text" name="name" placeholder="Nhập tên sản phẩm">
    <input type="text" name="price" placeholder="Nhập giá sản phẩm">
    <input type="text" name="description" placeholder="Nhập mô tả sản phẩm">
    <input type="text" name="producer" placeholder="Nhập nhà sản xuất">
    <button type="submit">Thêm Mới</button>
</form>
<c:if test="${message != null}">
    <p>${message}</p>
</c:if>
</body>
</html>
