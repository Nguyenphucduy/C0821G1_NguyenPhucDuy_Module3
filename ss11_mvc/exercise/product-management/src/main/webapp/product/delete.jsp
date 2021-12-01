<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deleting product</title>
</head>
<body>
<h1>Delete product</h1>
<p>
    <a href="/product_servlet">Back to product list</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Customer information</legend>
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
            <tr>
                <td><input type="submit" value="Delete product"></td>
                <td><a href="/product_servlet">Back to product list</a></td>
            </tr>
        </table>
    </fieldset>
</body>
</html>
