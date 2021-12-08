
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
    <input type="hidden" name="choose" value="edit">
    <fieldset>
        <legend>customer information</legend>
        <table>
            <tr>
                <td>contract Code: </td>
                <td><input type="hidden" name="contractCode"
                           value="<c:out value='${contract.contractCode}' />">
                </td>
            </tr>
            <tr>
                <td>contract Start Date: </td>
                <td><input type="date" name="contractStartDate"
                           value="<c:out value='${contract.contractStartDate}' />">
                ></td>
            </tr>
            <tr>
                <td>contract End Date: </td>
                <td><input type="date" name="contractEndDate"
                           value="<c:out value='${contract.contractEndDate}' />">
                ></td>
            </tr>

            <tr>
                <td>contract Deposit: </td>
                <td><input type="text" name="contractDeposit"
                           value="<c:out value='${contract.contractDeposit}' />">
                ></td>
            </tr>
            <tr>
                <td>contract Total Money: </td>
                <td><input type="text" name="contractTotalMoney"
                           value="<c:out value='${contract.contractTotalMoney}' />">
                ></td>
            </tr>
            <tr>
                <td>employee Code:
                    <c:out value='${contract.employeeCode}' />
                </td>
                <td>
                    <select name="employeeCode">
                        <c:forEach var="employee" items="${employeeList}">
                            <option value="<c:out value="${employee.employeeCode}"/>"><c:out value="${employee.employeeCode}"/></option>
                        </c:forEach>
                    </select>
                    <%--            <td><input type="text" name="employeeCode"></td>--%>
                </td>
<%--                <td><input type="text" name="employeeCode"--%>
<%--                           value="<c:out value='${contract.employeeCode}' />">--%>
<%--                ></td>--%>
            </tr>
            <tr>
                <td> customer Code:
                    <c:out value='${contract.customerCode}' />
                </td>
                <td>
                    <select name="customerCode">
                        <c:forEach var="contract_detail" items="${customerList}">
                            <option value="<c:out value="${contract_detail.customerCode}"/>"><c:out value="${contract_detail.customerCode}"/></option>
                        </c:forEach>
                    </select>
                </td>
<%--                <td><input type="text" name="customerCode"--%>
<%--                           value="<c:out value='${contract.customerCode}' />">--%>
<%--                ></td>--%>
            </tr>
            <tr>
                <td>service Code:
                    <c:out value='${contract.serviceCode}' />
                </td>
                <td>
                    <select name="serviceCode">
                        <c:forEach var="contract" items="${serviceResortList}">
                            <option value="<c:out value="${contract.codeService}"/>"><c:out value="${contract.codeService}"/></option>
                        </c:forEach>
                    </select>
                </td>
<%--                <td><input type="text" name="serviceCode"--%>
<%--                           value="<c:out value='${contract.serviceCode}' />">--%>
<%--                ></td>--%>
            </tr>
            <tr>
                <td><input type="submit" value="Update Contract"></td>
            </tr>
        </table>
    </fieldset>
</form>

</body>
</html>

