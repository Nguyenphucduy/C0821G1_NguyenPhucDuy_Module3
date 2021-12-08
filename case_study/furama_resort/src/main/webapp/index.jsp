<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <style>
    .login {
      padding: 20px;
      text-align: right;
      color: blue;
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
      background-color: #e7f1ff;
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
                  <img src="img/logo.jpg" height="100px" width="100px"/>
    </div>
    <div class="col-lg-6">
      <h5 class="login">
        <p class="login">
          Welcome, <%=request.getSession().getAttribute("usernameSession")%>
          <span><a href="/home_servlet?choose=login">Login</a></span>
        </p>
      </h5>
    </div>
  </div>
</div>
<div class="container-fluid">
  <div class="row menu">
    <div class="col-lg-2 page-item">
      <a href="#">Home</a>
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
