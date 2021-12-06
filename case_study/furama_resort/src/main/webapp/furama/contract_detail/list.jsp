<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Contract Detail</title>
</head>
<body>
<div>
    <h2>List Contract Detail</h2>
</div>
<div>
    <p style="color: red"><c:out value="${msg}"/></p>

</div>

<div>
    <a href="/contract_detail_servlet?choose=create">
        <button>Create Contract Detail</button>
    </a>

<%--    <form method="post" action="/contract_detail_servlet">--%>
<%--        <input type="hidden" name="choose" value="search">--%>
<%--        <input type="text" name="nameCustomer">--%>
<%--        <button>Search</button>--%>
<%--    </form>--%>
</div>

<table border="1">
    <tr>
        <td>Contract DetailCode</td>
        <td>Contract Code</td>
        <td>Attach Service Code</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach var="contractDetail" items="${contractDetailList}">
        <tr>
            <td><c:out value="${contractDetail.contractDetailCode}"/></td>
            <td><c:out value="${contractDetail.contractCode}"/></td>
            <td><c:out value="${contractDetail.attachServiceCode}"/></td>


            <td><a href="/contract_detail_servlet?choose=edit&contractDetailCode=${contractDetail.contractDetailCode}">edit</a></td>
            <td><a href="/contract_detail_servlet?choose=delete&contractDetailCode=${contractDetail.contractDetailCode}">delete</a></td>
        </tr>
    </c:forEach>
</table>


</body>
</html>


