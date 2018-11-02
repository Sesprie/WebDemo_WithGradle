<%@ page contentType="text/html;charset=GBK" %>
<%
String str=((String)session.getAttribute("p"));
if (str=="1")
{
out.println("hello,nihao");
}
else
{
response.sendRedirect("login.jsp");
}
%>
<a href="logout.jsp">อหณ๖ฯตอณ</a>
