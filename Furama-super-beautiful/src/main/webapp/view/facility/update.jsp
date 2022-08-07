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
UPDATE
<h1>UPDATE FACILITY</h1>
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


</body>
</html>
