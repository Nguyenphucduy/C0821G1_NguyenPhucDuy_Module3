<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <div>
        <h1>User Management</h1>
    </div>
    <div>
        <strong>
            <a href="/users?choose=create" style="color: green">Add New User</a>
        </strong>
        <strong >
            <a href="/users?choose=sort" style="color: blue">Sort list user with name</a>
        </strong>
    </div>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/users?choose=edit&id=${user.id}">Edit</a>
                    <a href="/users?choose=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <form method="post" action="/users">
        <input type="hidden" name="choose" value="search">
        <input type="text" name="country">
        <button>Search</button>
    </form>
</div>
</body>
</html>
