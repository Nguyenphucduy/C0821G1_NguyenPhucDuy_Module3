<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create new service</title>
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
            <h1>Create new service</h1>
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
            <form action="/service_servlet" method="post">
                <input type="hidden" name="choose" value="create">
                <fieldset>
                    <legend class="center">Service information</legend>
                    <table>
                        <tr>
                            <td>Service Code: </td>
                            <td><input type="text" name="codeService" ></td>
                        </tr>
                        <tr>
                            <td>Service Name: </td>
                            <td><input type="text" name="nameService" ></td>
                        </tr>
                        <tr>
                            <td>Service Usable Area: </td>
                            <td><input type="text" name="usableArea" ></td>
                        </tr>

                        <tr>
                            <td>Service Rent Cost: </td>
                            <td><input type="text" name="rentCost" ></td>
                        </tr>

                        <tr>
                            <td>Service Number Of People: </td>
                            <td><input type="text" name="numberOfPeople" ></td>
                        </tr>

                        <tr>
                            <td>Service Type Id: </td>
                            <td>
                                <select name="serviceTypeId" >
                                    <option value="1">Villa</option>
                                    <option value="2">House</option>
                                    <option value="3">Room</option>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td>Service Rental Type: </td>
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
                            <td>Service Standard Room: </td>
                            <td><input type="text" name="standardRoom" ></td>
                        </tr>

                        <tr>
                            <td>Service Description Other Convenience: </td>
                            <td><input type="text" name="descriptionOtherConvenience" ></td>
                        </tr>
                        <tr>
                            <td>Service Pool Area: </td>
                            <td><input type="text" name="poolArea" ></td>
                        </tr>

                        <tr>
                            <td>Service Number Of Floors: </td>
                            <td><input type="text" name="numberOfFloors" ></td>
                        </tr>

                        <tr>
                            <td><input type="submit" value="Create Service" class="summit"></td>
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






