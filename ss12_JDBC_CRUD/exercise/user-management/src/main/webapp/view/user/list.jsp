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
    <link rel="stylesheet" href="bootstrap-5.0.2-dist/css/bootstrap.min.css">
</head>
<body>
<h1 class="p-3 bg-primary text-white">USER LIST</h1>


<a class="btn btn-outline-info" href="/User?action=add">Add user</a>
<form action="/User?action=search" method="post">
    <input type="text" placeholder="Enter country" name="country">
    <button class="btn btn-outline-success" type="submit">Search</button>
</form>
<a href="/User?action=sort" class="btn btn-success" >SORT</a>
<table class="table table-hover table-info">
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
            <th><a class="btn btn-outline-info" href="/User?action=update&id=${user.id}">Update</a></th>
            <th><a class="btn btn-outline-danger" href="/User?action=delete&id=${user.id}">Delete</a></th>
        </tr>
    </c:forEach>
</table>


<%--Danh sách trả về của search--%>
<c:if test="${message != null}">
    <p>${message}</p>
    <a class="btn btn-outline-primary" href="/User">Return</a>
</c:if>
<c:if test="${userListSearch != null}">
    <table class="table table-hover table-info">
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
                <th><a class="btn btn-outline-info" href="/User?action=update&id=${user.id}">Update</a></th>
                <th><a class="btn btn-outline-danger" href="/User?action=delete&id=${user.id}">Delete</a></th>
            </tr>
        </c:forEach>
    </table>
    <a class="btn btn-outline-primary" href="/User">Return</a>
</c:if>

<%--Danh sách trả về của sort--%>
<c:if test="${userListSort != null}">
    <table class="table table-hover table-info">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th></th>
            <th></th>
        </tr>

        <c:forEach var="user" items="${userListSort}">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.country}</td>
                <th><a class="btn btn-outline-info" href="/User?action=update&id=${user.id}">Update</a></th>
                <th><a class="btn btn-outline-danger" href="/User?action=delete&id=${user.id}">Delete</a></th>
            </tr>
        </c:forEach>
    </table>
    <a class="btn btn-outline-primary"href="/User">Return</a>
</c:if>
<script src="bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
</body>
</html>
