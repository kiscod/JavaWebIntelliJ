<%@ page import="shop.dao.ItemsDao" %>
<%@ page import="shop.entity.Items" %>
<%@ page import="java.util.ArrayList" %>
<!--

  Created by IntelliJ IDEA.
  User: Qiushile
  Date: 2015/4/15
  Time: 16:51
-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<html>
<head>
  <base href="<%=basePath%>">
  <title>具体商品展示页面</title>
  <!--
  <link rel="stylesheet" type="text/css" href="styles.css">
  -->
  <style type="text/css">
    div{
      float:left;
      margin-top: 5px;
      margin-right: 30px;
      margin-bottom: 5px;
      margin-left:  30px;
    }
    div dd{
      margin:0px;
      font-size:10pt;
    }
    div dd.dd_name
    {
      color:blue;
    }
    div dd.dd_city
    {
      color:#000;
    }
  </style>
</head>
<body>

  <h1>商品展示</h1>
  <table width="750" height="60" cellpadding="0" cellspacing="0" border="0">
    <tr>
      <td>
        <!--商品详情 -->
        <%
          ItemsDao itemsDao = new ItemsDao();
          System.out.println(request.getParameter("id"));
          Items item = itemsDao.getItemsById(Integer.parseInt(request.getParameter("id")));
          if (null != item){
        %>
      <td width="70%" valign="top">
        <table>
          <tr>
            <td rowspan="4"><img src="images/<%=item.getPicture() %>" width="200" height="160"></td>
          </tr>
          <tr>
            <td><B><%=item.getName() %></B></td>
          </tr>
          <tr>
            <td>产地：<%=item.getCity()%></td>
          </tr>
          <tr>
            <td>价格：<%=item.getPrice() %></td>
          </tr>
        </table>
      </td>


        <!--商品详情结束 -->
        <%
            }
        %>

        <%
          String list = "";
          Cookie[] cookies = request.getCookies();
          if( null != cookies && cookies.length > 0) {
            for (Cookie c : cookies) {
              if ("ListViewCookie".equals(c.getName())) {
                list = c.getValue();
              }
            }
          }
          list += request.getParameter("id") + ",";

          String [] arr = list.split(",");
          if(null != arr && arr.length > 0 && arr.length > 1000){
            list = "";
          }
          Cookie cookie = new Cookie("ListViewCookie", list);
          response.addCookie(cookie);
        %>
        
        <!-- 浏览过的商品 -->
      <td width="30%" bgcolor="#EEE" align="center">
        <br>
        <b>您浏览过的商品</b><br>

        <!-- 循环开始 -->
        <%
          ArrayList<Items> itemsList = itemsDao.getViewList(list);
          if (null != itemsList && itemsList.size() > 0){
            for (Items items : itemsList) {
        %>

        <div>
          <dl>
            <dt>
              <a href="details.jsp?id=<%=items.getId() %>"><img src="images/<%=items.getPicture() %>" width="120" height="100"></a>
            </dt>
            <dd class="dd_name"><%=items.getName() %></dd>
            <dd class="dd_city">产地：<%=items.getCity() %>&nbsp;&nbsp;价格：<%=items.getPrice() %></dd>
          </dl>          
        </div>
        <%
            }
          }
        %>
        <!-- 循环结束 -->
      </td>
    </tr>
  </table>
</body>
</html>