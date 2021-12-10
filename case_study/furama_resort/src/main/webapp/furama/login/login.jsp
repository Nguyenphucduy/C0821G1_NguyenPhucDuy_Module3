<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        *{
         box-sizing: border-box;
        }
        body{
            margin: 0;
        }
        .msg {
            color: red;
            text-align: center;
            background-color: aquamarine;
        }

        .title {
            color: white;
            text-align: center;
            background-color: #0abde3;
            height: 40px;
            margin-bottom: 10px;
        }


        .sidebar {
            float: left;
            width: 70%;
            margin-bottom: 10px;
        }

        .right {
            float: left;
            width: 30%;
            background-color: #0abde3;
            color: white;
            text-align: center;
            height: 600px;
            margin-bottom: 10px;
        }

        a{
            color:red;
        }
        a:hover{
            color:black;
        }
        .footer{
            clear: both;
            color: white;
            background-color: #0abde3;
            height: 40px;
        }
    </style>
</head>
<body>
<div class="title">
    <h2>Welcome back</h2>
</div>
<div>
    <div class="sidebar">
        <img src="https://danang.codegym.vn/wp-content/uploads/sites/2/2020/08/21-scaled.jpg" width="100%"
             height="600px">
    </div>


    <div class="right">
        <div>
            <img src="https://codegym.vn/wp-content/uploads/2017/03/CodeGym-3-02-copy.jpg" width="100%" height="100px">
        </div>
        <center>


        <table >
            <tr>
                <th>
                    <h1 style="color:white;">Sign In</h1>
                    <h3 class="msg"><c:out value="${messenger}"/></h3>
                </th>
            </tr>
            <tr>
                <td>
                    <form action="/login_servlet" method="post" >
                        <div>
                               <span style="color: white">Username :</span> <input type="text" name="username" placeholder="Username" value="${usernameC}"/>
                        </div>
                        <div>
                                <span style="color: white">Password :</span>   <input type="password" name="password" placeholder="Password" value="${passwordC}"/>
                        </div>

                        <div>
                            <span style="color: white"><input type="checkbox" name="save"/> Remember Me  <a href="/employee_servlet?choose=createUser">Forgot Password?</a> </span>
                        </div>
                        <div>
                            <input type="submit" value="Login" style="color: white ; background-color: #20c997 ; padding-left: 2px"/>
                        </div>
                    </form>
                </td>

            </tr>

        </table>
        </center>
    </div>
</div>
<div class="footer">
    <h2>Bản quyền thuộc Mr.Duy C0821G1</h2>
</div>

</body>
</html>
