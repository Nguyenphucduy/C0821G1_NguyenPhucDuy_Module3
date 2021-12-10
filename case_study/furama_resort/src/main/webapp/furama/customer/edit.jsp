<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update new Customer</title>
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
            <h2>Update new Customer</h2>
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

                    <%--            <c:if test="${customer != null}">--%>
                    <%--                <input type="hidden" name="customerCode" value="<c:out value='${customer.customerCode}' />"/>--%>
                    <%--            </c:if>--%>
                    <tr>
                        <input type="hidden" name="edit"/>
                    </tr>
                    <tr>
                        <input type="hidden" name="customerCode" value="<c:out value='${customer.customerCode}' />"/>
                    </tr>
                    <tr>
                        <th>Customer Name:</th>
                        <td>
                            <input type="text" name="nameCustomer"
                                   value="<c:out value='${customer.fullName}' />"
                            />
                        </td>
                    </tr>
                    <tr>
                        <th>Customer date of birth:</th>
                        <td>
                            <input type="text" name="dateOfBirthCustomer"
                                   value="<c:out value='${customer.dateOfBirth}' />"
                            />
                        </td>
                    </tr>
                    <tr>
                        <th>Customer gender:</th>
                        <td>
                            <input type="text" name="genderCustomer"
                                   value="<c:out value='${customer.gender}' />"
                            />
                        </td>
                    </tr>
                    <tr>
                        <th>Customer id card:</th>
                        <td>
                            <input type="text" name="idCardCustomer"
                                   value="<c:out value='${customer.identityCardNumber}' />"
                            />
                        </td>
                    </tr>
                    <tr>
                        <th>Customer phone:</th>
                        <td>
                            <input type="text" name="phoneCustomer"
                                   value="<c:out value='${customer.phoneNumber}' />"
                            />
                        </td>
                    </tr>
                    <tr>
                        <th>Customer email:</th>
                        <td>
                            <input type="text" name="emailCustomer"
                                   value="<c:out value='${customer.email}' />"
                            />
                        </td>
                    </tr>
                    <tr>
                        <th>Customer address:</th>
                        <td>
                            <input type="text" name="addressCustomer"
                                   value="<c:out value='${customer.address}' />"
                            />
                        </td>
                    </tr>
                    <tr>
                        <%--                <td>--%>
                        <%--                    <input type="hidden"--%>
                        <%--                           value="<c:out value='${customer.customerType}' />"--%>
                        <%--                    />--%>
                        <%--                </td>--%>

                        <td>Customer type id:
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

                        <td>
                            <select name="typeIdCustomer">
                                <option value="1">Diamond</option>
                                <option value="2">Platinium</option>
                                <option value="3">Gold</option>
                                <option value="4">Silver</option>
                                <option value="5">Member</option>
                            </select>
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


