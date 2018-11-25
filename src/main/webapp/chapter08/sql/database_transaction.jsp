<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2018/11/25
  Time: 13:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据库事务</title>
</head>
<body>
<%
    //新版mysql需要加上serverTimezone参数
    String sql_url = "jdbc:mysql://localhost:3306/students?serverTimezone=GMT%2B8&user=root&password=root&useUnicode=true&characterEncoding=utf-8";
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn;
    Statement stmt = null;
    conn = DriverManager.getConnection(sql_url);
    conn.setAutoCommit(false);//禁用自动提交
    try{

        stmt = conn.createStatement();


        String sql = "insert into stu values('11','吕布','10086')";
        stmt.execute(sql);
        //此处为了测试需要数据库的键值唯一且此时存在1这个键值
        String sql_1 = "insert into stu values('1','曹操','1008611')";
        stmt.execute(sql_1);
        conn.commit();//手动一起提交，只有提交了才有效，哪怕前面做再多的事情，这里没有提交等于0，如果要是这里有很多内容需要提交，是一个耗时操作，而此时停电了呢？
        conn.setAutoCommit(true);
        out.print("执行成功");

    }catch (Exception e){
        //有异常执行回滚操作
        conn.rollback();
        out.print("执行失败，已执行回滚操作!");
        System.out.print(e.getMessage());

    }finally {
        conn.close();
        stmt.close();
    }



%>




</body>
</html>
