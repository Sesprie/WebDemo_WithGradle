<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'show.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <table width="600px" border="1px"  cellpadding="0" cellspacing="0" align="center">
   <tr align="center" >
   <td>商品表编号</td>
   <td>商品名称</td>
   <td>商品描述</td>
   <td>商品价格</td>
   <td>我要购买</td>  
   <td>查看购物车</td> 
   </tr>
   <%
   Class.forName("com.mysql.jdbc.Driver");  
   Connection  con=DriverManager.getConnection("jdbc:mysql://localhost/shop","root","root");  
   Statement stmt= con.createStatement();
   ResultSet  rs=stmt.executeQuery("select * from goods");     
   while (rs.next())
   {
	   out.print("<tr  align='center'>"); 
	   out.print("<td>"+rs.getString("id")+"</td>");
	   out.print("<td>"+rs.getString("name")+"</td>");
	   out.print("<td>"+rs.getString("description")+"</td>");
	   out.print("<td>"+rs.getString("price")+"</td>");
	   out.print("<td><a href=buy.jsp?id="+rs.getString("id")+">购买</a></td>");
	   out.print("<td><a href=look.jsp>查看我的购物车</a></td>");
       out.print("</tr>");
   } 
   %>
   </table>
  </body>
</html>
