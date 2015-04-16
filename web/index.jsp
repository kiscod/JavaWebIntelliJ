<%@ page import="java.util.*" %>
<%@ page import="shop.entity.Items" %>
<%@ page import="shop.dao.ItemsDao" %>
<%@ page import="shop.util.DBHelper" %>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/3/21
  Time: 10:23
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>商品展示页面</title>
    <!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <style type="text/css">
      div{
        float:left;
        margin: 10px;
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

    <center>
     <h1>商品展示</h1>
     <table width="750" height="60" cellpadding="0" cellspacing="0" border="0">
        <tr>
          <td>
            <!--商品循环开始 -->
            <%
              ItemsDao itemsDao = new ItemsDao();
              ArrayList<Items> list = null;
              list = itemsDao.getAllItems();
              if (null != list && list.size()>0){
                for (Items item : list) {
            %>
            <div>
              <dl>
                <dt>
                  <a href="details.jsp?id=<%=item.getId() %>"><img src="images/<%=item.getPicture()%>" width="120" height="90"></a>
                </dt>
                <dd class="dd_name"><%=item.getName()%></dd>
                <dd class="dd_city">产地：<%=item.getCity()%> &nbsp;&nbsp; 价格：￥<%=item.getPrice()%></dd>
              </dl>
            </div>
            <!--商品循环结束 -->
            <%
              } }
            %>
          </td>
        </tr>
      </table>
    </center>
  </body>
</html>
