<%--
    /**
 * Created with IntelliJ IDEA.
 * User: QiuShiLe
 * Date: 2015/3/24.
 * Time: 12:49
 * Project: JavaWebIntelliJ
 */
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>dologin</title>
    </head>

    <body>
        <h1>用户信息</h1>
        <hr>
        <%
            String username = "";
            String password = "";
            Cookie[] cookies = request.getCookies();
            if(cookies!= null && cookies.length >0){
                for (Cookie cookie : cookies) {
                    if(cookie.getName().equals("username")){
                        username = cookie.getValue();
                    }
                    if(cookie.getName().equals("password")){
                        password = cookie.getValue();
                    }
                }
            }
        %>

        <hr>
        <br>
        <br>
        <br>
        用户名：<%=username %><br>
        密码：<%=password %><br>
    </body>
</html>
