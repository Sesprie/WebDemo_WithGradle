<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2018/10/31
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <title></title>
</head>
<body>
<br/>
<%--<%
    request.getSession().setAttribute("username", null);
%>--%>
<c:choose>
    <c:when test="${sessionScope.user.username==null}">
        <h3 style="text-align: center;color:red;">登录失败</h3>
        <a href="${pageContext.request.contextPath}/chapter08/userlogin_cookie_filter/login.jsp">用户登录</a>
    </c:when>

    <c:otherwise>
        <h3 style="text-align: center;color:chartreuse;">登录成功</h3>
        欢迎, ${sessionScope.user.username}!
        <a href="${pageContext.request.contextPath}/chapter08/userlogin_cookie_filter/LogoutServlet08">注销</a>
    </c:otherwise>

</c:choose>
<hr style="color: #608ac1;"/>
</body>
</html>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
<title>Tag Example</title>
    </head>

    <body>
    <c:set var = "salary" scope = "session" value = "${2000*2}"/>
    <p>Your salary is : <c:out value = "${salary}"/></p>
    <c:choose>

        <c:when test = "${salary <= 0}">
            Salary is very low to survive.
        </c:when>

        <c:when test = "${salary > 1000}">
            Salary is very good.
        </c:when>

        <c:otherwise>
            No comment sir...
        </c:otherwise>
    </c:choose>

    </body>
    </html>--%>
<%--
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>c:choose 标签实例</title>
</head>
<body>
<c:set var="salary" scope="session" value="${2000*2}"/>
<p>你的工资为 : <c:out value="${salary}"/></p>
<c:choose>
    <c:when test="${salary <= 0}">
        太惨了。
    </c:when>
    <c:when test="${salary > 1000}">
        不错的薪水，还能生活。
    </c:when>
    <c:otherwise>
        什么都没有。
    </c:otherwise>
</c:choose>
</body>
</html>--%>
