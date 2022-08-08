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
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css" />
    <style>
        body{
            background: url("https://media.istockphoto.com/photos/grunge-background-picture-id637350420?k=20&m=637350420&s=612x612&w=0&h=JyGkD_lC9eAiswveaJqtIZtYTZvLazrIAXCgHoxrzHA=");
        }
    </style>
</head>
<body>
<!--navbar-->
<div class="fixed-top" style="margin: 0">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class=" navbar-nav me-auto mb-2 mb-lg-0">
                    <div class="container" style="width: 60px;height: 60px">
                        <a class="navbar-brand" href="/Furama">
                            <img class="img-fluid" src="https://furamavietnam.com/wp-content/uploads/2018/08/logo@2x.png" alt="">
                        </a>
                    </div>

                    <li class="nav-item">
                        <a class="nav-link  fw-bold" href="/Furama?action=employee">Employee</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link  fw-bold" href="/Furama?action=customer" tabindex="-1" aria-disabled="true">Customer</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link  fw-bold" href="/Furama?action=service" tabindex="-1" aria-disabled="true">Service</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link  fw-bold" href="/Furama?action=contract" tabindex="-1" aria-disabled="true">Contract</a>
                    </li>
                </ul>
                <form class="d-flex ">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
                <div>
                    <a href="">Nguyễn Trần Thảo Nhiên</a>
                </div>
            </div>
        </div>
    </nav>
</div>
<div style="height: 150px;"></div>

<h1 class="p-3 text-white text-center bg-secondary">FACILITY LIST</h1>

    <div class="container mt-5 mb-5 justify-content-center">
        <div class="d-flex justify-content-start">
            <div class="w-50">
                <a class="btn btn-success" href="/Facility?action=addFacility">Add Facility</a>
            </div>
        </div>
        <div class="d-flex justify-content-center table-responsive ">
            <table id="facilityList" class="table-bordered table-hover table-striped table fw-bold">
                <thead class="bg-secondary text-center fw-bold text-white">
                <tr>
                    <th>STT</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Area</th>
                    <th>Cost</th>
                    <th>Max people</th>
                    <th>Rent Type id</th>
                    <th>facility type id</th>
                    <th>standard room</th>
                    <th>description other convenience</th>
                    <th>pool area</th>
                    <th>number of floor</th>
                    <th>facility free</th>
                    <th>Update</th>
                    <th>Delet</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="facility" items="${facilityList}" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
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
                        <td><a class="btn btn-warning" href="/Facility?action=updateFacility&idUpdate=${facility.facilityId}">UPDATE</a></td>
                        <td>
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal" onclick="getInfoToDelete('${facility.facilityId}','${facility.facilityName}')">
                                DELETE
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>


<!-- The Modal -->
<div class="modal" id="deleteModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header bg-danger text-white text-center">
                <h4 class="modal-title">DELETE FACILITY</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form action="/Facility?action=deleteFacility" method="post">
                <!-- Modal body -->
                <div class="modal-body">
                    Do you want to delete Facility:
                    <div>
                        <div class="input-group flex-nowrap">
                            <span class="input-group-text" id="addon-wrapping1">Id</span>
                            <input type="text" readonly  class="form-control" id="idDelete" name="idDeLete">
                        </div>
                        <div class="input-group flex-nowrap mt-3">
                            <span class="input-group-text" id="addon-wrapping2">Name</span>
                            <input type="text" readonly class="form-control" id="nameDeLete">
                        </div>
                    </div>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-bs-dismiss="modal">Close</button>
                    <button class="btn btn-danger">DELETE</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
<script>
    function getInfoToDelete(id,name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDeLete").value = name;
    }
</script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function() {
        $('#facilityList').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        } );
    } );
</script>
</body>
</html>
