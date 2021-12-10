<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Employee</title>
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
            <h2>List Employee</h2>
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


<div class="container-fluid">
    <div class="row menu">
        <div class="col-lg-2 page-item">
            <a href="/employee_servlet?choose=create">
                <button class="summit">Create Employee</button>
            </a>
        </div>
        <div class="col-lg-2 ">
            <form method="post" action="/employee_servlet">
                <input type="hidden" name="choose" value="search" >
                <input type="text" name="nameEmployee" style="width: 70px">
                <button class="summit">Search</button>
            </form>
        </div>
        <div class="col-lg-2 page-item">
        </div>
        <div class="col-lg-2 page-item">
        </div>
        <div class="col-lg-2 page-item">
        </div>
        <div class="col-lg-2 page-item">
        </div>
    </div>
</div>
<div class="container-fluid body">
    <div class="row">
        <div class="col-12">
            <table >
                <tr>
                    <td>Id</td>
                    <td>Name</td>
                    <td>Data of birth</td>
                    <td>Identity Card Number</td>
                    <td>Phone Number</td>
                    <td>Email</td>
                    <td>Salary</td>
                    <td>Address</td>
                    <td>Position</td>
                    <td>Education Degree</td>
                    <td>Division</td>
                    <td>User Name</td>
                    <td>Edit</td>
                    <td>Delete</td>
                </tr>
                <c:forEach var="employee" items="${employeeList}">
                    <tr>
                        <td><c:out value="${employee.employeeCode}"/></td>
                        <td><c:out value="${employee.fullName}"/></td>
                        <td><c:out value="${employee.dateOfBirth}"/></td>
                        <td><c:out value="${employee.identityCardNumber}"/></td>
                        <td><c:out value="${employee.phoneNumber}"/></td>
                        <td><c:out value="${employee.email}"/></td>
                        <td><c:out value="${employee.salary}"/></td>
                        <td><c:out value="${employee.address}"/></td>
                        <td>
                            <c:if test="${employee.position == 1}">
                                Lễ Tân
                            </c:if>
                            <c:if test="${employee.position == 2}">
                                Phục Vụ
                            </c:if>
                            <c:if test="${employee.position == 3}">
                                Chuyên Viên
                            </c:if>
                            <c:if test="${employee.position == 4}">
                                Giám Sát
                            </c:if>
                            <c:if test="${employee.position == 5}">
                                Quản Lý
                            </c:if>
                            <c:if test="${employee.position == 6}">
                                Giám Đốc
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${employee.educationDegree == 1}">
                                Cao Đẳng
                            </c:if>
                            <c:if test="${employee.educationDegree == 2}">
                                Đại Học
                            </c:if>
                            <c:if test="${employee.educationDegree == 3}">
                                Trung Cấp
                            </c:if>
                            <c:if test="${employee.educationDegree == 4}">
                                Sau Đại Học
                            </c:if>
                        </td>

                        <td>
                            <c:if test="${employee.division == 1}">
                                Sale - Marketing
                            </c:if>
                            <c:if test="${employee.division == 2}">
                                Hành Chính
                            </c:if>
                            <c:if test="${employee.division == 3}">
                                Phục Vụ
                            </c:if>
                            <c:if test="${employee.division == 4}">
                                Quản Lý
                            </c:if>
                        </td>
                        <td><c:out value="${employee.userName}"/></td>


                        <td><a href="/employee_servlet?choose=edit&employeeCode=${employee.employeeCode}">edit</a></td>
<%--                        <td><a href="/employee_servlet?choose=delete&employeeCode=${employee.employeeCode}"--%>
<%--                               onclick="return confirm('Are you sure you want to delete this item?')" >delete</a></td>--%>
                        <td>
                            <form action="/employee_servlet" method="post">
                                <input type="hidden" name="choose" value="delete">
                                <input type="hidden" name="employeeCode" value="${employee.employeeCode}">
                                <input type="submit" value="delete" onclick="return confirm('Are you sure you want to delete this item?')" class="summit">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
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






