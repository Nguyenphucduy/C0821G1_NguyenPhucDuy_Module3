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
    <c:forEach var="contract_detail" items="${customerListUsingService}">
        <tr>
            <td><c:out value="${contract_detail.customerCode}"/></td>
            <td><c:out value="${contract_detail.fullName}"/></td>
            <td><c:out value="${contract_detail.dateOfBirth}"/></td>
            <td>
                <c:out value="${contract_detail.gender}"/>
            </td>
            <td><c:out value="${contract_detail.identityCardNumber}"/></td>
            <td><c:out value="${contract_detail.phoneNumber}"/></td>
            <td><c:out value="${contract_detail.email}"/></td>
            <td><c:out value="${contract_detail.address}"/></td>
            <td><c:out value="${contract_detail.customerType}"/></td>
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
    <c:forEach var="contract_detail" items="${serviceAttachList}">
        <tr>
            <td><c:out value="${contract_detail.attachServiceCode}"/></td>
            <td><c:out value="${contract_detail.attachServiceName}"/></td>
            <td><c:out value="${contract_detail.attachServiceUnit}"/></td>
            <td><c:out value="${contract_detail.attachServiceCost}"/></td>
            <td><c:out value="${contract_detail.attachServiceQuantity}"/></td>
            <td><c:out value="${contract_detail.attachServiceStatus}"/></td>
        </tr>
    </c:forEach>


</table>


</body>
</html>
