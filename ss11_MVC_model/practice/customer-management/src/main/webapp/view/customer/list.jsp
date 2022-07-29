<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 7/28/2022
  Time: 11:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Customers</h1>
<p><a href="/customers?action=create"></a>Create New Customer</p>
<table border="1">
    <tr>
        <td>Name</td>
        <td>Email</td>
        <td>Address</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach var="customer" items="${customerList}">
        <tr>
            <td><a href="/customers?action=view&id=${customer.id}">${customer.name}</a></td>
            <td>${customer.getEmail()}</td>
            <td>${customer.getAddress()}</td>
            <td><a href="/customers?action=edit&id=${customer.id}">Edit</a></td>
            <td><a href="/customers?action=view&id=${customer.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
