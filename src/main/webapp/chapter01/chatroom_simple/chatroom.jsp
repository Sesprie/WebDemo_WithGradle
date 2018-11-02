<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>聊天室</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String yourname = request.getParameter("nick");
    if(yourname != null){
        //将姓名存入session，一边后面的请求会话中获取
        session.setAttribute("yourname",yourname);
    }
    //本次没有说话则不操作
    String mywords = request.getParameter("mywords");
    if(mywords != null){
        yourname = (String) session.getAttribute("yourname");
        mywords = yourname + ":" + mywords;
        //获取到目前为止所有人发送的消息
        String allwords = (String) application.getAttribute("allwords");
        if(allwords != null){
            mywords = allwords + "<br>" + mywords;//将我本次发送的消息加入到总消息
        }
        //保存所有的消息，共享
        application.setAttribute("allwords",mywords);
        out.print(mywords);

    }
%>
<form action="chatroom.jsp" method="post">
    <input type="text" name="mywords"/>
    <input type="submit" value="submit"/>

</form>
</body>
</html>
