<%@ page language="java" errorPage="errorPage.jsp" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 
contentType这个属性用来设定传回网页的文件格式和编码方式，一般使用 “text/html;charset=GBK”。
isThreadSafe 定义JSP容器执行JSP程序的方式，默认值为“true”，代表JSP容器会以多线程方式运行JSP页面。当设定值为“false”时，JSP容器会以单线程方式运行JSP页面。
session定义当前JSP页面中是否要用到session，默认值为“true”。
 -->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

	<%
		int dividend = 0;
		int divisor = 0;
		int result = 0;
		try {
			result = dividend / divisor;
		} catch (ArithmeticException zz) {
			throw new ArithmeticException("除数不能为0！");//由于IE内核的某些特性不支持，使用chrome内核的或者其他的新版ie才能看见效果
		}
	%>
</body>
</html>