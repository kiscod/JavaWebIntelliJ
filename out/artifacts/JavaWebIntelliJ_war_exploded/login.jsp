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
        <form action="dologin.jsp" method="post">
            <p class="main">
                <label>用户名：</label>
                <input name="username" value="">
                <label>密码：</label>
                <input type="password" name="password" value="">
            </p>
            <p class="space">
                <input type="submit" value="登录" class="login" style="cursor: pointer">
            </p>
        </form>
    </div>

</body>
</html>
