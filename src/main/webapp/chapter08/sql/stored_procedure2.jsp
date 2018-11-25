<%@page import="java.sql.Types" %>
<%@page import="java.sql.CallableStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
</head>
<body>
<%
    //低版本中有键值重复异常时可以正常取回，即使即使不做捕获
    Class.forName("com.mysql.jdbc.Driver");
//除此之外需要更改数据库属性中的编码为utf-8或者gbk，保持一致
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/students?useUnicode=true&characterEncoding=utf-8", "root", "root");
    CallableStatement stmt = conn.prepareCall("{call adds(?,?,?,?)}");
    stmt.setString(1, "226");
    stmt.setString(2, "张1");
    stmt.setString(3, "10086");
    stmt.registerOutParameter(4, Types.VARCHAR);
    stmt.execute();
    out.print(stmt.getObject(4));
    stmt.close();
    conn.close();
%>


</body>
</html>