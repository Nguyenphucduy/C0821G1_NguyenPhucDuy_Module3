<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Customer</title>
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
            <h4>List Customer</h4>
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
            <a href="/customer_servlet?choose=create">
                <button class="summit">Create customer</button>
            </a>
        </div>
        <div class="col-lg-2 ">
            <form method="post" action="/customer_servlet" id="search">
                <input type="hidden" name="choose" value="search">

                <input type="text" name="nameCustomer" style="width: 70px">

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
                    <th>Id</th>
                    <th>Name</th>
                    <th>Date Of Birth</th>
                    <th>Gender</th>
                    <th>Id Card</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Type Customer</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <c:forEach var="customer" items="${customerList}">
                    <tr>
                        <td><c:out value="${customer.customerCode}"/></td>
                        <td><c:out value="${customer.fullName}"/></td>
                        <td><c:out value="${customer.dateOfBirth}"/></td>
                        <td><c:out value="${customer.gender}"/></td>
                        <td><c:out value="${customer.identityCardNumber}"/></td>
                        <td><c:out value="${customer.phoneNumber}"/></td>
                        <td><c:out value="${customer.email}"/></td>
                        <td><c:out value="${customer.address}"/></td>
                        <td>
                            <c:if test="${customer.customerType == 1}">
                                Diamond
                            </c:if>
                            <c:if test="${customer.customerType == 2}">
                                Platinium
                            </c:if>
                            <c:if test="${customer.customerType == 3}">
                                Gold
                            </c:if>
                            <c:if test="${customer.customerType == 4}">
                                Silver
                            </c:if>
                            <c:if test="${customer.customerType == 5}">
                                Member
                            </c:if>
                        </td>

                        <td><a href="/customer_servlet?choose=edit&customerCode=${customer.customerCode}">edit</a></td>
<%--                        <td><a href="/customer_servlet?choose=delete&customerCode=${customer.customerCode}"--%>
<%--                               onclick="return confirm('Are you sure you want to delete this item?')">delete</a></td>--%>
                        <td>
                            <form action="/customer_servlet" method="post">
                                <input type="hidden" name="choose" value="delete">
                                <input type="hidden" name="customerCode" value="${customer.customerCode}">
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

