<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new service</title>
    <style>
        .message{
            color:green;
        }
    </style>
</head>
<body>
<h1>Create new service</h1>

<form action="/service_servlet" method="post">
    <input type="hidden" name="choose" value="create">
    <fieldset>
        <legend>service information</legend>
        <table>
            <tr>
                <td>Service Code: </td>
                <td><input type="text" name="codeService" ></td>
            </tr>
            <tr>
                <td>Service Name: </td>
                <td><input type="text" name="nameService" ></td>
            </tr>
            <tr>
                <td>Service Usable Area: </td>
                <td><input type="text" name="usableArea" ></td>
            </tr>

            <tr>
                <td>Service Rent Cost: </td>
                <td><input type="text" name="rentCost" ></td>
            </tr>

            <tr>
                <td>Service Number Of People: </td>
                <td><input type="text" name="numberOfPeople" ></td>
            </tr>

            <tr>
                <td>Service Type Id: </td>
                <td><input type="text" name="serviceTypeId" ></td>
            </tr>

            <tr>
                <td>Service Rental Type: </td>
                <td><input type="text" name="rentalType" ></td>
            </tr>

            <tr>
                <td>Service Standard Room: </td>
                <td><input type="text" name="standardRoom" ></td>
            </tr>

            <tr>
                <td>Service Description Other Convenience: </td>
                <td><input type="text" name="descriptionOtherConvenience" ></td>
            </tr>
            <tr>
                <td>Service Pool Area: </td>
                <td><input type="text" name="poolArea" ></td>
            </tr>

            <tr>
                <td>Service Number Of Floors: </td>
                <td><input type="text" name="numberOfFloors" ></td>
            </tr>

            <tr>
                <td><input type="submit" value="Create Service"></td>
            </tr>
        </table>
    </fieldset>
</form>

</body>
</html>
