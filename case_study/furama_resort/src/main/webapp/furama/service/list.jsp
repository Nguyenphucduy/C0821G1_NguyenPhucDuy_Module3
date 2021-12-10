<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Service</title>
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
        .page-item{
            padding: 10px;
        }


    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row header">
        <div class="col-lg-4 left">
            <h2>List Service</h2>
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
            <a href="/service_servlet?choose=create">
                <button class="summit">Create Service</button>
            </a>
        </div>
        <div class="col-lg-2 ">
            <form method="post" action="/service_servlet">
                <input type="hidden" name="choose" value="search">
                <input type="text" name="nameService" style="width: 70px">
                <button class="summit">Search</button>
            </form>
        </div>
        <div class="col-lg-2 page-item">
            <a href="/service_servlet?choose=getListCustomer">
                <button class="summit">List Customer Using Service </button>
            </a>
        </div>
        <div class="col-lg-2 page-item">
            <a href="/service_servlet?choose=totalMoney">
                <button class="summit">List Total Money Service</button>
            </a>
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
                    <td>Area</td>
                    <td>Rent cost</td>
                    <td>Number of people</td>
                    <td>Service type id</td>
                    <td>Rent type id</td>
                    <td>Standard room</td>
                    <td>Description other convenience</td>
                    <td>Pool area</td>
                    <td>Number of floors</td>
                    <td>Edit</td>
                    <td>Delete</td>
                </tr>
                <c:forEach var="service" items="${serviceResortList}">
                    <tr>
                        <td><c:out value="${service.codeService}"/></td>
                        <td><c:out value="${service.nameService}"/></td>
                        <td><c:out value="${service.usableArea}"/></td>
                        <td><c:out value="${service.rentCost}"/></td>
                        <td><c:out value="${service.numberOfPeople}"/></td>
                        <td>
                            <c:if test="${service.serviceTypeId == 1}">
                                Villa
                            </c:if>
                            <c:if test="${service.serviceTypeId == 2}">
                                House
                            </c:if>
                            <c:if test="${service.serviceTypeId == 3}">
                                Room
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${service.rentalType == 1}">
                                Year
                            </c:if>
                            <c:if test="${service.rentalType == 2}">
                                Month
                            </c:if>
                            <c:if test="${service.rentalType == 3}">
                                Day
                            </c:if>
                            <c:if test="${service.rentalType == 4}">
                                House
                            </c:if>
                        </td>
                        <td><c:out value="${service.standardRoom}"/></td>
                        <td><c:out value="${service.descriptionOtherConvenience}"/></td>
                        <td><c:out value="${service.poolArea}"/></td>
                        <td><c:out value="${service.numberOfFloors}"/></td>


                        <td><a href="/service_servlet?choose=edit&codeService=${service.codeService}">edit</a></td>
<%--                        <td><a href="/service_servlet?choose=delete&codeService=${service.codeService}"--%>
<%--                               onclick="return confirm('Are you sure you want to delete this item?')">delete</a></td>--%>
<%--                        <td>--%>
                        <td>
                            <form action="/service_servlet" method="post">
                                <input type="hidden" name="choose" value="delete">
                                <input type="hidden" name="codeService" value="${service.codeService}">
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





