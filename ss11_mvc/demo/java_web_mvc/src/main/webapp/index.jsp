<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>list customer</title>
  <style>
    body{
      font-family: "Arial Narrow", serif;
    }
  </style>
</head>
<body>
<h2 style="text-align: center">
  List Customer
</h2>
<p>
  <a href="/customers?action=create">Create new customer</a>
</p>
<table border="1">
  <tr style="text-align: center">
    <th>Name</th>
    <th>Email</th>
    <th>Address</th>
    <th>Edit</th>
    <th>Delete</th>
  </tr>
  <c:forEach var="customer" items="${requestScope['customers']}" varStatus="count">
    <tr style="text-align: center">
      <td>
        <a href="/customers?action=view&id=${customer.getId()}">${customer.getName()}</a>
      </td>

      <td>
        <c:out value="${customer.getEmail}"/>
      </td>

      <td>
        <c:out value="${customer.getAdress}"/>
      </td>

      <td>
        <a href="/customers?action=edit&id=${customer.getId()}">edit</a>
      </td>

      <td>
        <a href="/customers?action=delete&id=${customer.getId()}">delete</a>
      </td>


    </tr>

  </c:forEach>

</table>
</body>
</html>

