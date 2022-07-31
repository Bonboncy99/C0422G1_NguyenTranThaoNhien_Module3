<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 7/31/2022
  Time: 3:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${message != null}">
    <p>${message}</p>
</c:if>

<c:if test="${message == null}">
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
                <td>${customer.address}</td>
                <td>${customer.name}</td>
                <td><a href="/customer?action=update&id=${customer.id}">Update</a></td>
                <td><a href="/customer?action=delete&id=${customer.id}">Delete</a></td>
            </tr>
        </c:forEach>
    </table></c:if>

<a href="/customer">Quay trở lại danh sách</a>
</body>
</html>
