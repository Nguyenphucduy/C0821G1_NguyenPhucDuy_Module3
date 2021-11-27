<html>
<head>
  <title>Sum 2 number</title>
</head>
<body>
<form action="/sumServlet" method="get">
  <div>
    Number 1:
  </div>
  <div>
    <input type="text" name="num1">
  </div>
  <div>
    Number 2:
  </div>
  <div>
    <input type="text" name="num2">
  </div>
  <div>
    <input type="submit" value="Sum 2">
  </div>
  <h2 style="color: blue"><%=request.getAttribute("resultNum")%></h2>
</form>

</body>
</html>