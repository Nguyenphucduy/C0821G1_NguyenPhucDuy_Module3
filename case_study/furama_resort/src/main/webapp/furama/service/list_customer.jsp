<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Customer Using Service</title>
</head>
<body>
<div>
    <h2>List Customer Using Service</h2>
</div>
<div>
    <p style="color: red"><c:out value="${msg}"/></p>

</div>


<table border="1">
    <tr>
        <td>Id</td>
        <td>Name</td>
        <td>Date Of Birth</td>
        <td>Gender</td>
        <td>Id Card</td>
        <td>Phone</td>
        <td>Email</td>
        <td>Address</td>
        <td>Type Id</td>
    </tr>
    <c:forEach var="totalMoney" items="${customerListUsingService}">
        <tr>
            <td><c:out value="${totalMoney.customerCode}"/></td>
            <td><c:out value="${totalMoney.fullName}"/></td>
            <td><c:out value="${totalMoney.dateOfBirth}"/></td>
            <td>
                <c:out value="${totalMoney.gender}"/>
            </td>
            <td><c:out value="${totalMoney.identityCardNumber}"/></td>
            <td><c:out value="${totalMoney.phoneNumber}"/></td>
            <td><c:out value="${totalMoney.email}"/></td>
            <td><c:out value="${totalMoney.address}"/></td>
            <td><c:out value="${totalMoney.customerType}"/></td>
        </tr>
    </c:forEach>


</table>
<div>
    <h2>List Attach Service </h2>
</div>
<table border="1">
    <tr>
        <td>Id</td>
        <td>Name</td>
        <td>Date Of Birth</td>
        <td>Gender</td>
        <td>Id Card</td>
        <td>Phone</td>
    </tr>
    <c:forEach var="totalMoney" items="${serviceAttachList}">
        <tr>
            <td><c:out value="${totalMoney.attachServiceCode}"/></td>
            <td><c:out value="${totalMoney.attachServiceName}"/></td>
            <td><c:out value="${totalMoney.attachServiceUnit}"/></td>
            <td><c:out value="${totalMoney.attachServiceCost}"/></td>
            <td><c:out value="${totalMoney.attachServiceQuantity}"/></td>
            <td><c:out value="${totalMoney.attachServiceStatus}"/></td>
        </tr>
    </c:forEach>


</table>


</body>
</html>
