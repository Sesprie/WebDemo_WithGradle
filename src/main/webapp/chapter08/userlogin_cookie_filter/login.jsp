<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2018/10/31
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body style="text-align: center;">
    <h3 style="text-align: center;">用户登录</h3>
    <form action="${pageContext.request.contextPath}/chapter08/userlogin_cookie_filter/LoginServlet08" method="post">

        <table border="1" width="600px" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td height="30" align="center">用户名:</td>
                <td>&nbsp;&nbsp;<input type="text" name="username"/><span style="color:red;">${errorMsg}</span></td>
            </tr>

            <tr>
                <td height="30" align="center">密码:</td>
                <td>&nbsp;&nbsp;<input type="password" name="password"/></td>
            </tr>

            <tr>
                <td height="35" align="center">记住多久:</td>
                <td>
                    <input type="radio" name="autologin" value="${60*60*24*31}"/>一个月
                    <input type="radio" name="autologin" value="${60*60*24*31*3}"/>三个月
                    <input type="radio" name="autologin" value="${60*60*24*31*6}"/>半年
                    <input type="radio" name="autologin" value="${60*60*24*31*12}"/>一年

                </td>
            </tr>

            <tr>
                <%-- colspan="2" 横跨两列 --%>
                <td height="30" colspan="2" align="center">
                    <input type="submit" value="登录"/>&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="重置"/>
                </td>
            </tr>

        </table>
    </form>
</body>
</html>
