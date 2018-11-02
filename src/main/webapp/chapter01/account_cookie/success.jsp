<%@page import="sun.font.Script"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
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
  String pp=(String)session.getAttribute("p");
  if(pp!=null)
  {
	  out.print("欢迎"+(String)session.getAttribute("nam"));
  }
  else
  {
	  out.print("<script> alert(对不起，你没有登录，请返回!);windows.location.href='index.jsp'</script>");
  }
%>
<a href="quit.jsp">退出</a>
</body>
</html>