<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title></title>
</head>
<body>
<%
    String msg = (String) request.getAttribute("msg");
    if (msg == null) {
        msg = "";
    }
%>
<h1><%=msg%>
</h1>
<form action="Deal_Login.jsp" method="post" name="loginForm">
    <p align="center">用户名:<input type="text" name="username"/> <br/>
    <p align="center"><input type="submit" value="登录"/>
</form>
</body>
</html>
