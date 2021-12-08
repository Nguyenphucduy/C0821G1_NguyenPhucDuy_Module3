<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Total Money Using Service</title>
</head>
<body>
<div>
    <p style="color: red"><c:out value="${msg}"/></p>

</div>
<div>
    <a href="/service_servlet">Return List Service</a>

</div>





</table>
<div>
    <h2>List Total Money Using Service</h2>
</div>
<table border="1">
    <tr>
        <td>Total Money</td>
        <td>Name Service</td>
    </tr>
    <c:forEach var="totalMoney" items="${totalMoneyServices}">
        <tr>
            <td><c:out value="${totalMoney.nameService}"/></td>
            <td><c:out value="${totalMoney.totalMoneyService}"/></td>
    </c:forEach>


</table>


</body>
</html>

