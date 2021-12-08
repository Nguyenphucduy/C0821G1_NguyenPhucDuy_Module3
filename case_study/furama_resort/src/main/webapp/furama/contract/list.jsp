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
    <h3 style="color: green"><c:out value="${messenger}"/></h3>
    <h3 style="color: blue">
        Welcome, <%=request.getSession().getAttribute("usernameSession")%>
    </h3>

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
    <c:forEach var="totalMoney" items="${contractList}">
        <tr>
            <td><c:out value="${totalMoney.contractCode}"/></td>
            <td><c:out value="${totalMoney.contractStartDate}"/></td>
            <td><c:out value="${totalMoney.contractEndDate}"/></td>
            <td><c:out value="${totalMoney.contractDeposit}"/></td>
            <td><c:out value="${totalMoney.contractTotalMoney}"/></td>
            <td><c:out value="${totalMoney.employeeCode}"/></td>
            <td><c:out value="${totalMoney.customerCode}"/></td>
            <td><c:out value="${totalMoney.serviceCode}"/></td>


            <td><a href="/contract_servlet?choose=edit&contractCode=${totalMoney.contractCode}">edit</a></td>
            <td><a href="/contract_servlet?choose=delete&contractCode=${totalMoney.contractCode}"
                   onclick="return confirm('Are you sure you want to delete this item?')" >delete</a></td>
        </tr>
    </c:forEach>
</table>
<div>
    <a href="/contract_detail_servlet?choose=create">
        <button>Create Contract Detail</button>
    </a>
</div>
</body>
</html>

