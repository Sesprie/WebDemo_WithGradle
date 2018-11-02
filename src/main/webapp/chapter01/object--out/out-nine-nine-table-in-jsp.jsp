<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2018/10/10
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>输出九九乘法表</title>
</head>
<body>
<!--
在jsp中直接输出九九乘法表
-->
<%
    for(int i = 1; i < 10 ; i++){
        for(int j = 1; j < i+1; j++){
            out.print(j+"*"+i+"="+i*j+"&nbsp;");
        }
        out.print("<br>");
    }
%>
</body>
</html>
