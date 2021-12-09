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
    <c:forEach var="customer" items="${customerListUsingService}">
        <tr>
            <td><c:out value="${customer.customerCode}"/></td>
            <td><c:out value="${customer.fullName}"/></td>
            <td><c:out value="${customer.dateOfBirth}"/></td>
            <td>
                <c:out value="${customer.gender}"/>
            </td>
            <td><c:out value="${customer.identityCardNumber}"/></td>
            <td><c:out value="${customer.phoneNumber}"/></td>
            <td><c:out value="${customer.email}"/></td>
            <td><c:out value="${customer.address}"/></td>
            <td><c:out value="${customer.customerType}"/></td>
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
    <c:forEach var="customer" items="${serviceAttachList}">
        <tr>
            <td><c:out value="${customer.attachServiceCode}"/></td>
            <td><c:out value="${customer.attachServiceName}"/></td>
            <td><c:out value="${customer.attachServiceUnit}"/></td>
            <td><c:out value="${customer.attachServiceCost}"/></td>
            <td><c:out value="${customer.attachServiceQuantity}"/></td>
            <td><c:out value="${customer.attachServiceStatus}"/></td>
        </tr>
    </c:forEach>


</table>


</body>
</html>
