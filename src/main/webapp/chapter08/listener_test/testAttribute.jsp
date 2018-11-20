<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2018/11/4
  Time: 18:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>testAttribute</title>
</head>
<body style="text-align: center;">
<h3 style="color:red;">测试属性添加，替换，删除时，监听器的输出结果</h3>
<%
    application.setAttribute("username", "张三");
    application.setAttribute("username", "李四");
    application.removeAttribute("username");




    session.setAttribute("username", "张三");
    session.setAttribute("username", "李四");
    session.removeAttribute("username");




    request.setAttribute("username", "张三");
    request.setAttribute("username", "李四");
    request.removeAttribute("username");

%>
</body>
</html>
