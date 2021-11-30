<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete new product</title>
</head>
<body>
<h1>Delete new product</h1>

<form method="post">
    <input type="text" name="idProduct" >
    <input type="submit" value="Delete">
</form>
<p>
    <a href="/productController">Back to product list</a>
</p>
</body>
</html>
