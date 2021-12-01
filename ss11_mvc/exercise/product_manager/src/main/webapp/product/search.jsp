<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Product</title>
</head>
<body>
<h1>Product details</h1>
<p>
    <a href="/productController">Back to Product list</a>
</p>
<table>

    <tr>
        <td>Name: </td>
<%--        <td><c:out value="${product.name}"/></td>--%>
        <td>${requestScope["product"].getName()}</td>
    </tr>
    <tr>
        <td>Price: </td>
<%--        <td><c:out value="${product.price}"/></td>--%>
        <td>${requestScope["product"].getPrice()}</td>
    </tr>
    <tr>
        <td>Description: </td>
<%--        <td><c:out value="${product.description}"/></td>--%>
        <td>${requestScope["product"].getDescription()}</td>
    </tr>
    <tr>
        <td>Producer: </td>
<%--        <td><c:out value="${product.producer}"/></td>--%>
        <td>${requestScope["product"].getProducer()}</td>
    </tr>
</table>
</body>
</html>
