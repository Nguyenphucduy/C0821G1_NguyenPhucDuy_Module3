<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update new service</title>
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
            <h2>Update new service</h2>
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
            <form method="post">
                <table border="1" cellpadding="5">
                    <tr>
                        <input type="hidden" name="edit" />
                    </tr>

                    <tr>
                        <th>Code Service:</th>
                        <td>
                            <input type="hidden" name="codeService"
                                   value="<c:out value='${service.codeService}' />"
                            />
                        </td>
                    </tr>
                    <tr>
                        <th>Name Service:</th>
                        <td>
                            <input type="text" name="nameService"
                                   value="<c:out value='${service.nameService}' />"
                            />
                        </td>
                    </tr>
                    <tr>
                        <th>Usable Area:</th>
                        <td>
                            <input type="text" name="usableArea"
                                   value="<c:out value='${service.usableArea}' />"
                            />
                        </td>
                    </tr>
                    <tr>
                        <th>Rent Cost:</th>
                        <td>
                            <input type="text" name="rentCost"
                                   value="<c:out value='${service.rentCost}' />"
                            />
                        </td>
                    </tr>
                    <tr>
                        <th>Number Of People:</th>
                        <td>
                            <input type="text" name="numberOfPeople"
                                   value="<c:out value='${service.numberOfPeople}' />"
                            />
                        </td>
                    </tr>
                    <tr>
                        <th>Service Type Id:
                            <c:if test="${service.serviceTypeId == 1}">
                                Villa
                            </c:if>
                            <c:if test="${service.serviceTypeId == 2}">
                                House
                            </c:if>
                            <c:if test="${service.serviceTypeId == 3}">
                                Room
                            </c:if>

                        </th>
                        <td>
                            <select name="serviceTypeId" >
                                <option value="1">Villa</option>
                                <option value="2">House</option>
                                <option value="3">Room</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>Rental Type:
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
                        </th>

                        <td>
                            <select name="rentalType" >
                                <option value="1">Year</option>
                                <option value="2">Month</option>
                                <option value="3">Day</option>
                                <option value="4">House</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>Standard Room:</th>
                        <td>
                            <input type="text" name="standardRoom"
                                   value="<c:out value='${service.standardRoom}' />"
                            />
                        </td>
                    </tr>
                    <tr>
                        <th>Description Other Convenience:</th>
                        <td>
                            <input type="text" name="descriptionOtherConvenience"
                                   value="<c:out value='${service.descriptionOtherConvenience}' />"
                            />
                        </td>
                    </tr>
                    <tr>
                        <th>Pool Area:</th>
                        <td>
                            <input type="text" name="poolArea"
                                   value="<c:out value='${service.poolArea}' />"
                            />
                        </td>
                    </tr>
                    <tr>
                        <th>Number Of Floors:</th>
                        <td>
                            <input type="text" name="numberOfFloors"
                                   value="<c:out value='${service.numberOfFloors}' />"
                            />
                        </td>
                    </tr>


                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="Update" class="summit"/>
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



