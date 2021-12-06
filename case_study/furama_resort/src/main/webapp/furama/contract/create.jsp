
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new contract</title>
    <style>
        .message{
            color:green;
        }
    </style>
</head>
<body>
<h1>Create new contract</h1>

<form action="/contract_servlet" method="post">
    <input type="hidden" name="choose" value="create">
    <fieldset>
        <legend>customer information</legend>
        <table>
            <tr>
                <td>contract Code: </td>
                <td><input type="text" name="contractCode" ></td>
            </tr>
            <tr>
                <td>contract Start Date: </td>
                <td><input type="date" name="contractStartDate" ></td>
            </tr>
            <tr>
                <td>contract End Date: </td>
                <td><input type="date" name="contractEndDate" ></td>
            </tr>

            <tr>
                <td>contract Deposit: </td>
                <td><input type="text" name="contractDeposit" ></td>
            </tr>
            <tr>
                <td>contract Total Money: </td>
                <td><input type="text" name="contractTotalMoney" ></td>
            </tr>
            <tr>
                <td>employee Code: </td>
                <td><input type="text" name="employeeCode" ></td>
            </tr>
            <tr>
                <td> customer Code: </td>
                <td><input type="text" name="customerCode" ></td>
            </tr>
            <tr>
                <td>service Code: </td>
                <td><input type="text" name="serviceCode" ></td>
            </tr>
            <tr>
                <td><input type="submit" value="Create contract"></td>
            </tr>
        </table>
    </fieldset>
</form>

</body>
</html>
