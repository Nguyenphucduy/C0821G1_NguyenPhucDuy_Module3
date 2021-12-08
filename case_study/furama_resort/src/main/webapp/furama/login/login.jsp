<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3 style="color: red"><c:out value="${messenger}"/></h3>
<form action="/login_servlet" method="post">
    <div>
        <label for="">Username : </label>
        <input type="text" name="username" value="${usernameC}"/>
    </div>
    <div>
        <label for="">Password : </label>
        <input type="password" name="password" value="${passwordC}" />
    </div>

    <input type="submit" value="Login" />
</form>
<form action="/login_servlet">
    <div>
        <span>Remember Me : <input type="checkbox" name="save"/></span>
    </div>
</form>


</body>
</html>
