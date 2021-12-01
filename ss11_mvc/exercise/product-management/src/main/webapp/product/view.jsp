<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View product</title>
</head>
<body>
<h1>product details</h1>
<p>
    <a href="/product_servlet">Back to product list</a>
</p>
<table>
    <tr>
        <td>Name: </td>
        <td>${"product".getName()}</td>
    </tr>
    <tr>
        <td>Price: </td>
        <td>${"product".getPrice()}</td>
    </tr>
    <tr>
        <td>Description: </td>
        <td>${"product".getDescription()}</td>
    </tr>
    <tr>
        <td>Producer: </td>
        <td>${"product".getProducer()}</td>
    </tr>
</table>
</body>
</html>