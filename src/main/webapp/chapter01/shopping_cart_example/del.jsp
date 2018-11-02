<%@ page language="java" import="java.util.*,chapter01.shopping_cart.example.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'buy.jsp' starting page</title>
    
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
    <%
   
     String id=request.getParameter("id");
     ArrayList <Product> list =(ArrayList)session.getAttribute("list");
     for(int i=0;i<list.size();i++)
     {
     if (list.get(i).getId().equals(id))
     {
     list.remove(i);
     break;
     }
     }    	    
     session.setAttribute("list",list);     
     response.sendRedirect("look.jsp");
     %>
  </body>
</html>
