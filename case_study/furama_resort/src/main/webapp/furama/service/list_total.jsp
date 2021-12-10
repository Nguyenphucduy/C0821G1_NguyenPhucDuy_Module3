<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Total Money Using Service</title>
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
            <h2>List Total Money Using Service</h2>
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
          <a href="/home_servlet">Home</a>
        </div>
        <div class="col-lg-2 ">
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
            <table border="1">
                <tr>
                    <td>Total Money</td>
                    <td>Name Service</td>
                </tr>
                <c:forEach var="total" items="${totalMoneyServices}">
                <tr>
                    <td><c:out value="${total.nameService}"/></td>
                    <td><c:out value="${total.totalMoneyService}"/></td>
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




