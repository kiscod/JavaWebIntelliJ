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
        <%
            String loginUser = "";
            if(session.getAttribute("loginUser")!=null){
                loginUser = session.getAttribute("loginUser").toString();
            }
        %>
        欢迎您<font color="red"><%=loginUser %></font> ， 登陆成功！
    </div>

</body>
</html>
