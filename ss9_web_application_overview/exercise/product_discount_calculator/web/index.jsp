<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sum 2 number</title>
</head>
<body>
<form action="/DiscountServlet" method="post">
    <div>
        Product Description :
    </div>
    <div>
        <input type="text" name="Description">
    </div>
    <div>
        List Price :
    </div>
    <div>
        <input type="text" name="Price">
    </div>
    <div>
        Discount Percent:
    </div>
    <div>
        <input type="text" name="Percent">
    </div>
    <div>
        <input type="submit" value="Calculate Discount">
    </div>
</form>

</body>
</html>
