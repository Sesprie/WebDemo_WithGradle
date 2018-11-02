<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2018/10/13
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>

<form action="/chapter01/servlet_no_quote/LoginServlet" method="GET">
    <%--<form action="loginRedirect.jsp" method="GET">--%>

    用户名:<input type="text" name="username"/><br>
    密&nbsp;&nbsp;&nbsp;码:<input type="password" name="pwd"/><br>
    <input type="submit" value="提交"/>
<p>用户名密码均为admin</p>
</form>

</body>
</html>
