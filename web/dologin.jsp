<%--
    /**
 * Created with IntelliJ IDEA.
 * User: QiuShiLe
 * Date: 2015/3/21.
 * Time: 12:42
 * Project: JavaWebIntelliJ
 */
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String username = "";
    String password = "";
    request.setCharacterEncoding("utf-8");

    username = request.getParameter("username");
    password = request.getParameter("password");

    if("admin".equals(username) && "admin".equals(password)){
        session.setAttribute("loginUser", username);
        request.getRequestDispatcher("login_success.jsp").forward(request, response);
    }else{
        response.sendRedirect("login_failure.jsp");
    }
%>

