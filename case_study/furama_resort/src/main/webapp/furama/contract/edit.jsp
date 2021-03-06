<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update new contract</title>
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
            <h2>Update new contract</h2>
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
            <form action="/contract_servlet" method="post">
                <input type="hidden" name="choose" value="edit">
                <fieldset>
                    <legend class="center">Contract information</legend>
                    <table>
                        <tr>
                            <td>contract Code: </td>
                            <td><input type="hidden" name="contractCode"
                                       value="<c:out value='${contract.contractCode}' />">
                            </td>
                        </tr>
                        <tr>
                            <td>contract Start Date: </td>
                            <td><input type="date" name="contractStartDate"
                                       value="<c:out value='${contract.contractStartDate}' />">
                                ></td>
                        </tr>
                        <tr>
                            <td>contract End Date: </td>
                            <td><input type="date" name="contractEndDate"
                                       value="<c:out value='${contract.contractEndDate}' />">
                                ></td>
                        </tr>

                        <tr>
                            <td>contract Deposit: </td>
                            <td><input type="text" name="contractDeposit"
                                       value="<c:out value='${contract.contractDeposit}' />">
                                ></td>
                        </tr>
                        <tr>
                            <td>contract Total Money: </td>
                            <td><input type="text" name="contractTotalMoney"
                                       value="<c:out value='${contract.contractTotalMoney}' />">
                                ></td>
                        </tr>
                        <tr>
                            <td>employee Code:
                                <c:out value='${contract.employeeCode}' />
                            </td>
                            <td>
                                <select name="employeeCode">
                                    <c:forEach var="employee" items="${employeeList}">
                                        <option value="<c:out value="${employee.employeeCode}"/>"><c:out value="${employee.employeeCode}"/></option>
                                    </c:forEach>
                                </select>
                            </td>

                        </tr>
                        <tr>
                            <td> customer Code:
                                <c:out value='${contract.customerCode}' />
                            </td>
                            <td>
                                <select name="customerCode">
                                    <c:forEach var="customer" items="${customerList}">
                                        <option value="<c:out value="${customer.customerCode}"/>"><c:out value="${customer.customerCode}"/></option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>service Code:
                                <c:out value='${contract.serviceCode}' />
                            </td>
                            <td>
                                <select name="serviceCode">
                                    <c:forEach var="contract" items="${serviceResortList}">
                                        <option value="<c:out value="${contract.codeService}"/>"><c:out value="${contract.codeService}"/></option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Update Contract" class="summit"></td>
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
            <p>&copy; Ba??n quy????n thu????c Mr.Duy C0821G1</p>
        </div>
    </div>
</div>

</body>
</html>

