<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <title>Create new customer</title>
    <meta charset="UTF-8">
    <style>
        .message{
            color:green;
        }
    </style>
</head>
<body>
<h1>Create new customer</h1>

<form action="/customer_servlet" method="post">
    <input type="hidden" name="choose" value="create">
    <fieldset>
        <legend>customer information</legend>
        <table>
            <tr>
                <td>Customer Code: </td>
                <td><input type="text" name="codeCustomer" ></td>
            </tr>
            <tr>
                <td>Customer Name: </td>
                <td><input type="text" name="nameCustomer" ></td>
            </tr>
            <tr>
                <td>Customer Date of Birth: </td>
                <td><input type="date" name="dateOfBirthCustomer" ></td>
            </tr>
            <tr>
                <td>
                    Customer Gender:
                </td>
                <td>
             <select name="genderCustomer" >
                <option value="Male">Male</option>
                <option value="Female">Female</option>
            </select>
                </td>
            </tr>
            <tr>
                <td>Customer Id Card: </td>
                <td><input type="text" name="idCardCustomer" ></td>
            </tr>
            <tr>
                <td>Customer Phone: </td>
                <td><input type="text" name="phoneCustomer" ></td>
            </tr>
            <tr>
                <td>Customer Email: </td>
                <td><input type="text" name="emailCustomer" ></td>
            </tr>
            <tr>
                <td> Customer Address: </td>
                <td><input type="text" name="addressCustomer" ></td>
            </tr>
            <tr>
                <td>Customer type id: </td>
                <td>
                <select name="typeIdCustomer" >
                    <option value="1">Diamond</option>
                    <option value="2">Platinium</option>
                    <option value="3">Gold</option>
                    <option value="4">Silver</option>
                    <option value="5">Member</option>
                </select>
                </td>
            </tr>
            <tr>
                <td><input type="submit" value="Create Customer"></td>
            </tr>
        </table>
    </fieldset>
</form>

</body>
</html>
