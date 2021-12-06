<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new employee</title>
    <style>
        .message{
            color:green;
        }
    </style>
</head>
<body>
<h1>Create new employee</h1>

<form action="/employee_servlet" method="post">
    <input type="hidden" name="choose" value="create">
    <fieldset>
        <legend>employee information</legend>
        <table>
            <tr>
                <td>Employee Code: </td>
                <td><input type="text" name="employeeCode" ></td>
            </tr>
            <tr>
                <td>Employee Name: </td>
                <td><input type="text" name="fullName" ></td>
            </tr>
            <tr>
                <td>Employee Date Of Birth: </td>
                <td><input type="text" name="dateOfBirth" ></td>
            </tr>
            <tr>
                <td>Employee Identity Card Number: </td>
                <td><input type="text" name="identityCardNumber" ></td>
            </tr>
            <tr>
                <td>Employee PhoneNumber: </td>
                <td><input type="text" name="phoneNumber" ></td>
            </tr>
            <tr>
                <td>Employee Email: </td>
                <td><input type="text" name="email" ></td>
            </tr>
            <tr>
                <td>Employee Salary: </td>
                <td><input type="text" name="salary" ></td>
            </tr>
            <tr>
                <td>Employee Address: </td>
                <td><input type="text" name="address" ></td>
            </tr>
            <tr>
                <td>Employee Position: </td>
                <td><input type="text" name="position" ></td>
            </tr>
            <tr>
                <td>Employee Education Degree: </td>
                <td><input type="text" name="educationDegree" ></td>
            </tr>
            <tr>
                <td>Employee Division: </td>
                <td><input type="text" name="division" ></td>
            </tr>
            <tr>
                <td>Employee User Name: </td>
                <td><input type="text" name="userName" ></td>
            </tr>
            <tr>
                <td><input type="submit" value="Create Employee" ></td>
            </tr>

        </table>
    </fieldset>
</form>

</body>
</html>

