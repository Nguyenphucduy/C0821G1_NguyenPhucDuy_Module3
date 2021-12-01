<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search User</title>
</head>
<body>
<h1>User details</h1>
<p>
    <a href="/users">Back to Product list</a>
</p>
<table>

    <tr>
        <td>Name: </td>
        <%--        <td><c:out value="${product.name}"/></td>--%>
        <td>${requestScope["user"].getName()}</td>
    </tr>
    <tr>
        <td>Email: </td>
        <%--        <td><c:out value="${product.price}"/></td>--%>
        <td>${requestScope["user"].getEmail()}</td>
    </tr>
    <tr>
        <td>Country: </td>
<%--                <td><c:out value="${user.description}"/></td>--%>
        <td>${requestScope["user"].getCountry()}</td>
    </tr>
</table>
</body>
</html>
