<%--
    /**
 * Created with IntelliJ IDEA.
 * User: QiuShiLe
 * Date: 2015/3/21.
 * Time: 12:25
 * Project: JavaWebIntelliJ
 */
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.net.*"  %>

<html>
<head>
    <title>imooc - login</title>
</head>
<%--<body>--%>
    <%--<div id="box">--%>
        <%--<form action="dologin.jsp" method="post">--%>
            <%--<p class="main">--%>
                <%--<label>用户名：</label>--%>
                <%--<input name="username" value="">--%>
                <%--<label>密码：</label>--%>
                <%--<input type="password" name="password" value="">--%>
            <%--</p>--%>
            <%--<p class="space">--%>
                <%--<input type="submit" value="登录" class="login" style="cursor: pointer">--%>
            <%--</p>--%>
        <%--</form>--%>
    <%--</div>--%>

<%--</body>--%>

    <body>
        <h1>用户登录</h1>
        <hr>
        <%
            String username = "";
            String password = "";
            Cookie[] cookies = request.getCookies();
            if(cookies!= null && cookies.length >0){
                for (Cookie cookie : cookies) {
                    if(cookie.getName().equals("username")){
                        username = URLDecoder.decode(cookie.getValue(), "utf-8");
                    }
                    if(cookie.getName().equals("password")){
                        password = URLDecoder.decode(cookie.getValue(), "utf-8");
                    }
                }
            }
        %>

        <form name="loginForm"  action="forward_action.jsp"    method="post">
            <table>
                <tr>
                    <td>用户名：</td>
                    <td><input type="text" name="username" value=<%=username %>></td>
                </tr>
                <tr>
                    <td>密码：</td>
                    <td><input type="password" name="password" value=<%=password %>></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="checkbox" name="isUseCookie" checked="checked">十天内记住我的登录状态</td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="登录"></td>
                </tr>
            </table>
        </form>

    </body>


</html>
