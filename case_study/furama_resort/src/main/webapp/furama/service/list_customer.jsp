<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Customer Using Service</title>
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
            margin: 5px 5px;
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
            <h2>List Customer Using Service</h2>
        </div>
        <div class="col-lg-4 center">
            <h3 style="color: red"><c:out value="${msg}"/></h3>
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
        <div class="col-6">
            <h2>List Customer Using Service</h2>
            <table >
                <tr>
                    <td>Id</td>
                    <td>Name</td>
                    <td>Date Of Birth</td>
                    <td>Gender</td>
                    <td>Id Card</td>
                    <td>Phone</td>
                    <td>Email</td>
                    <td>Address</td>
                    <td>Type Id</td>
                </tr>
                <c:forEach var="customer" items="${customerListUsingService}">
                    <tr>
                        <td><c:out value="${customer.customerCode}"/></td>
                        <td><c:out value="${customer.fullName}"/></td>
                        <td><c:out value="${customer.dateOfBirth}"/></td>
                        <td>
                            <c:out value="${customer.gender}"/>
                        </td>
                        <td><c:out value="${customer.identityCardNumber}"/></td>
                        <td><c:out value="${customer.phoneNumber}"/></td>
                        <td><c:out value="${customer.email}"/></td>
                        <td><c:out value="${customer.address}"/></td>
                        <td><c:out value="${customer.customerType}"/></td>
                    </tr>
                </c:forEach>
            </table>

        </div>
        <div class="col-6">
            <h2>List Attach Service </h2>
            <table>
                <tr>
                    <td>Id</td>
                    <td>Name</td>
                    <td>Date Of Birth</td>
                    <td>Gender</td>
                    <td>Id Card</td>
                    <td>Phone</td>
                </tr>
                <c:forEach var="attach" items="${serviceAttachList}">
                    <tr>
                        <td><c:out value="${attach.attachServiceCode}"/></td>
                        <td><c:out value="${attach.attachServiceName}"/></td>
                        <td><c:out value="${attach.attachServiceUnit}"/></td>
                        <td><c:out value="${attach.attachServiceCost}"/></td>
                        <td><c:out value="${attach.attachServiceQuantity}"/></td>
                        <td><c:out value="${attach.attachServiceStatus}"/></td>
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





