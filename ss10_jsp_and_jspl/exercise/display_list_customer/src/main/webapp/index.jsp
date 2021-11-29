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
  <table  height="100%" width="100%" border="1">
    <tr style="text-align: center">
      <th>Number</th>
      <th>Name</th>
      <th>Date Of Birth</th>
      <th>Address</th>
        <th>Gender</th>
        <th>Rank</th>
      <th>Picture</th>
    </tr>
    <c:forEach var="customer" items="${customerList}" varStatus="count">
      <tr style="text-align: center">
        <td>
          <c:out value="${count.count}"/>
        </td>

        <td>
          <c:out value="${customer.name}"/>
        </td>

        <td>
          <c:out value="${customer.dateOfBirth}"/>
        </td>

        <td>
            <c:if test="${customer.gender==0}">
                Famale
            </c:if>

            <c:if test="${customer.gender==1}">
               Male
            </c:if>
        </td>

          <td>
              <c:choose>
                  <c:when test="${customer.rank < 5}">
                      Member

                  </c:when>
                  <c:when test="${customer.rank <= 7}">
                      Gold

                  </c:when>
                  <c:otherwise>
                      Vip
                  </c:otherwise>
              </c:choose>
          </td>

          <td>
              <c:out value="${customer.address}"/>
          </td>

        <td>
          <img src="/picture/<c:out value="${customer.picture}"/>" width="70px" height="70px" >
        </td>

      </tr>

    </c:forEach>

  </table>
  </body>
</html>
