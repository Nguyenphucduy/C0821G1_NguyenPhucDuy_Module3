<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new contract detail</title>
    <style>
        .message{
            color:green;
        }
    </style>
</head>
<body>
<h1>Create new contract detail</h1>

<form action="/contract_detail_servlet" method="post">
    <input type="hidden" name="choose" value="create">
    <fieldset>
        <legend>contract detail information</legend>
        <table>
<%--            <tr>--%>
<%--                <td>contract Detail Code: </td>--%>
<%--                <td><input type="hidden" name="contractDetailCode" value=""></td>--%>
<%--            </tr>--%>
            <tr>
                <td>contract Code: </td>
                <td><input type="text" name="contractCode" ></td>
            </tr>
            <tr>
                <td>attach Service Code: </td>
                <td><input type="text" name="attachServiceCode" ></td>
            </tr>
            <tr>
                <td><input type="submit" value="Create"></td>
            </tr>
        </table>
    </fieldset>
</form>

</body>
</html>
