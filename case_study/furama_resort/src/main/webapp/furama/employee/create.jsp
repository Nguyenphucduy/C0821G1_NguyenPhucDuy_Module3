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
                <td><input type="date" name="dateOfBirth" ></td>
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
                <td>
                    <select name="position" >
                        <option value="1">Lễ Tân</option>
                        <option value="2">Phục Vụ</option>
                        <option value="3">Chuyên Viên</option>
                        <option value="4">Giám Sát</option>
                        <option value="5">Quản Lý</option>
                        <option value="6">Giám Đốc</option>
                    </select>
                </td>
<%--                <td><input type="text" name="position" ></td>--%>
            </tr>
            <tr>
                <td>Employee Education Degree: </td>
                <td>
                    <select name="educationDegree" >
                        <option value="1">Cao Đẳng</option>
                        <option value="2">Đại Học</option>
                        <option value="3">Trung Cấp</option>
                        <option value="4">Sau Đại Học</option>
                    </select>
                </td>
<%--                <td><input type="text" name="educationDegree" ></td>--%>
            </tr>
            <tr>
                <td>Employee Division: </td>
                <td>
                    <select name="division" >
                        <option value="1">Sale - Marketing</option>
                        <option value="2">Hành Chính</option>
                        <option value="3">Phục Vụ</option>
                        <option value="4">Quản Lý</option>
                    </select>
                </td>
<%--                <td><input type="text" name="division" ></td>--%>
            </tr>
            <tr>
                <td>Employee User Name: </td>
                <td>
                    <select name="userName">
                        <c:forEach var="user" items="${userEmployeeList}">
                            <option value="<c:out value="${user.userName}"/>"><c:out value="${user.userName}"/></option>
                        </c:forEach>
                    </select>
                </td>
<%--                <td><input type="text" name="userName" ></td>--%>
            </tr>
            <tr>
                <td><input type="submit" value="Create Employee" ></td>
            </tr>

        </table>
    </fieldset>
</form>

</body>
</html>

