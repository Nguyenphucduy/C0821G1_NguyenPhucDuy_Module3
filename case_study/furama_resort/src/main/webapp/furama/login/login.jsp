<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/login_servlet" method="post">
    <div>
        <label for="">Username</label>
        <input type="text" name="username" value="${usernameC}"/>
    </div>
    <div>
        <label for="">Password</label>
        <input type="password" name="password" value="${passwordC}" />
    </div>

    <input type="submit" value="Login" />
</form>
</body>
</html>
