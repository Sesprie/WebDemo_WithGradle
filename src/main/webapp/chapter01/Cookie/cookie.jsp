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
Cookie cookies[] = request.getCookies();
String user="";
String date="";
if(cookies != null){
	for(int i = 0; i<cookies.length; i++){
		if(cookies[i].getName().equals("user")){
			user = cookies[i].getValue().split("#")[0];
			date = cookies[i].getValue().split("#")[1];
		}
	}
}
if("".equals(user) && "".equals(date)){
	
%>

<form action="deal.jsp" method="post">
用户名：<input name="user" type="text" value="">
<input type="submit" value="提交">
</form>

<%
}else{
	
%>
<%=user %>
<%=date %>
<%} %>





</body>
</html>