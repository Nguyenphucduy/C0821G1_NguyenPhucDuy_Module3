<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Service</title>
</head>
<body>
<div>
    <h2>List Service</h2>
</div>
<div>
    <p style="color: red"><c:out value="${msg}"/></p>

</div>

<div>
    <a href="/service_servlet?choose=create">
        <button>Create Service</button>
    </a>

    <form method="post" action="/service_servlet">
        <input type="hidden" name="choose" value="search">
        <input type="text" name="nameService">
        <button>Search</button>
    </form>
</div>

<table border="1">
    <tr>
        <td>Id</td>
        <td>Name</td>
        <td>Area</td>
        <td>Rent cost</td>
        <td>Number of people</td>
        <td>Service type id</td>
        <td>Rent type id</td>
        <td>Standard room</td>
        <td>Description other convenience</td>
        <td>Pool area</td>
        <td>Number of floors</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach var="contractDetail" items="${serviceResortList}">
        <tr>
            <td><c:out value="${contractDetail.codeService}"/></td>
            <td><c:out value="${contractDetail.nameService}"/></td>
            <td><c:out value="${contractDetail.usableArea}"/></td>
            <td>
                    <%--                <c:if test="${customer.gender == 1}">--%>
                    <%--                    Male--%>
                    <%--                </c:if>--%>
                    <%--                <c:if test="${customer.gender == 0}">--%>
                    <%--                    Famale--%>
                    <%--                </c:if>--%>
                <c:out value="${contractDetail.rentCost}"/>
            </td>
            <td><c:out value="${contractDetail.numberOfPeople}"/></td>
            <td><c:out value="${contractDetail.serviceTypeId}"/></td>
            <td><c:out value="${contractDetail.rentalType}"/></td>
            <td><c:out value="${contractDetail.standardRoom}"/></td>
            <td><c:out value="${contractDetail.descriptionOtherConvenience}"/></td>
            <td><c:out value="${contractDetail.poolArea}"/></td>
            <td><c:out value="${contractDetail.numberOfFloors}"/></td>


            <td><a href="/service_servlet?choose=edit&codeService=${contractDetail.codeService}">edit</a></td>
            <td><a href="/service_servlet?choose=delete&codeService=${contractDetail.codeService}">delete</a></td>
        </tr>
    </c:forEach>
</table>


</body>
</html>

