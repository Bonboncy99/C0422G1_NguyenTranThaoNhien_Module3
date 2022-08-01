<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 8/1/2022
  Time: 4:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>UPDATE USER</h1>

<c:if test="${message != null}">
    <p>${message}</p>
</c:if>

<c:if test="${user != null}">
<form method="post">
    <p>Enter user name</p>
    <input type="text" name="name" value="${user.name}">
    <p>Enter user email</p>
    <input type="text" name="email" value="${user.email}">
    <p>Enter user country</p>
    <input type="text" name="country" value="${user.country}">
    <button type="submit">Update</button>
</form>
</c:if>
<a href="/User">Return User List</a>

</body>
</html>
