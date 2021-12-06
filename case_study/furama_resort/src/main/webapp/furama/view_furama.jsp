<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <style>
        .login {
            padding: 20px;
            text-align: right;
        }

        .header {
            background-color: #00cec9;
        }

        .menu {
            background-color: #81ecec;
            height: 70px;
        }
        .page-item {
            text-align: center;
            padding: 20px;
        }

        .content {
        }
        .sidebar-left {
            width: 20%;
        }

        .sidebar-right {
            width: 79%;
        }

        .footer {
            background-color: #00cec9;
        }


    </style>


</head>
<body>
<div class="container-fluid">
    <div class="row header">
        <div class="col-lg-6">
<%--            <img src="img/logo.jpg" height="100px" width="100px"/>--%>
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-apple" viewBox="0 0 16 16">
        <path d="M11.182.008C11.148-.03 9.923.023 8.857 1.18c-1.066 1.156-.902 2.482-.878 2.516.024.034 1.52.087 2.475-1.258.955-1.345.762-2.391.728-2.43zm3.314 11.733c-.048-.096-2.325-1.234-2.113-3.422.212-2.189 1.675-2.789 1.698-2.854.023-.065-.597-.79-1.254-1.157a3.692 3.692 0 0 0-1.563-.434c-.108-.003-.483-.095-1.254.116-.508.139-1.653.589-1.968.607-.316.018-1.256-.522-2.267-.665-.647-.125-1.333.131-1.824.328-.49.196-1.422.754-2.074 2.237-.652 1.482-.311 3.83-.067 4.56.244.729.625 1.924 1.273 2.796.576.984 1.34 1.667 1.659 1.899.319.232 1.219.386 1.843.067.502-.308 1.408-.485 1.766-.472.357.013 1.061.154 1.782.539.571.197 1.111.115 1.652-.105.541-.221 1.324-1.059 2.238-2.758.347-.79.505-1.217.473-1.282z"/>
        <path d="M11.182.008C11.148-.03 9.923.023 8.857 1.18c-1.066 1.156-.902 2.482-.878 2.516.024.034 1.52.087 2.475-1.258.955-1.345.762-2.391.728-2.43zm3.314 11.733c-.048-.096-2.325-1.234-2.113-3.422.212-2.189 1.675-2.789 1.698-2.854.023-.065-.597-.79-1.254-1.157a3.692 3.692 0 0 0-1.563-.434c-.108-.003-.483-.095-1.254.116-.508.139-1.653.589-1.968.607-.316.018-1.256-.522-2.267-.665-.647-.125-1.333.131-1.824.328-.49.196-1.422.754-2.074 2.237-.652 1.482-.311 3.83-.067 4.56.244.729.625 1.924 1.273 2.796.576.984 1.34 1.667 1.659 1.899.319.232 1.219.386 1.843.067.502-.308 1.408-.485 1.766-.472.357.013 1.061.154 1.782.539.571.197 1.111.115 1.652-.105.541-.221 1.324-1.059 2.238-2.758.347-.79.505-1.217.473-1.282z"/>
    </svg>
        </div>
        <div class="col-lg-6">
            <h5 class="login ">Nguyen Phuc Duy<span>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
  <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
</svg>
            </span></h5>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row menu">
        <div class="col-lg-2 page-item">
            <a href="#">Home</a>
        </div>
        <div class="col-lg-2 page-item">
            <a href="#">Employee</a>
        </div>
        <div class="col-lg-2 page-item">
            <a href="/customer_servlet?choose=create">Customer</a>
        </div>
        <div class="col-lg-2 page-item">
            <a href="#">Service</a>
        </div>
        <div class="col-lg-2 page-item">
            <a href="#">Contract</a>
        </div>
        <div class="col-lg-2 page-item">
            <form method="post">
                <span>
                    <input type="hidden" name="choose" value="search">
                    <input type="text" name="nameProduct" placeholder="Search" style="width: 120px " >
                    <input type="submit" value="Search">
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
        </div>
        <div class="col-lg-6 sidebar-right">
            <p>
                <c:out value="${hello}"/>
            </p>

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
            <h5 >Bản quyền thuộc Mr.Duy C0821G1</h5>
        </div>
    </div>
</div>

</body>
</html>
