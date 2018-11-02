<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String user=request.getParameter("user");
Cookie cookie = new Cookie("user", user+"#"+new Date().toLocaleString());
cookie.setMaxAge(60*60*24*30);
response.addCookie(cookie);
response.sendRedirect("cookie.jsp");


%>
</body>
</html>