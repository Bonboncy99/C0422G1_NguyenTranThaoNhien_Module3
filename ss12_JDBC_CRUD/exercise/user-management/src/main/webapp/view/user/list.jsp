<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 8/1/2022
  Time: 3:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>USER LIST</h1>

<a href="/User?action=add">Add user</a>
<form action="/User?action=search" method="post">
    <input type="text" placeholder="Enter country">
    <button type="submit">Search</button>
</form>
<a href="/User?action=sort">SORT</a>
<table border="1">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th></th>
        <th></th>
    </tr>

    <c:forEach var="user" items="${userList}">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.country}</td>
            <th><a href="/User?action=update&id=${user.id}">Update</a></th>
            <th><a href="/User?action=delete&id=${user.id}">Delete</a></th>
        </tr>
    </c:forEach>
</table>

<c:if test="${message != null}">
    <p>${message}</p>
    <a href="/User">Return</a>
</c:if>
<c:if test="${userListSearch != null}">
    <table border="1">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th></th>
            <th></th>
        </tr>

        <c:forEach var="user" items="${userListSearch}">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.country}</td>
                <th><a href="/User?action=update&id=${user.id}">Update</a></th>
                <th><a href="/User?action=delete&id=${user.id}">Delete</a></th>
            </tr>
        </c:forEach>
    </table>
    <a href="/User">Return</a>
</c:if>
</body>
</html>
