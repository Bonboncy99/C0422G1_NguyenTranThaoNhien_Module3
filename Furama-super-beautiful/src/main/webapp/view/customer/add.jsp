<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 8/7/2022
  Time: 12:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Customer</title>
</head>
<body>
<p>${message}</p>
<form action="/Customer?action=addCustomer" method="post">
    <select name="customerType" id="customerType">
        <option value="1">Diamond</option>
        <option value="2">Platinium</option>
        <option value="3">Gold</option>
        <option value="4">silver</option>
        <option value="5">Member</option>
    </select>
    <p>Enter name</p>
    <input type="text" placeholder="Enter customer name" name="name">
    <p>Select birthday</p>
    <input type="date" name="dayOfBirth" >
    <p>Select gender</p>
    <select name="gender" id="gender">
        <option value="true">Male</option>
        <option value="false">Female</option>
    </select>
    <p>Enter Customer Id Card</p>
    <input type="text" placeholder="Enter customer Id Card" name="idCard">
    <p>Enter customer phone</p>
    <input type="text" placeholder="Enter customer phone" name="phone">
    <p>Enter customer email</p>
    <input type="email" placeholder="Enter customer email" name="email">
    <p>Enter customer adress</p>
    <input type="text" placeholder="Enter customer adress" name="address">
    <button>ADD</button>
    <a href="/Customer">Return Customer List</a>
</form>

</body>
</html>
