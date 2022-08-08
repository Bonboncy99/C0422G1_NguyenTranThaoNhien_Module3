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
    <title>Update Facility</title>
    <link rel="stylesheet" href="bootstrap-5.0.2-dist/css/bootstrap.min.css">

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
<h1 class="p-3 text-white text-center bg-warning">UPDATE FACILITY</h1>
<%--<c:if test="${mess!=null}">--%>
    <p>${mess}</p>
<%--</c:if>--%>



<div class="d-flex justify-content-center">
    <form action="/Facility?action=updateFacility" method="post" class="w-50">
        <div class="row">
            <p>select facility to add</p>
            <select name="facilityTypeId" id="FacilityType" onchange="displayInput()">

                <c:forEach items="${facilityTypeList}" var="facilityType">
                    <c:if test="${facility.facilityTypeId==facilityType.facilityTypeId}">
                        <option value="${facilityType.facilityTypeId}">${facilityType.facilityTypeName}</option>
                    </c:if>
                </c:forEach>

                <c:forEach items="${facilityTypeList}" var="facilityType">
                    <c:if test="${facility.facilityTypeId!=facilityType.facilityTypeId}">
                        <option value="${facilityType.facilityTypeId}">${facilityType.facilityTypeName}</option>
                    </c:if>
                </c:forEach>

                <option value="none">Select facility type</option>
            </select>
        </div>
        <p>ID</p>
        <input type="text" readonly value="${facility.facilityId}" id="idUpdate" name="idUpdate">
        <div class="row">
            <div class="col-md-6">
                <p>Name</p>
                <input type="text" placeholder="Name" name="name" value="${facility.facilityName}">

                <p>Area</p>
                <input type="text" placeholder="Area" name="area" value="${facility.area}">

                <p>Cost</p>
                <input type="text" placeholder="Cost" name="cost" value="${facility.cost}">

                <p>Max people</p>
                <input type="text" placeholder="Max people" name="maxPeople" value="${facility.maxPeople}">

                <p>Select Rent Type id</p>

                <select name="rentTypeId" id="rentTypeId">
                    <c:forEach var="rentType" items="${rentTypeList}">
                        <c:if test="${facility.rentTypeId==rentType.rentTypeId}">
                            <option value="${rentType.rentTypeId}">${rentType.rentTypeName}</option>
                        </c:if>
                    </c:forEach>

                    <c:forEach var="rentType" items="${rentTypeList}">
                        <c:if test="${facility.rentTypeId!=rentType.rentTypeId}">
                            <option value="${rentType.rentTypeId}">${rentType.rentTypeName}</option>
                        </c:if>
                    </c:forEach>
                </select>

                <p>Select facility type id</p>
                <%--        <select name="facilityTypeId" id="b">--%>
                <%--            <c:forEach var="facilityType" items="${facilityTypeList}">--%>
                <%--                <option value="${facilityType.facilityTypeId}">${facilityType.facilityTypeName}</option>--%>
                <%--            </c:forEach>--%>
                <%--        </select>--%>

            </div>
            <div class="col-md-6">
                <div style="display: none" id="divStandardRoom">
                    <p>standard room</p>
                    <input type="text" placeholder="standard room" name="standardRoom" value="${facility.standardRoom}">
                </div>

                <div style="display: none" id="divDescriptionOtherConvenience">
                    <p>description other convenience</p>
                    <input type="text" placeholder="description other convenience" name="descriptionOtherConvenience" value="${facility.descriptionOtherConvenience}">
                </div>

                <div style="display: none" id="divPoolArea">
                    <p>pool area</p>
                    <input type="text" placeholder="pool area" name="poolArea" value="${facility.poolArea}">
                </div>

                <div style="display: none" id="divNumberOfFloor">
                    <p>number of floor</p>
                    <input type="text" placeholder="number of floor" name="numberOfFloor" value="${facility.numberOfFloor}">
                </div>

                <div style="display: none" id="divFacilityFree">
                    <p>facility free</p>
                    <input type="text" placeholder="facility free" name="facilityFree" value="${facility.facilityFree}">
                </div>
            </div>
            <button>UPDATE</button>
        </div>

    </form>
</div>
<a href="/Facility">Return Facility List</a>

<script>
    let idDelete= document.getElementById("idUpdate").value;
    window.onload=displayInput(idDelete);
    function displayInput() {
        let facilityChoice = document.getElementById("FacilityType").value;
        console.log(facilityChoice);
        let divStandardRoom = document.getElementById("divStandardRoom");
        let divDescriptionOtherConvenience = document.getElementById("divDescriptionOtherConvenience");
        let divPoolArea = document.getElementById("divPoolArea");
        let divNumberOfFloor = document.getElementById("divNumberOfFloor");
        let divFacilityFree = document.getElementById("divFacilityFree");
        switch (facilityChoice) {
            case "none":
                divStandardRoom.style.display = "none";
                divDescriptionOtherConvenience.style.display = "none";
                divPoolArea.style.display = "none";
                divNumberOfFloor.style.display = "none";
                divFacilityFree.style.display = "none";
                break
            case "1":
                //villa
                divStandardRoom.style.display = "block";
                divDescriptionOtherConvenience.style.display = "block";
                divPoolArea.style.display = "block";
                divNumberOfFloor.style.display = "block";
                divFacilityFree.style.display = "none";
                break
            case "2":
                //house
                divStandardRoom.style.display = "block";
                divDescriptionOtherConvenience.style.display = "block";
                divPoolArea.style.display = "none";
                divNumberOfFloor.style.display = "block";
                divFacilityFree.style.display = "none";
                break
            case "3":
                //room
                divStandardRoom.style.display = "none";
                divDescriptionOtherConvenience.style.display = "none";
                divPoolArea.style.display = "none";
                divNumberOfFloor.style.display = "none";
                divFacilityFree.style.display = "block";
                break
        }
    }
</script>

<button type="button" hidden class="btn btn-primary" id="modalBtn" data-bs-toggle="modal" data-bs-target="#resultMess">
    Open modal
</button>
<div class="modal" id="resultMess">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Modal Heading</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="d-flex justify-content-center">
                    <c:if test="${check=true}">
                        <p class="p-3 bg-success text-center text-white w-50">SUCCESS</p>
                    </c:if>
                    <c:if test="${check=false}">
                        <p class="p-3 bg-danger text-center text-white w-50">SUCCESS</p>
                    </c:if>
                </div>            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>
<script>
    document.getElementById("resultMess").click();
</script>

</body>
</html>
