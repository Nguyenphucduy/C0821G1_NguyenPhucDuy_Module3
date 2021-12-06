<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Employee Management Application</title>
</head>
<body>
<center>
    <h1>Employee Management</h1>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Employee
                </h2>
            </caption>

            <tr>
                <input type="hidden" name="edit" />"
            </tr>

            <tr>
                <th>Code Employee:</th>
                <td>
                    <input type="hidden" name="employeeCode"
                           value="<c:out value='${employee.employeeCode}' />"
                    />
                </td>
            <tr>
                <td>Full Name: </td>
                <td><input type="text" name="fullName"
                           value="<c:out value='${employee.fullName}' />"
                ></td>
            </tr>
            <tr>
                <td>Date Of Birth: </td>
                <td><input type="text" name="dateOfBirth"
                           value="<c:out value='${employee.dateOfBirth}' />"
                ></td>
            </tr>

            <tr>
                <td>Identity Card Number: </td>
                <td><input type="text" name="identityCardNumber"
                           value="<c:out value='${employee.identityCardNumber}' />"
                ></td>
            </tr>

            <tr>
                <td>Phone Number: </td>
                <td><input type="text" name="phoneNumber"
                           value="<c:out value='${employee.phoneNumber}' />"
                ></td>
            </tr>

            <tr>
                <td>Email: </td>
                <td><input type="text" name="email"
                           value="<c:out value='${employee.email}' />"
                ></td>
            </tr>

            <tr>
                <td>Salary: </td>
                <td><input type="text" name="salary"
                           value="<c:out value='${employee.salary}' />"
                ></td>
            </tr>

            <tr>
                <td>Address: </td>
                <td><input type="text" name="address"
                           value="<c:out value='${employee.address}' />"
                ></td>
            </tr>

            <tr>
                <td>Position: </td>
                <td><input type="text" name="position"
                           value="<c:out value='${employee.position}' />"
                ></td>
            </tr>
            <tr>
                <td>EducationDegree: </td>
                <td><input type="text" name="educationDegree"
                           value="<c:out value='${employee.educationDegree}' />"
                ></td>
            </tr>

            <tr>
                <td>Division: </td>
                <td><input type="text" name="division"
                           value="<c:out value='${employee.division}' />"
                ></td>
            </tr>
            <tr>
                <td>UserName: </td>
                <td><input type="text" name="userName"
                           value="<c:out value='${employee.userName}' />"
                ></td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Update"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>


