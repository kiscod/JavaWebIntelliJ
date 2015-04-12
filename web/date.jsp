<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%--
  Created by IntelliJ IDEA.
  User: Qiushile
  Date: 2015/4/12
  Time: 18:11
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Date d = new Date();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
  String s = sdf.format(d);
  out.println(s);
%>
