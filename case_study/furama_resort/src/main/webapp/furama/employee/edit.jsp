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
                <td><input type="date" name="dateOfBirth"
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
                <td>Position:
                    <c:if test="${employee.position == 1}">
                        Lễ Tân
                    </c:if>
                    <c:if test="${employee.position == 2}">
                        Phục Vụ
                    </c:if>
                    <c:if test="${employee.position == 3}">
                        Chuyên Viên
                    </c:if>

                    <c:if test="${employee.position == 4}">
                        Giám Sát
                    </c:if>

                    <c:if test="${employee.position == 5}">
                        Quản Lý
                    </c:if>
                    <c:if test="${employee.position == 6}">
                        Giám Đốc
                    </c:if>
                </td>
<%--                <td><input type="text" name="position"--%>
<%--                           value="<c:out value='${employee.position}' />"--%>
<%--                ></td>--%>
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
            </tr>
            <tr>
                <td>EducationDegree:
                    <c:if test="${employee.educationDegree == 1}">
                        Cao Đẳng
                    </c:if>
                    <c:if test="${employee.educationDegree == 2}">
                        Đại Học
                    </c:if>
                    <c:if test="${employee.educationDegree == 3}">
                        Trung Cấp
                    </c:if>

                    <c:if test="${employee.educationDegree == 4}">
                        Sau Đại Học
                    </c:if>

                </td>
                <td>
                    <select name="educationDegree" >
                        <option value="1">Cao Đẳng</option>
                        <option value="2">Đại Học</option>
                        <option value="3">Trung Cấp</option>
                        <option value="4">Sau Đại Học</option>
                    </select>
                </td>
<%--                <td><input type="text" name="educationDegree"--%>
<%--                           value="<c:out value='${employee.educationDegree}' />"--%>
<%--                ></td>--%>
            </tr>

            <tr>
                <td>Division:
                    <c:if test="${employee.division == 1}">
                        Sale - Marketing
                    </c:if>
                    <c:if test="${employee.division == 2}">
                        Hành Chính
                    </c:if>
                    <c:if test="${employee.division == 3}">
                        Phục Vụ
                    </c:if>

                    <c:if test="${employee.division == 4}">
                        Quản Lý
                    </c:if>
                </td>
                <td>
                    <select name="division" >
                        <option value="1">Sale - Marketing</option>
                        <option value="2">Hành Chính</option>
                        <option value="3">Phục Vụ</option>
                        <option value="4">Quản Lý</option>
                    </select>
                </td>
<%--                <td><input type="text" name="division"--%>
<%--                           value="<c:out value='${employee.division}' />"--%>
<%--                ></td>--%>
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


