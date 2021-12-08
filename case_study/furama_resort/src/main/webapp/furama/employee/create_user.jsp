<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new User employee</title>
    <style>
        .message{
            color:green;
        }
    </style>
</head>
<body>
<h1>Create new User employee</h1>

<form action="/employee_servlet" method="post">
    <input type="hidden" name="choose" value="createUser">
    <fieldset>
        <legend>User employee information</legend>
        <table>
            <tr>
                <td>User Employee Name: </td>
                <td><input type="text" name="userName" ></td>
            </tr>
            <tr>
                <td>User Employee Password: </td>
                <td><input type="text" name="userPassword" ></td>
            </tr>

            <tr>
                <td><input type="submit" value="Create User Employee" ></td>
            </tr>

        </table>
    </fieldset>
</form>

</body>
</html>


