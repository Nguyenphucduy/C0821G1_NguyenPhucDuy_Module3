<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 11/30/2021
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Thêm mới học sinh</h2>
<form method="post">
    Mã sinh viên: <input type="text" name="id"><br>
    Tên sinh viên: <input type="text" name="name"><br>
    Ngày sinh: <input type="date" name="dateOfBirth"><br>
    Giới tính: <select name="gender">
    <option value="1">Nam</option>
    <option value="0">Nữ</option>
</select> <br>
    Điểm: <input type="number" name="grade"><br>
    <button type="submit">Thêm mới</button>


</form>
</body>
</html>
