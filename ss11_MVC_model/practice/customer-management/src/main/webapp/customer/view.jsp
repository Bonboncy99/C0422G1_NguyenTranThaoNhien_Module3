<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 7/31/2022
  Time: 3:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<a href="/customer">Quay lại danh <sách></sách></a>
<%--<form method="post">--%>
<%--    <button type="submit" name="action" value="update" >Update</button>--%>
<%--    <button type="submit" name="action" value="delete" >Delete</button>--%>
<%--</form>--%>

<a href="/customer?action=update&id=${customer.id}">Cập nhật thông tin sản phẩm</a>
<a href="/customer?action=delete&id=${customer.id}">Xóa sản phẩm</a>
</body>
</html>
