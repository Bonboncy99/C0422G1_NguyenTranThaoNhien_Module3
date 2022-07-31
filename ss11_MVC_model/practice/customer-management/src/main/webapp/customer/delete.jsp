<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 7/31/2022
  Time: 3:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Delete customer</h1>
<table border="1">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Email</th>
        <th>Address</th>
        <th colspan="2"></th>
    </tr>

    <tr>
        <td>${customer.id}</td>
        <td>${customer.name}</td>
        <td>${customer.email}</td>
        <td>${customer.address}</td>
    </tr>
</table>

<p>Bạn muốn xóa khách hàng này?</p>
<a href="/customer">KHÔNG</a>
<form method="post">
    <button type="submit">CÓ</button>
</form>
</body>
</html>
