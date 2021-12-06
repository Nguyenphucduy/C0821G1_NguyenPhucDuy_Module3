<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Customer</title>
</head>
<body>
<div>
    <h2>List Customer</h2>
</div>
<div>
    <p style="color: red"><c:out value="${msg}"/></p>

</div>

<div>
    <a href="/customer_servlet?choose=create">
        <button>Create customer</button>
    </a>

    <form method="post" action="/customer_servlet">
        <input type="hidden" name="choose" value="search">
        <input type="text" name="nameCustomer">
        <button>Search</button>
    </form>
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
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach var="contractDetail" items="${customerList}">
        <tr>
            <td><c:out value="${contractDetail.customerCode}"/></td>
            <td><c:out value="${contractDetail.fullName}"/></td>
            <td><c:out value="${contractDetail.dateOfBirth}"/></td>
            <td>
                    <%--                <c:if test="${customer.gender == 1}">--%>
                    <%--                    Male--%>
                    <%--                </c:if>--%>
                    <%--                <c:if test="${customer.gender == 0}">--%>
                    <%--                    Famale--%>
                    <%--                </c:if>--%>
                <c:out value="${contractDetail.gender}"/>
            </td>
            <td><c:out value="${contractDetail.identityCardNumber}"/></td>
            <td><c:out value="${contractDetail.phoneNumber}"/></td>
            <td><c:out value="${contractDetail.email}"/></td>
            <td><c:out value="${contractDetail.address}"/></td>
            <td><c:out value="${contractDetail.customerType}"/></td>


            <td><a href="/customer_servlet?choose=edit&customerCode=${contractDetail.customerCode}">edit</a></td>
            <td><a href="/customer_servlet?choose=delete&customerCode=${contractDetail.customerCode}">delete</a></td>
        </tr>
    </c:forEach>
</table>


</body>
</html>

