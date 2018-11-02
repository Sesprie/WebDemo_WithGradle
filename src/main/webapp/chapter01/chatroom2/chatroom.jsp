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
String yourname = request.getParameter("nick");
if(yourname != null){
	session.setAttribute("yourname", yourname);
}
String mywords = request.getParameter("mywords");

if(mywords != null){
	System.out.println(mywords);
	yourname = (String) session.getAttribute("yourname");
	mywords = yourname + ": " + mywords;
	String allWords = (String) application.getAttribute("mywords");
	if(allWords != null){
		mywords = allWords + "<br>" + mywords;
		System.out.println(mywords);
	}

	application.setAttribute("mywords", mywords);
	out.print(mywords);
	
}
%>

<form action="chatroom.jsp" method="post">
<input type="text" size="30" name="mywords"/>
<input type="submit" name="submit" value="submit"/>

</form>
</body>
</html>