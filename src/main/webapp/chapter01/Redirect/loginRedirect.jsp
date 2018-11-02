<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2018/10/13
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LoginRedirect</title>
</head>
<body>
<%
    response.setContentType("text/html;charset=utf-8");
    String username = request.getParameter("username");
    String pwd = request.getParameter("pwd");
//    if(username!=null && pwd!=null){
//
//    }
    //使用username.equals("admin")的时候与"admin".equals(username)不同，可能需要判断username和pwd不为空
    if(username.equals("admin") && pwd.equals("admin")){
        response.sendRedirect("/chapter01/Redirect/success.html");
    }else {
        response.getWriter().print("用户名或密码输入错误, 2秒后跳转到登录页面");
        response.setHeader("Refresh", "2;URL=/chapter01/Redirect/login.jsp");
//            response.sendRedirect("/chapter01/Redirect/login.jsp");
    }
%>
</body>
</html>
