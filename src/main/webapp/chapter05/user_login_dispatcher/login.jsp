<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2018/10/18
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UserLoginDispatcher</title>
</head>
<body>
<form action="/chapter05/user_login_dispatcher/UserLoginServlet" method="post">
    用户名:<input type="text" name="username"/>
    密码:<input type="password" name="pwd"/>
    <input type="submit" value="提交"/>


</form>
<%
    String info = (String) request.getAttribute("info");
    if(info != null){
        out.print(info);
    }
%>
</body>
</html>
