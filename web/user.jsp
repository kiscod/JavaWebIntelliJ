<!--

  Created by IntelliJ IDEA.
  User: Qiushile
  Date: 2015/4/13
  Time: 23:58
-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title></title>
  </head>
  <body>

    <h1>用户资料</h1>
    <hr>
    <%
      request.setCharacterEncoding("utf-8");
      String username = "";
      String password = "";
      String email    = "";
      if(null != request.getParameter("username")){
        username = request.getParameter("username");
      }
      if(null != request.getParameter("password")){
        password = request.getParameter("password");
      }
      if(null != request.getParameter("email")){
        email = request.getParameter("email");
      }
    %>


    用户名：<%=username %><br>
    密码：<%=password %><br>
    电子邮箱：<%=email %><br>
  </body>
</html>
