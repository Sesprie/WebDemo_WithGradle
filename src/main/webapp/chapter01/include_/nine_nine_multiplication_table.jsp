<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<img src="src/duola1.jpg"/>
<br>
<%

for(int i = 1; i < 10; i++){
	for (int j = 1; j <= i; j++){
		out.print(j + "*" + i + "=" + i*j + "&nbsp;");
	}
	out.println("<br>");
}

%>
</body>
</html>