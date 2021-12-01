<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create student</title>
</head>
<body>
    <h2>Create student</h2>
    <form action="/student_list" method="post">
        <input type="hidden" name="actionUser" value="create">
        <div>Name: </div>
        <div>
            <input type="text" name="studentName">
        </div>
        <div>
            <input type="submit" value="Create new">
        </div>
    </form>
</body>
</html>
