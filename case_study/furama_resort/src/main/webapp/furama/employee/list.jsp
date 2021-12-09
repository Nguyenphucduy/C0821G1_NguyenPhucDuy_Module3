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
<%--    <a href="/employee_servlet?choose=createUser">--%>
<%--        <button>Create User Employee</button>--%>
<%--    </a>--%>

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
    <c:forEach var="customer" items="${employeeList}">
        <tr>
            <td><c:out value="${customer.employeeCode}"/></td>
            <td><c:out value="${customer.fullName}"/></td>
            <td><c:out value="${customer.dateOfBirth}"/></td>
            <td><c:out value="${customer.identityCardNumber}"/></td>
            <td><c:out value="${customer.phoneNumber}"/></td>
            <td><c:out value="${customer.email}"/></td>
            <td><c:out value="${customer.salary}"/></td>
            <td><c:out value="${customer.address}"/></td>
            <td>
                <c:if test="${customer.position == 1}">
                    Lễ Tân
                </c:if>
                <c:if test="${customer.position == 2}">
                    Phục Vụ
                </c:if>
                <c:if test="${customer.position == 3}">
                    Chuyên Viên
                </c:if>
                <c:if test="${customer.position == 4}">
                    Giám Sát
                </c:if>
                <c:if test="${customer.position == 5}">
                    Quản Lý
                </c:if>
                <c:if test="${customer.position == 6}">
                    Giám Đốc
                </c:if>
            </td>
            <td>
                <c:if test="${customer.educationDegree == 1}">
                    Cao Đẳng
                </c:if>
                <c:if test="${customer.educationDegree == 2}">
                    Đại Học
                </c:if>
                <c:if test="${customer.educationDegree == 3}">
                    Trung Cấp
                </c:if>
                <c:if test="${customer.educationDegree == 4}">
                    Sau Đại Học
                </c:if>
            </td>

            <td>
                <c:if test="${customer.division == 1}">
                    Sale - Marketing
                </c:if>
                <c:if test="${customer.division == 2}">
                    Hành Chính
                </c:if>
                <c:if test="${customer.division == 3}">
                    Phục Vụ
                </c:if>
                <c:if test="${customer.division == 4}">
                    Quản Lý
                </c:if>
            </td>
            <td><c:out value="${customer.userName}"/></td>


            <td><a href="/employee_servlet?choose=edit&employeeCode=${customer.employeeCode}">edit</a></td>
            <td><a href="/employee_servlet?choose=delete&employeeCode=${customer.employeeCode}"
                   onclick="return confirm('Are you sure you want to delete this item?')" >delete</a></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>


