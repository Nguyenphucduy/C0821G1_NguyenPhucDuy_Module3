<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 11/27/2021
  Time: 5:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1 style="color: green">Information Input : </h1>

<h2 style="color: blue">description : <%=request.getAttribute("description")%></h2>
<h2 style="color: blue">price :  <%=request.getAttribute("price")%></h2>
<h2 style="color: blue">percent :  <%=request.getAttribute("percent")%></h2>


<h1 style="color: red">Result Calculator : </h1>
<h2 style="color: blue">Discount Amount : <%=request.getAttribute("discount_Amount")%></h2>
<h2 style="color: blue">Discount Price :  <%=request.getAttribute("discount_Price")%></h2>
</body>
</html>
