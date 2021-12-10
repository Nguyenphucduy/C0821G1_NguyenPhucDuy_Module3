<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create new customer</title>
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
            <h2>Create new customer</h2>
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
            <form action="/customer_servlet" method="post">
                <input type="hidden" name="choose" value="create">
                <fieldset>
                    <center>
                    <legend>Customer information</legend>
                    </center>
                    <table>
                        <tr>
                            <td>Customer Code: </td>
                            <td><input type="text" name="codeCustomer" ></td>
                        </tr>
                        <tr>
                            <td>Customer Name: </td>
                            <td><input type="text" name="nameCustomer" ></td>
                        </tr>
                        <tr>
                            <td>Customer Date of Birth: </td>
                            <td><input type="date" name="dateOfBirthCustomer" ></td>
                        </tr>
                        <tr>
                            <td>
                                Customer Gender:
                            </td>
                            <td>
                                <select name="genderCustomer" >
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Customer Id Card: </td>
                            <td><input type="text" name="idCardCustomer" ></td>
                        </tr>
                        <tr>
                            <td>Customer Phone: </td>
                            <td><input type="text" name="phoneCustomer" ></td>
                        </tr>
                        <tr>
                            <td>Customer Email: </td>
                            <td><input type="text" name="emailCustomer" ></td>
                        </tr>
                        <tr>
                            <td> Customer Address: </td>
                            <td><input type="text" name="addressCustomer" ></td>
                        </tr>
                        <tr>
                            <td>Customer type id: </td>
                            <td>
                                <select name="typeIdCustomer" >
                                    <option value="1">Diamond</option>
                                    <option value="2">Platinium</option>
                                    <option value="3">Gold</option>
                                    <option value="4">Silver</option>
                                    <option value="5">Member</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Create Customer" class="summit"></td>
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




