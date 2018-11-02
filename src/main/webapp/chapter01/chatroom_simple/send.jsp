<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2018/10/10
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script>
    window.onload = function(){
        function $(id){ return document.getElementById(id);}

        $("select").onmouseover = function(){
            this.select();//鼠标经过选择表单内容
        }
    }
</script>
<head>
    <title>聊天室入口</title>
</head>
<body>
<form action="chatroom.jsp" method="post">
    <input type="text" name="nick"/>
    <input type="submit" name="submit" value="submit"/>

</form>
</body>
</html>
