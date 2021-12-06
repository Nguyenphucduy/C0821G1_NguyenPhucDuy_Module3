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
<div>
    <p style="color: red"><c:out value="${msg}"/></p>

</div>

<div>
    <a href="/employee_servlet?choose=create">
        <button>Create Employee</button>
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
    <c:forEach var="employee" items="${employeeList}">
        <tr>
            <td><c:out value="${employee.employeeCode}"/></td>
            <td><c:out value="${employee.fullName}"/></td>
            <td><c:out value="${employee.dateOfBirth}"/></td>
            <td><c:out value="${employee.identityCardNumber}"/></td>
            <td><c:out value="${employee.phoneNumber}"/></td>
            <td><c:out value="${employee.email}"/></td>
            <td><c:out value="${employee.salary}"/></td>
            <td><c:out value="${employee.address}"/></td>
            <td><c:out value="${employee.position}"/></td>
            <td><c:out value="${employee.educationDegree}"/></td>
            <td><c:out value="${employee.division}"/></td>
            <td><c:out value="${employee.userName}"/></td>


            <td><a href="/employee_servlet?choose=edit&employeeCode=${employee.employeeCode}">edit</a></td>
            <td><a href="/employee_servlet?choose=delete&employeeCode=${employee.employeeCode}">delete</a></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>


