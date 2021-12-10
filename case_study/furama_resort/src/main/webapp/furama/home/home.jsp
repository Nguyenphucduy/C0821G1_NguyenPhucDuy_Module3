<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
<%--    <link rel="stylesheet" href="css/bootstrap.min.css">--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <style>
        *{
            box-sizing: border-box;
        }
        .login {
            text-align: right;
            color: blue;
            font-weight: bold;
            padding: 10px;
        }

        .header {
            background-color: #81ecec;
            height: 50px;
            margin-bottom: 10px;
        }

        .menu {
            background-color: #81ecec;
            height: 70px;

        }

        .page-item {
            text-align: center;
            padding: 20px;
            font-weight: bold;
        }

        .content {
            margin: 10px;
        }

        .sidebar-left {
            border: 2px dashed burlywood;
            width: 20%;
        }

        .sidebar-right {
            width: 79%;
        }

        .footer {
            background-color: #81ecec;
            height: 50px;
            padding: 25px;
        }

        a {
            color: black;
            text-decoration: none;
        }

        a:hover {
            color: red;
        }


    </style>


</head>
<body>
<div class="container-fluid">
    <div class="row header">
        <div class="col-lg-6">
<%--            <img src="img/logo.jpg" height="50px" width="50px"/>--%>
            <img src="https://i.pinimg.com/280x280_RS/8c/c7/cf/8cc7cf8460083733c6e80bcdc42aeeff.jpg" height="50px" width="50px"/>
        </div>
        <div class="col-lg-6">
            <p class="login">
                <%=request.getSession().getAttribute("usernameSession")%>
            </p>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row menu">
        <div class="col-lg-2 page-item">
            <a href="/home_servlet">Home</a>
        </div>
        <div class="col-lg-2 page-item">
            <a href="/employee_servlet">Employee</a>
        </div>
        <div class="col-lg-2 page-item">
            <a href="/customer_servlet">Customer</a>
        </div>
        <div class="col-lg-2 page-item">
            <a href="/service_servlet">Service</a>
        </div>
        <div class="col-lg-2 page-item">
            <a href="/contract_servlet">Contract</a>
        </div>
        <div class="col-lg-2 page-item">
            <form method="post">
                <span>
                    <input type="hidden" name="choose" value="search">
                    <input type="text" name="nameProduct" placeholder="Search" style="width: 120px ">
                    <input class="summit" type="submit" value="Search">
                </span>
            </form>
        </div>
    </div>
</div>
<div class="container-fluid ">
    <div class="row content">
        <div class="col-lg-6 sidebar-left">
            <p><a href="#">link</a></p>
            <p><a href="#">link</a></p>
            <p><a href="#">link</a></p>
            <p><a href="#">link</a></p>
            <p><a href="#">link</a></p>
            <p><a href="#">link</a></p>
            <p><a href="#">link</a></p>
            <p><a href="#">link</a></p>
            <p><a href="#">link</a></p>
            <p><a href="#">link</a></p>
            <p><a href="#">link</a></p>
        </div>
        <div class="col-lg-6 sidebar-right">

            <p><a href="#">link</a></p>
            <p><a href="#">link</a></p>
            <p><a href="#">link</a></p>
            <p><a href="#">link</a></p>
            <p><a href="#">link</a></p>
            <p><a href="#">link</a></p>
            <p><a href="#">link</a></p>
            <p><a href="#">link</a></p>
            <p><a href="#">link</a></p>
            <p><a href="#">link</a></p>
            <p><a href="#">link</a></p>
            <p><a href="#">link</a></p>
        </div>
    </div>
</div>

<div class="container-fluid ">
    <div class="row footer">
        <div class="col-lg-12">
            <h5>Bản quyền thuộc Mr.Duy C0821G1</h5>
        </div>
    </div>
</div>

</body>
</html>
