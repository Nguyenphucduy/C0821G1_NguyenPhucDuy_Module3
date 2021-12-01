<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Product List</h2>
<%--<c:out value="${msg}"/>--%>
<%--Chức năng tìm kiếm--%>
<%--<form method="get" action="/students">--%>
<%--    <input type="hidden" name="action" value="search">--%>
<%--    <input type="text" name="nameStudent">--%>
<%--    <button>Tìm kiếm</button>--%>
<%--</form>--%>
<%--CHức năng create--%>
<%--<p>--%>
<%--    <a href="/product_servlet?choose=create">Create new product</a>--%>
<%--</p>--%>
<table border="1">
    <tr>
        <td>Name</td>
        <td>Price</td>
        <td>Description</td>
        <td>Producer</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach var="product" items="${productList}">
        <tr>
                <%--            <td><a href="/product_servlet?choose=view&id=${product.getId()}">${product.getName()}</a></td>--%>
            <td><c:out value="${product.id()}"/></td>
            <td><c:out value="${product.name()}"/></td>
            <td><c:out value="${product.price()}"/></td>
            <td><c:out value="${product.description()}"/></td>
            <td><c:out value="${product.producer()}"/></td>
                <%--            <td><a href="/product_servlet?choose=edit&id=${product.getId()}">edit</a></td>--%>
                <%--            <td><a href="/product_servlet?choose=delete&id=${product.getId()}">delete</a></td>--%>
        </tr>
    </c:forEach>

</table>
</body>
</html>

