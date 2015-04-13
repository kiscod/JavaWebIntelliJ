<!--

  Created by IntelliJ IDEA.
  User: Qiushile
  Date: 2015/4/12
  Time: 18:19

-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title></title>
  </head>
  <body>
    <h1>Forward动作</h1>
    <hr>
    <!-- <jsp:forward page="user.jsp"/> -->

    <%
      request.getRequestDispatcher("user.jsp").forward(request, response);
    %>

  </body>
</html>
