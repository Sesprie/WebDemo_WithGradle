<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
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
String name= request.getParameter("USERNAME");
String pwd = request.getParameter("USERPWD");
String blood = request.getParameter("BLOOD");
String sex = request.getParameter("SEX");
String memo = request.getParameter("MEMO");
String city = request.getParameter("CITY");
String[] character = request.getParameterValues("CHATACTER");


out.println("姓名:" + name + "<br/>");
out.println("密码:" + pwd + "<br/>");
out.println("血型:" + blood + "<br/>");
out.println("性别:" + sex + "<br/>");
out.println("简介:" + memo + "<br/>");
out.println("城市:" + city + "<br/>");
out.println("爱好:");
String str = "";
for(int i = 0; i<character.length; i++){
	str += character[i];
}
out.println(str);
%>
</body>
</html>