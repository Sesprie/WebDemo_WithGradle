<%@page import="chapter01.shopping.Product"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page import="java.util.ArrayList" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/shop","root","root");
Statement statement = conn.createStatement();
ResultSet rs = statement.executeQuery("select * from shop where id='"+id+"'");
ArrayList<Product> list = (ArrayList) session.getAttribute("list");
int n = 0;
rs.next();
if(list == null){
	Product p = new Product();
	p.setId(rs.getString("id"));
	p.setName(rs.getString("name"));
	p.setDescription(rs.getString("description"));
	p.setPrice(rs.getDouble("price"));
	p.setNumber(1);
	list.add(p);
}else{
	Product p1 = new Product();
	int i = 0;
	for(i = 0; i < list.size();i++){
		p1 = (Product) list.get(i);
		if(p1.getId() == rs.getString("id")){
			p1.setNumber(p1.getNumber() + 1);

			list.set(i,p1);
			break;
		}
		
	}
	if(i == list.size()){

		Product p = new Product();
		p.setId(rs.getString("id"));
		p.setName(rs.getString("name"));
		p.setDescription(rs.getString("description"));
		p.setPrice(rs.getDouble("price"));
		p.setNumber(1);
		list.add(p);
	}
	System.out.println(list.get(Integer.parseInt(rs.getString("id"))));
}
session.setAttribute("list", list);
response.sendRedirect("show.jsp");

%>
</body>
</html>