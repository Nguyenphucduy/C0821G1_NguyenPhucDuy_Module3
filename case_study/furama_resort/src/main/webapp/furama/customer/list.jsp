<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Customer</title>
    <link rel="stylesheet" href="style_list.css">
</head>
<body>
<div>

    <h2 class="title">List Customer</h2>
</div>
<div class="msg">

    <h3 style="color: red"><c:out value="${messenger}"/></h3>
    <h3>
        Welcome, <%=request.getSession().getAttribute("usernameSession")%>
    </h3>

</div>


<div class="menu">
    <a href="/customer_servlet?choose=create">
        <button>Create customer</button>
    </a>
    <form method="post" action="/customer_servlet">
        <input type="hidden" name="choose" value="search">
        <label>
            <input type="text" name="nameCustomer">
        </label>
        <button>Search</button>
    </form>
</div>
<div>
    <table class="table" border="1">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Date Of Birth</th>
            <th>Gender</th>
            <th>Id Card</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Address</th>
            <th>Type Customer</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach var="customer" items="${customerList}">
            <tr>
                <td><c:out value="${customer.customerCode}"/></td>
                <td><c:out value="${customer.fullName}"/></td>
                <td><c:out value="${customer.dateOfBirth}"/></td>
                <td><c:out value="${customer.gender}"/></td>
                <td><c:out value="${customer.identityCardNumber}"/></td>
                <td><c:out value="${customer.phoneNumber}"/></td>
                <td><c:out value="${customer.email}"/></td>
                <td><c:out value="${customer.address}"/></td>
                <td>
                    <c:if test="${customer.customerType == 1}">
                        Diamond
                    </c:if>
                    <c:if test="${customer.customerType == 2}">
                        Platinium
                    </c:if>
                    <c:if test="${customer.customerType == 3}">
                        Gold
                    </c:if>
                    <c:if test="${customer.customerType == 4}">
                        Silver
                    </c:if>
                    <c:if test="${customer.customerType == 5}">
                        Member
                    </c:if>
                </td>

                <td><a href="/customer_servlet?choose=edit&customerCode=${customer.customerCode}">edit</a></td>
                <td><a href="/customer_servlet?choose=delete&customerCode=${customer.customerCode}"
                       onclick="return confirm('Are you sure you want to delete this item?')">delete</a></td>

            </tr>
        </c:forEach>
    </table>

</div>

</body>
</html>

