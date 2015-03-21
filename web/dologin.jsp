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
<jsp:useBean id="loginUser" class="com.po.Users" scope="page"/>
<jsp:useBean id="userDAO" class="com.dao.UsersDAO" scope="page"/>
<jsp:setProperty name="loginUser" property="*" />

<%
    String username = "";
    String password = "";
    request.setCharacterEncoding("utf-8");

    username = request.getParameter("username");
    password = request.getParameter("password");

    if(userDAO.userLogin(loginUser)){
        session.setAttribute("loginUser", loginUser.getUsername());
        request.getRequestDispatcher("login_success.jsp").forward(request, response);
    }else{
        response.sendRedirect("login_failure.jsp");
    }
%>

