<%@ page language="java" import="java.util.*,chapter01.shopping_cart.example.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'look.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
chapter01/shopping_cart/example/Product.java
  </head>
  
  <body>
   <%
   ArrayList <Product> l =(ArrayList)session.getAttribute("list");
   if (l==null)
   {
	   out.print("您还没有购物!");
	   return;
   }
   %>
   <table width="600px" border="1px"  cellpadding="0" cellspacing="0" align="center">
  <caption align="center">我的购物车</caption>
   <tr align="center" >
   <td>商品表编号</td>
   <td>商品名称</td>
   <td>商品描述</td>
   <td>商品数量</td>
   <td>商品价格</td>
   <td>商品总价 </td>
   <td>删除物品 </td>
   </tr>
   <%
   Product p=new Product();
   for(int i=0;i<l.size();i++)
   {
    p=(Product)l.get(i);
   %>
   <tr  align="center">
   <td><%=p.getId() %></td>
   <td><%=p.getName() %></td>
   <td><%=p.getDescription() %></td>
   <td><%=p.getNumber() %></td>
   <td><%=p.getPrice() %></td>  
   <td><%=p.getPrice()*p.getNumber()  %></td>  
   <td><a href=del.jsp?id=<%=p.getId() %>>删除商品</a></td>  
   </tr>
  <%
  }
   %>
   </table>
  </body>
</html>
