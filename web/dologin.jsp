<%--
    /**
 * Created with IntelliJ IDEA.
 * User: QiuShiLe
 * Date: 2015/3/21.
 * Time: 12:42
 * Project: JavaWebIntelliJ
 */
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.net.*" %>

<%--<jsp:useBean id="loginUser" class="com.po.Users" scope="page"/>--%>
<%--<jsp:useBean id="userDAO" class="com.dao.UsersDAO" scope="page"/>--%>
<%--<jsp:setProperty name="loginUser" property="*" />--%>

<%--<%--%>
    <%--request.setCharacterEncoding("utf-8");--%>
    <%--if(userDAO.userLogin(loginUser)){--%>
        <%--session.setAttribute("loginUser", loginUser.getUsername());--%>
        <%--request.getRequestDispatcher("login_success.jsp").forward(request, response);--%>
    <%--}else{--%>
        <%--response.sendRedirect("login_failure.jsp");--%>
    <%--}--%>
<%--%>--%>

<html>
    <head>
        <title>dologin</title>
    </head>

    <body>
        <h1>登录成功</h1>
        <hr>
        <br>
        <br>
        <br>
        <%
            request.setCharacterEncoding("utf-8");
            //首先判断用户是否选择了记住
            String[] isUseCookie = request.getParameterValues("isUseCookie");
            if(isUseCookie!= null && isUseCookie.length > 0){

                /**
                 * 对中文进行处理 URLEncoder.encode(username, "")
                 * 不处理的话，中文字符串无法在Cookie保存处理 会导致报错
                 */
                String username = URLEncoder.encode(request.getParameter("username"), "utf-8");
                String password = URLEncoder.encode(request.getParameter("password"), "utf-8");

                Cookie usernameCookie = new Cookie("username", username);
                Cookie passwordCookie = new Cookie("password", password);
                usernameCookie.setMaxAge(864000);//设置最大生存期限为10天
                passwordCookie.setMaxAge(864000);
                response.addCookie(usernameCookie);
                response.addCookie(passwordCookie);
            }else{
                Cookie[] cookies = request.getCookies();
                if(cookies!= null && cookies.length > 0){
                    for (Cookie c : cookies) {
                        if(c.getName().equals("username") || c.getName().equals("password")){
                            c.setMaxAge(0);//设置Cookie失效
                            response.addCookie(c);//重新保存
                        }
                    }
                }
            }
        %>
        <a href="users.jsp" target="_blank">查看用户信息</a>
    </body>
</html>
