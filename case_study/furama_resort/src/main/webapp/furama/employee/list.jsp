<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Employee</title>
</head>
<body>
<div>
    <h2>List Employee</h2>
</div>

<h3 style="color: blue">
    Welcome, <%=request.getSession().getAttribute("usernameSession")%>
</h3>
<div>
    <h3 style="color: green"><c:out value="${messenger}"/></h3>

</div>

<div>
    <a href="/employee_servlet?choose=create">
        <button>Create Employee</button>
    </a>
    <a href="/employee_servlet?choose=createUser">
        <button>Create User Employee</button>
    </a>

    <form method="post" action="/employee_servlet">
        <input type="hidden" name="choose" value="search">
        <input type="text" name="nameEmployee">
        <button>Search</button>
    </form>
</div>

<table border="1">
    <tr>
        <td>Id</td>
        <td>Name</td>
        <td>Data of birth</td>
        <td>Identity Card Number</td>
        <td>Phone Number</td>
        <td>Email</td>
        <td>Salary</td>
        <td>Address</td>
        <td>Position</td>
        <td>Education Degree</td>
        <td>Division</td>
        <td>User Name</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach var="contract_detail" items="${employeeList}">
        <tr>
            <td><c:out value="${contract_detail.employeeCode}"/></td>
            <td><c:out value="${contract_detail.fullName}"/></td>
            <td><c:out value="${contract_detail.dateOfBirth}"/></td>
            <td><c:out value="${contract_detail.identityCardNumber}"/></td>
            <td><c:out value="${contract_detail.phoneNumber}"/></td>
            <td><c:out value="${contract_detail.email}"/></td>
            <td><c:out value="${contract_detail.salary}"/></td>
            <td><c:out value="${contract_detail.address}"/></td>
            <td><c:out value="${contract_detail.position}"/></td>
            <td><c:out value="${contract_detail.educationDegree}"/></td>
            <td><c:out value="${contract_detail.division}"/></td>
            <td><c:out value="${contract_detail.userName}"/></td>


            <td><a href="/employee_servlet?choose=edit&employeeCode=${contract_detail.employeeCode}">edit</a></td>
            <td><a href="/employee_servlet?choose=delete&employeeCode=${contract_detail.employeeCode}"
                   onclick="return confirm('Are you sure you want to delete this item?')" >delete</a></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>


