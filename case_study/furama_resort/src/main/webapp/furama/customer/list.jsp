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
    <h3 style="color: green"><c:out value="${messenger}"/></h3>
    <h3 style="color: blue">
        Welcome, <%=request.getSession().getAttribute("usernameSession")%>
    </h3>

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
    <c:forEach var="totalMoney" items="${customerList}">
        <tr>
            <td><c:out value="${totalMoney.customerCode}"/></td>
            <td><c:out value="${totalMoney.fullName}"/></td>
            <td><c:out value="${totalMoney.dateOfBirth}"/></td>
            <td><c:out value="${totalMoney.gender}"/></td>
            <td><c:out value="${totalMoney.identityCardNumber}"/></td>
            <td><c:out value="${totalMoney.phoneNumber}"/></td>
            <td><c:out value="${totalMoney.email}"/></td>
            <td><c:out value="${totalMoney.address}"/></td>
            <td><c:out value="${totalMoney.customerType}"/></td>



            <td><a href="/customer_servlet?choose=edit&customerCode=${totalMoney.customerCode}">edit</a></td>
            <td><a href="/customer_servlet?choose=delete&customerCode=${totalMoney.customerCode}"
            onclick="return confirm('Are you sure you want to delete this item?')" >delete</a></td>

        </tr>
    </c:forEach>
</table>


</body>
</html>

