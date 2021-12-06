<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Service Management Application</title>
</head>
<body>
<center>
    <h1>Service Management</h1>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Service
                </h2>
            </caption>
            <%--            <c:if test="${customer != null}">--%>
            <%--                <input type="hidden" name="customerCode" value="<c:out value='${customer.customerCode}' />"/>--%>
            <%--            </c:if>--%>
            <tr>
                <input type="hidden" name="edit" />"
            </tr>

            <tr>
                <th>Code Service:</th>
                <td>
                    <input type="hidden" name="codeService"
                           value="<c:out value='${service.codeService}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Name Service:</th>
                <td>
                    <input type="text" name="nameService"
                           value="<c:out value='${service.nameService}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Usable Area:</th>
                <td>
                    <input type="text" name="usableArea"
                           value="<c:out value='${service.usableArea}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Rent Cost:</th>
                <td>
                    <input type="text" name="rentCost"
                           value="<c:out value='${service.rentCost}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Number Of People:</th>
                <td>
                    <input type="text" name="numberOfPeople"
                           value="<c:out value='${service.numberOfPeople}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Service Type Id:</th>
                <td>
                    <input type="text" name="serviceTypeId"
                           value="<c:out value='${service.serviceTypeId}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Rental Type:</th>
                <td>
                    <input type="text" name="rentalType"
                           value="<c:out value='${service.rentalType}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Standard Room:</th>
                <td>
                    <input type="text" name="standardRoom"
                           value="<c:out value='${service.standardRoom}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Description Other Convenience:</th>
                <td>
                    <input type="text" name="descriptionOtherConvenience"
                           value="<c:out value='${service.descriptionOtherConvenience}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Pool Area:</th>
                <td>
                    <input type="text" name="poolArea"
                           value="<c:out value='${service.poolArea}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Number Of Floors:</th>
                <td>
                    <input type="text" name="numberOfFloors"
                           value="<c:out value='${service.numberOfFloors}' />"
                    />
                </td>
            </tr>


            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Update"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>

