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
    <h3 style="color: green"><c:out value="${messenger}"/></h3>
    <h3 style="color: blue">
        Welcome, <%=request.getSession().getAttribute("usernameSession")%>
    </h3>

</div>

<div>
    <a href="/service_servlet?choose=create">
        <button>Create Service</button>
    </a>
</div>
<div>
    <a href="/service_servlet?choose=getListCustomer">
        <button>Get List Customer Using Service</button>
    </a>

</div>
<div>
    <a href="/service_servlet?choose=totalMoney">
        <button>Get List Total Money Service</button>
    </a>

</div>

<div>
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
    <c:forEach var="totalMoney" items="${serviceResortList}">
        <tr>
            <td><c:out value="${totalMoney.codeService}"/></td>
            <td><c:out value="${totalMoney.nameService}"/></td>
            <td><c:out value="${totalMoney.usableArea}"/></td>
            <td><c:out value="${totalMoney.rentCost}"/></td>
            <td><c:out value="${totalMoney.numberOfPeople}"/></td>
            <td><c:out value="${totalMoney.serviceTypeId}"/></td>
            <td><c:out value="${totalMoney.rentalType}"/></td>
            <td><c:out value="${totalMoney.standardRoom}"/></td>
            <td><c:out value="${totalMoney.descriptionOtherConvenience}"/></td>
            <td><c:out value="${totalMoney.poolArea}"/></td>
            <td><c:out value="${totalMoney.numberOfFloors}"/></td>


            <td><a href="/service_servlet?choose=edit&codeService=${totalMoney.codeService}">edit</a></td>
            <td><a href="/service_servlet?choose=delete&codeService=${totalMoney.codeService}"
                   onclick="return confirm('Are you sure you want to delete this item?')">delete</a></td>
        </tr>
    </c:forEach>
</table>


</body>
</html>

