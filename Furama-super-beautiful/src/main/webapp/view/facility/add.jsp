<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 8/7/2022
  Time: 12:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Facility</title>
    <link rel="stylesheet" href="bootstrap-5.0.2-dist/css/bootstrap.min.css">
</head>
<body>
<h1>ADD FACILITY</h1>

<c:if test="${message!=null}">
    <p>${message}</p>
</c:if>
<div class="d-flex justify-content-center">
    <form action="/Facility?action=addFacility" method="post" class="w-50">
        <div class="row">
            <p>select facility to add</p>
            <select name="facilityTypeId" id="FacilityType" onchange="displayInput()">
                <option value="none">Select facility type</option>
                <option value="1">Villa</option>
                <option value="2">House</option>
                <option value="3">Room</option>
            </select>
        </div>
        <div class="row">
            <div class="col-md-6">
                <p>Name</p>
                <input type="text" placeholder="Name" name="name">

                <p>Area</p>
                <input type="text" placeholder="Area" name="area">

                <p>Cost</p>
                <input type="text" placeholder="Cost" name="cost">

                <p>Max people</p>
                <input type="text" placeholder="Max people" name="maxPeople">

                <p>Select Rent Type id</p>
                <select name="rentTypeId" id="rentTypeId">
                    <c:forEach var="rentType" items="${rentTypeList}">
                        <option value="${rentType.rentTypeId}">${rentType.rentTypeName}</option>
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
                    <input type="text" placeholder="standard room" name="standardRoom" value="0">
                </div>

                <div style="display: none" id="divDescriptionOtherConvenience">
                    <p>description other convenience</p>
                    <input type="text" placeholder="description other convenience" name="descriptionOtherConvenience">
                </div>

                <div style="display: none" id="divPoolArea">
                    <p>pool area</p>
                    <input type="text" placeholder="pool area" name="poolArea" value="0">
                </div>

                <div style="display: none" id="divNumberOfFloor">
                    <p>number of floor</p>
                    <input type="text" placeholder="number of floor" name="numberOfFloor" value="0">
                </div>

                <div style="display: none" id="divFacilityFree">
                    <p>facility free</p>
                    <input type="text" placeholder="facility free" name="facilityFree">
                </div>
            </div>
        </div>
        <button>ADD</button>
    </form>
</div>

<script>
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
<a href="/Facility">Return Facility List</a>
</body>
</html>
