<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update new employee</title>
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
            <h2>Update new employee</h2>
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
            <form method="post" action="/employee_servlet">
                <table border="1" cellpadding="5">

                    <tr>
                        <input type="hidden" name="edit" />
                    </tr>

                    <tr>
                        <th>Code Employee:</th>
                        <td>
                            <input type="hidden" name="employeeCode"
                                   value="<c:out value='${employee.employeeCode}' />"
                            />
                        </td>
                    <tr>
                        <td>Full Name: </td>
                        <td><input type="text" name="fullName"
                                   value="<c:out value='${employee.fullName}' />"
                        ></td>
                    </tr>
                    <tr>
                        <td>Date Of Birth: </td>
                        <td><input type="date" name="dateOfBirth"
                                   value="<c:out value='${employee.dateOfBirth}' />"
                        ></td>
                    </tr>

                    <tr>
                        <td>Identity Card Number: </td>
                        <td><input type="text" name="identityCardNumber"
                                   value="<c:out value='${employee.identityCardNumber}' />"
                        ></td>
                    </tr>

                    <tr>
                        <td>Phone Number: </td>
                        <td><input type="text" name="phoneNumber"
                                   value="<c:out value='${employee.phoneNumber}' />"
                        ></td>
                    </tr>

                    <tr>
                        <td>Email: </td>
                        <td><input type="text" name="email"
                                   value="<c:out value='${employee.email}' />"
                        ></td>
                    </tr>

                    <tr>
                        <td>Salary: </td>
                        <td><input type="text" name="salary"
                                   value="<c:out value='${employee.salary}' />"
                        ></td>
                    </tr>

                    <tr>
                        <td>Address: </td>
                        <td><input type="text" name="address"
                                   value="<c:out value='${employee.address}' />"
                        ></td>
                    </tr>

                    <tr>
                        <td>Position:
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
                        <%--                <td><input type="text" name="position"--%>
                        <%--                           value="<c:out value='${employee.position}' />"--%>
                        <%--                ></td>--%>
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
                    </tr>
                    <tr>
                        <td>EducationDegree:
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
                            <select name="educationDegree" >
                                <option value="1">Cao Đẳng</option>
                                <option value="2">Đại Học</option>
                                <option value="3">Trung Cấp</option>
                                <option value="4">Sau Đại Học</option>
                            </select>
                        </td>
                        <%--                <td><input type="text" name="educationDegree"--%>
                        <%--                           value="<c:out value='${employee.educationDegree}' />"--%>
                        <%--                ></td>--%>
                    </tr>

                    <tr>
                        <td>Division:
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
                        <td>
                            <select name="division" >
                                <option value="1">Sale - Marketing</option>
                                <option value="2">Hành Chính</option>
                                <option value="3">Phục Vụ</option>
                                <option value="4">Quản Lý</option>
                            </select>
                        </td>
                        <%--                <td><input type="text" name="division"--%>
                        <%--                           value="<c:out value='${employee.division}' />"--%>
                        <%--                ></td>--%>
                    </tr>
                    <tr>
                        <td>UserName: </td>
                        <td><input type="text" name="userName"
                                   value="<c:out value='${employee.userName}' />"
                        ></td>
                    </tr>

                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="Update"/>
                        </td>
                    </tr>
                </table>
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




