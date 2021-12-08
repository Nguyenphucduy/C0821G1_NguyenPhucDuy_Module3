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
    <h3 style="color: blue">
        Welcome, <%=request.getSession().getAttribute("usernameSession")%>
    </h3>

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
    <c:forEach var="contract_detail" items="${contractDetailList}">
        <tr>
            <td><c:out value="${contract_detail.contractDetailCode}"/></td>
            <td><c:out value="${contract_detail.contractCode}"/></td>
            <td><c:out value="${contract_detail.attachServiceCode}"/></td>


            <td><a href="/contract_detail_servlet?choose=edit&contractDetailCode=${contract_detail.contractDetailCode}">edit</a></td>
            <td><a href="/contract_detail_servlet?choose=delete&contractDetailCode=${contract_detail.contractDetailCode}">delete</a></td>
        </tr>
    </c:forEach>
</table>


</body>
</html>


