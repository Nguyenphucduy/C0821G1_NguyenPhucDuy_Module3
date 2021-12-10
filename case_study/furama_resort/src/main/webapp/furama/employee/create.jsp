<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create new employee</title>
    <%--    <link rel="stylesheet" href="style_list.css">--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <style>
        * {
            box-sizing: border-box;
        }

        table, th, td{
            text-align: center;
            border:1px solid #868585;
        }
        table{
            width: 100%;
            border-collapse:collapse;
        }
        table tr:nth-child(odd){
            background-color:#eee;
        }
        table tr:nth-child(even){
            background-color:white;
        }
        table tr:nth-child(1){
            background-color:skyblue;
        }



        body {
            font-family: Arial, serif;
            margin: 0;
            padding: 0;
        }

        .body {
            margin-bottom: 10px;
        }

        .footer {
            padding: 10px;
            color: white;
            background-color: deepskyblue;
            height: 60px;
            margin-bottom: 10px;
        }

        a {
            color: black;
        }

        a:hover {
            color: red;
        }

        .center {
            text-align: center;
        }

        .left {
            text-align: left;
        }

        .right {
            text-align: right;
        }

        .menu, .header {
            padding: 10px;
            color: white;
            background-color: deepskyblue;
            margin-bottom: 10px;
        }

        .summit {
            background-color: #20c997;
            color: white;
        }


    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row header">
        <div class="col-lg-4 left">
            <h1>Create new employee</h1>
        </div>
        <div class="col-lg-4 center">
            <h3 style="color: red"><c:out value="${messenger}"/></h3>
        </div>
        <div class="col-lg-4 right">
            <h4>
                Welcome, <%=request.getSession().getAttribute("usernameSession")%>
            </h4>
        </div>

    </div>
</div>

<div class="container-fluid body">
    <div class="row">
        <div class="col-12">
            <form action="/employee_servlet" method="post">
                <input type="hidden" name="choose" value="create">
                <fieldset>
                    <legend>employee information</legend>
                    <table>
                        <tr>
                            <td>Employee Code: </td>
                            <td><input type="text" name="employeeCode" ></td>
                        </tr>
                        <tr>
                            <td>Employee Name: </td>
                            <td><input type="text" name="fullName" ></td>
                        </tr>
                        <tr>
                            <td>Employee Date Of Birth: </td>
                            <td><input type="date" name="dateOfBirth" ></td>
                        </tr>
                        <tr>
                            <td>Employee Identity Card Number: </td>
                            <td><input type="text" name="identityCardNumber" ></td>
                        </tr>
                        <tr>
                            <td>Employee PhoneNumber: </td>
                            <td><input type="text" name="phoneNumber" ></td>
                        </tr>
                        <tr>
                            <td>Employee Email: </td>
                            <td><input type="text" name="email" ></td>
                        </tr>
                        <tr>
                            <td>Employee Salary: </td>
                            <td><input type="text" name="salary" ></td>
                        </tr>
                        <tr>
                            <td>Employee Address: </td>
                            <td><input type="text" name="address" ></td>
                        </tr>
                        <tr>
                            <td>Employee Position: </td>
                            <td>
                                <select name="position" >
                                    <option value="1">Lễ Tân</option>
                                    <option value="2">Phục Vụ</option>
                                    <option value="3">Chuyên Viên</option>
                                    <option value="4">Giám Sát</option>
                                    <option value="5">Quản Lý</option>
                                    <option value="6">Giám Đốc</option>
                                </select>
                            </td>
                            <%--                <td><input type="text" name="position" ></td>--%>
                        </tr>
                        <tr>
                            <td>Employee Education Degree: </td>
                            <td>
                                <select name="educationDegree" >
                                    <option value="1">Cao Đẳng</option>
                                    <option value="2">Đại Học</option>
                                    <option value="3">Trung Cấp</option>
                                    <option value="4">Sau Đại Học</option>
                                </select>
                            </td>
                            <%--                <td><input type="text" name="educationDegree" ></td>--%>
                        </tr>
                        <tr>
                            <td>Employee Division: </td>
                            <td>
                                <select name="division" >
                                    <option value="1">Sale - Marketing</option>
                                    <option value="2">Hành Chính</option>
                                    <option value="3">Phục Vụ</option>
                                    <option value="4">Quản Lý</option>
                                </select>
                            </td>
                            <%--                <td><input type="text" name="division" ></td>--%>
                        </tr>
                        <tr>
                            <td>Employee User Name: </td>
                            <td>
                                <select name="userName">
                                    <c:forEach var="user" items="${userEmployeeList}">
                                        <option value="<c:out value="${user.userName}"/>"><c:out value="${user.userName}"/></option>
                                    </c:forEach>
                                </select>
                            </td>
                            <%--                <td><input type="text" name="userName" ></td>--%>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Create Employee" class="summit"></td>
                        </tr>

                    </table>
                </fieldset>
            </form>

        </div>

    </div>
</div>

<div class="container-fluid">
    <div class="row footer">
        <div class="col-12">
            <p>&copy; Bản quyền thuộc Mr.Duy C0821G1</p>
        </div>
    </div>
</div>

</body>
</html>







