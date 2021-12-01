<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 11/30/2021
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Danh sách học sinh</h2>
<c:out value="${msg}"></c:out>
<br>
<%--Chức năng tìm kiếm--%>
<form method="get" action="/students">
    <input type="hidden" name="action" value="search">
    <input type="text" name="nameStudent">
    <button>Tìm kiếm</button>
</form>
<%--CHức năng create--%>
<a href="/students?action=create"><button>Thêm mới học sinh</button></a>
<table>
    <tr>
        <th>Mã học sinh</th>
        <th>Tên học sinh</th>
        <th>Ngày sinh</th>
        <th>Giới tính</th>
        <th>Điểm số</th>
    </tr>
    <c:forEach var="student" items="${students}">
        <tr>
            <td><c:out value="${student.id}"></c:out></td>
            <td><c:out value="${student.name}"></c:out></td>
            <td><c:out value="${student.dateOfBirth}"></c:out></td>
            <td>
                <c:if test="${student.gender == 1}">
                    Nam
                </c:if>
                <c:if test="${student.gender == 0}">
                    Nữ
                </c:if>
            </td>
            <td><c:out value="${student.grade}"></c:out></td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
