<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new product</title>
    <style>
        .message{
            color:green;
        }
    </style>
</head>
<body>
<h1>Create new product</h1>

<form action="/productController" method="post">
    <input type="hidden" name="choose" value="create">
    <fieldset>
        <legend>product information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="nameProduct" ></td>
            </tr>
            <tr>
                <td>Price: </td>
                <td><input type="text" name="priceProduct" ></td>
            </tr>
            <tr>
                <td>Description: </td>
                <td><input type="text" name="descriptionProduct" ></td>
            </tr>
            <tr>
                <td>Producer: </td>
                <td><input type="text" name="producerProduct" ></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create product"></td>
            </tr>
        </table>
    </fieldset>
</form>
<p>
    <a href="/productController">Back to product list</a>
</p>
</body>
</html>

