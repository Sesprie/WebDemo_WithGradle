<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品预览</title>
</head>
<body>
<table width="600px">
<tr align="center">
<td>商品表编号</td>
<td>商品名称</td>
<td>商品描述</td>
<td>商品价格</td>
<td>我要购买</td>
<td>查看购物车</td>

</tr>

<%


Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/shop","root","root");
Statement statement = conn.createStatement();
ResultSet rs = statement.executeQuery("select * from goods");
boolean once = true;
while(rs.next()){
	out.print("<tr align='center'>");
	out.print("<td>" + rs.getString("id") + "</td>");
	out.print("<td>" + rs.getString("name") +"</td>");
	out.print("<td>" + rs.getString("description") + "</td>");
	out.print("<td>" + rs.getString("price") + "</td>");
	out.print("<td><a href=add_to_cart.jsp?id=" + rs.getString("id")+">购买</a></td>");
	if(once){
		out.print("<th rowspan='4'><a href=cart.jsp>查看购物车</a></th>");
		once = false;
	}
	out.print("</tr>");
}

%>







</table>
</body>
</html>