<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 11/30/2021
  Time: 7:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Product</title>
</head>
<body>
<div>
    <h2>List Product</h2>
</div>
<div >
    <p style="color: red"><c:out value="${msg}"/></p>

</div>

<table border="1">
    <tr>
        <td>Id</td>
        <td>Name</td>
        <td>Price</td>
        <td>Description</td>
        <td>Producer</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach var="product" items="${productList}">
        <tr>
            <td><c:out value="${product.id}"/></td>
            <td><a href="/productController?choose=view&id=${product.id}">${product.name}</a></td>
            <td><c:out value="${product.price}"/></td>
            <td><c:out value="${product.description}"/></td>
            <td><c:out value="${product.producer}"/></td>
            <td><a href="/productController?choose=edit&id=${product.id}">edit</a></td>
            <td><a href="/productController?choose=delete&id=${product.id}">delete</a></td>
        </tr>
    </c:forEach>
</table>
<div>
    <a href="/productController?choose=create"><button>Create product</button></a>

    <form method="post" action="/productController">
        <input type="hidden" name="choose" value="search">
        <input type="text" name="nameProduct">
        <button>Search</button>
    </form>
</div>

</body>
</html>
