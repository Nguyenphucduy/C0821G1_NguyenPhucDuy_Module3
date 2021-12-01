<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List student Homepage</title>
</head>
<body>

<h2>List student</h2>
<a href="/student_list?actionUser=create">Create new student</a>
<table border="1">
    <tr>
        <th>No</th>
        <th>Id</th>
        <th>Name</th>
        <th>Date of birth</th>
        <th>Gender</th>
        <th>Rank</th>
    </tr>
    <%--        for (Student studentObj : studentListServlet)--%>
    <c:forEach var="studentObj" items="${studentListServlet}" varStatus="loop">
        <tr>
            <td><c:out value="${loop.count}"/></td>
            <td><c:out value="${studentObj.id}"/></td>
            <td><c:out value="${studentObj.name}"/></td>
            <td><c:out value="${studentObj.dateOfBirth}"/></td>
            <td>
                <c:if test="${studentObj.gender == 0}">
                    Female
                </c:if>
                <c:if test="${studentObj.gender == 1}">
                    Male
                </c:if>
            </td>
            <td>
                <c:choose>
                    <c:when test="${studentObj.grade < 5}">
                        Poor
                    </c:when>
                    <c:when test="${studentObj.grade <= 7}">
                        Good
                    </c:when>
                    <c:otherwise>
                        Very Good
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
