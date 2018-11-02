<%@ page language="java" import="java.util.*,chapter01.shopping_cart.example.*,java.sql.*" pageEncoding="utf-8"%>
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
    Class.forName("com.mysql.jdbc.Driver");  
    Connection  con=DriverManager.getConnection("jdbc:mysql://localhost/shop","root","root");  
    Statement stmt= con.createStatement();
    ResultSet  rs=stmt.executeQuery("select * from goods where id='"+id+"'"); 
    ArrayList <Product> list =(ArrayList)session.getAttribute("list");
     int n=0;
     rs.next();
     if (list==null)
    {     Product p=new Product();
          list=new ArrayList<Product>();
          p.setId(rs.getString("id"));
          p.setName(rs.getString("name"));
          p.setDescription(rs.getString("description"));
          p.setPrice(rs.getDouble("price"));
          p.setNumber(1);
          list.add(p);
     }
    else
    {
       Product p1=new Product();
       for(int i=0;i<list.size();i++ )
       { 
       p1=(Product)list.get(i);
       if (p1.getId().equals(id))
       {
       
       p1.setNumber(p1.getNumber()+1);
       n++;
       list.set(i,p1);
       break;
       }  
      }
      if(n==0) 
      {   
    	  Product p2=new Product();
          p2.setId(rs.getString("id"));
          p2.setName(rs.getString("name"));
          p2.setDescription(rs.getString("description"));
          p2.setPrice(rs.getDouble("price"));
          p2.setNumber(1);
          list.add(p2);                       
      }  
  
    }
     session.setAttribute("list",list);     
     response.sendRedirect("show.jsp");
     %>
  </body>
</html>
