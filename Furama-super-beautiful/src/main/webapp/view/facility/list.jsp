<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 8/7/2022
  Time: 12:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Facility</title>
    <link rel="stylesheet" href="bootstrap-5.0.2-dist/css/bootstrap.min.css">

</head>
<body>
<h1>FACILITY LIST</h1>

<a href="/Facility?action=addFacility">Add Facility</a>
<table border="1">
    <thead>
    <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Area</td>
        <td>Cost</td>
        <td>Max people</td>
        <td>Rent Type id</td>
        <td>facility type id</td>
        <td>standard room</td>
        <td>description other convenience</td>
        <td>pool area</td>
        <td>number of floor</td>
        <td>facility free</td>
    </tr>
    </thead>
    <c:forEach var="facility" items="${facilityList}">
        <tr>
            <td>${facility.facilityId}</td>
            <td>${facility.facilityName}</td>
            <td>${facility.area}</td>
            <td>${facility.cost}</td>
            <td>${facility.maxPeople}</td>

            <td>
                <c:forEach items="${rentTypeList}" var="rentType">
                    <c:if test="${facility.rentTypeId == rentType.rentTypeId}">
                        ${rentType.rentTypeName}
                    </c:if>
                </c:forEach>
            </td>

            <td>
                <c:forEach items="${facilityTypeList}" var="facilityType">
                    <c:if test="${facility.facilityTypeId == facilityType.facilityTypeId}">
                        ${facilityType.facilityTypeName}
                    </c:if>
                </c:forEach>
            </td>

            <td>${facility.standardRoom}</td>
            <td>${facility.descriptionOtherConvenience}</td>
            <td>${facility.poolArea}</td>
            <td>${facility.numberOfFloor}</td>
            <td>${facility.facilityFree}</td>
            <td><a href="/Facility?action=updateFacility&idUpdate=${facility.facilityId}">UPDATE</a></td>
            <td>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#deleteModal" onclick="getInfoToDelete('${facility.facilityId}','${facility.facilityName}')">
                    DELETE
                </button>
            </td>
        </tr>
    </c:forEach>
</table>

<!-- The Modal -->
<div class="modal" id="deleteModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">DELETE FACILITY</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form action="/Facility?action=deleteFacility" method="post">
                <!-- Modal body -->
                <div class="modal-body">
                    Do you want to delete Facility:
                    <P>Facility ID</P>
                    <input type="text" readonly name="idDeLete" id="idDeLete">
                    <p>Facility Name</p>
                    <input type="text" readonly id="nameDeLete">
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                    <button>DELETE</button>
                </div>
            </form>
        </div>
    </div>
</div>
<a href="/Furama">Return Home</a>
<script src="bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
<script>
    function getInfoToDelete(id,name) {
        document.getElementById("idDeLete").value = id;
        document.getElementById("nameDeLete").value = name;
    }
</script>
</body>
</html>
