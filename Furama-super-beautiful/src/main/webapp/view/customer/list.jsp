<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 8/6/2022
  Time: 10:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Customer</title>
    <link rel="stylesheet" href="bootstrap-5.0.2-dist/css/bootstrap.min.css">
</head>
<body>
<h1>DANH SÁCH KHÁCH HÀNG</h1>

<a href="/Customer?action=addCustomer">Add customer</a>
<table class="border table table-striped table-hover" border="1">
    <thead class="table-success">
    <tr>
        <th>#</th>
        <th>Customer Type</th>
        <th>Name</th>
        <th>Date of birth</th>
        <th>Gender</th>
        <th>Id card</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Address</th>
        <th></th>
        <th></th>
    </tr>
    </thead>

    <c:forEach items="${customerList}" var="customer">
        <tr>
            <td>${customer.id}</td>
            <td>
                <c:forEach items="${customerTypeList}" var="customerType">
                    <c:if test="${customer.customerTypeId==customerType.customerTypeId}">
                        ${customerType.customerTypeName}
                    </c:if>
                </c:forEach>
            </td>
            <td>${customer.name}</td>
            <td>${customer.dateOfBirth}</td>
            <td>
                <c:if test="${customer.gender==false}">
                    Female
                </c:if>
                <c:if test="${customer.gender==true}">
                    Male
                </c:if>
            </td>
            <td>${customer.idCard}</td>
            <td>${customer.phoneNumber}</td>
            <td>${customer.email}</td>
            <td>${customer.address}</td>
            <td><a href="/Customer?action=updateCustomer&idUpdate=${customer.id}">UPDATE</a></td>
            <td>
<%--                <a href="/Customer?action=deleteCustomer">DELETE1</a>--%>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal" onclick="getIdToDelete('${customer.id}','${customer.name}')">
                    DELETE
                </button>

            </td>
        </tr>
    </c:forEach>
    <c:if test="${message!=null}">
        <tr>
            <td>${message}</td>
        </tr>
    </c:if>
    <tr>
        <td></td>
    </tr>
</table>

<a href="/Furama" class="btn btn-outline-primary">Return Home</a>

<!-- The Modal -->
<div class="modal" id="deleteModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">DELETE CUSTOMER</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <p>Id:</p>
                <form action="/Customer?action=deleteCustomer" method="post">
                    <input type="text" readonly id="idDelete" name="id">
                    <p>Name</p>
                    <input type="text" readonly id="nameDelete">
                    <p>Do you want to delete Customer:</p>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" data-bs-dismiss="modal">CLOSE</button>
                        <button>DELETE</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>



<script>
<%--    thêm value cho thẻ input--%>
    function getIdToDelete(id,name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").value = name;
    }
</script>
<script src="bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
</body>
</html>
