<!--

  Created by IntelliJ IDEA.
  User: Qiushile
  Date: 2015/4/14
  Time: 0:16
-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title></title>
</head>
  <body>
    <jsp:forward page="user.jsp">
      <jsp:param name="email" value="admin@163.net"/>
      <jsp:param name="password" value="123456"/>
    </jsp:forward>
  </body>
</html>
