<%--
    /**
 * Created with IntelliJ IDEA.
 * User: QiuShiLe
 * Date: 2015/3/21.
 * Time: 12:25
 * Project: JavaWebIntelliJ
 */
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+ "://"+ request.getServerName()+ ":"+ request.getServerPort()+ path+ "/";
%>
<html>
<head>
    <title>imooc - login</title>
</head>
<body>
    <div id="box">
        登陆失败，请检查用户名或密码！<br>
        <a href="login.jsp">返回登陆</a>
    </div>

</body>
</html>
