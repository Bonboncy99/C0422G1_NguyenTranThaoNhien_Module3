<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 8/7/2022
  Time: 1:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Update Customer</title>
</head>
<body>
<h1>Update Customer</h1>

<c:if test="${message != null}">
    <p>${message}</p>
</c:if>


<form action="/Customer?action=updateCustomer" method="post">
    <input type="text" readonly name="id" value="${customer.id}">

    <select name="customerType" id="customerType">
        <c:forEach var="customerType" items="${customerTypeList}">
            <c:if test="${customer.customerTypeId==customerType.customerTypeId}">
                <option value="${customerType.customerTypeId}">${customerType.customerTypeName}</option>
            </c:if>
        </c:forEach>

        <c:forEach items="${customerTypeList}" var="customerType">
            <c:if test="${customer.customerTypeId!=customerType.customerTypeId}">
                <option value="${customerType.customerTypeId}">${customerType.customerTypeName}</option>
            </c:if>
        </c:forEach>
    </select>
    <p>Enter name</p>
    <input type="text" placeholder="Enter customer name" value="${customer.name}" name="name">
    <p>Select birthday</p>
    <input type="date" name="dayOfBirth" value="${customer.dateOfBirth}" >
    <p>Select gender</p>
    <select name="gender" id="gender">
        <c:if test="${customer.gender == true}">
            <option value="true">Male</option>
            <option value="false">Female</option>
        </c:if>
        <c:if test="${customer.gender == false}">
            <option value="false">Female</option>
            <option value="true">Male</option>
        </c:if>
    </select>
    <p>Enter Customer Id Card</p>
    <input type="text" placeholder="Enter customer Id Card" value="${customer.idCard}" name="idCard">
    <p>Enter customer phone</p>
    <input type="text" placeholder="Enter customer phone" value="${customer.phoneNumber}"name="phone">
    <p>Enter customer email</p>
    <input type="email" placeholder="Enter customer email" value="${customer.email}" name="email">
    <p>Enter customer adress</p>
    <input type="text" placeholder="Enter customer adress" value="${customer.address}" name="address">
    <button>UPDATE</button>
    <a href="/Customer">Return Customer List</a>
</form>

</body>
</html>
