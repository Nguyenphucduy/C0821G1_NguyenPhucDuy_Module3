<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer Management Application</title>
</head>
<body>
<center>
    <h1>Customer Management</h1>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Edit Customer
                </h2>
            </caption>
<%--            <c:if test="${customer != null}">--%>
<%--                <input type="hidden" name="customerCode" value="<c:out value='${customer.customerCode}' />"/>--%>
<%--            </c:if>--%>
            <tr>
                <input type="hidden" name="edit" />"
            </tr>
            <tr>
                <input type="hidden" name="customerCode" value="<c:out value='${customer.customerCode}' />"/>
            </tr>
            <tr>
                <th>Customer Name:</th>
                <td>
                    <input type="text" name="nameCustomer"
                           value="<c:out value='${customer.fullName}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Customer date of birth:</th>
                <td>
                    <input type="text" name="dateOfBirthCustomer"
                           value="<c:out value='${customer.dateOfBirth}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Customer gender:</th>
                <td>
                    <input type="text" name="genderCustomer"
                           value="<c:out value='${customer.gender}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Customer id card:</th>
                <td>
                    <input type="text" name="idCardCustomer"
                           value="<c:out value='${customer.identityCardNumber}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Customer phone:</th>
                <td>
                    <input type="text" name="phoneCustomer"
                           value="<c:out value='${customer.phoneNumber}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Customer email:</th>
                <td>
                    <input type="text" name="emailCustomer"
                           value="<c:out value='${customer.email}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Customer address:</th>
                <td>
                    <input type="text" name="addressCustomer"
                           value="<c:out value='${customer.address}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Customer type id:</th>
                <td>
                    <input type="text" name="typeIdCustomer"
                           value="<c:out value='${customer.customerType}' />"
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
