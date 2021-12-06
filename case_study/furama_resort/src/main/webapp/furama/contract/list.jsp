<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Contract</title>
</head>
<body>
<div>
    <h2>List Contract</h2>
</div>
<div>
    <p style="color: red"><c:out value="${msg}"/></p>

</div>

<div>
    <a href="/contract_servlet?choose=create">
        <button>Create Contract</button>
    </a>

<%--    <form method="post" action="/contract_servlet">--%>
<%--        <input type="hidden" name="choose" value="search">--%>
<%--        <input type="text" name="codeContract">--%>
<%--        <button>Search</button>--%>
<%--    </form>--%>
</div>

<table border="1">
    <tr>
        <td>Id Contract</td>
        <td>Start Date</td>
        <td>End Date</td>
        <td>Deposit</td>
        <td>Total Money</td>
        <td>Employee Code</td>
        <td>Customer Code</td>
        <td>Service Code</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach var="contractDetail" items="${contractList}">
        <tr>
            <td><c:out value="${contractDetail.contractCode}"/></td>
            <td><c:out value="${contractDetail.contractStartDate}"/></td>
            <td><c:out value="${contractDetail.contractEndDate}"/></td>
            <td><c:out value="${contractDetail.contractDeposit}"/></td>
            <td><c:out value="${contractDetail.contractTotalMoney}"/></td>
            <td><c:out value="${contractDetail.employeeCode}"/></td>
            <td><c:out value="${contractDetail.customerCode}"/></td>
            <td><c:out value="${contractDetail.serviceCode}"/></td>


            <td><a href="/contract_servlet?choose=edit&contractCode=${contractDetail.contractCode}">edit</a></td>
            <td><a href="/contract_servlet?choose=delete&contractCode=${contractDetail.contractCode}">delete</a></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>

