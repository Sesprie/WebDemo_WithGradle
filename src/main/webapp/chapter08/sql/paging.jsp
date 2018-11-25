<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2018/11/25
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>分页</title>
</head>
<body>


<table>
    <tbody>

    <%
/*每一次访问改页面都会访问查询数据库*/
        int pageSize = 5;
        int curPage = 1;
        int pageCount = 0;
        ResultSet rs;


        System.out.println("测试1");
        //新版mysql需要加上serverTimezone参数
        String sql_url = "jdbc:mysql://localhost:3306/students?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8";

        Connection conn = null;
        Statement stmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(sql_url, "root", "root");
            stmt = conn.createStatement();
            System.out.println("测试2");
            String sql = "select * from stu order by stu_sno desc;";
            rs = stmt.executeQuery(sql);
            rs.last();
            int size = rs.getRow();
            System.out.println("size:"+size);

            pageCount = size % pageSize == 0 ? size / pageSize : size / pageSize + 1;
            System.out.println("pageCount:"+pageCount);
            curPage = request.getParameter("curPage") == null ? 1 : Integer.parseInt(request.getParameter("curPage"));

            if (curPage < 1) {
                curPage = 1;
            } else if (curPage > pageCount) {
                curPage = pageCount;
            }

            rs.absolute((curPage-1) * pageSize + 1);
            for (int i = 0; i < pageSize; i++) {

                String sno = rs.getString(1);
                String name = rs.getString(2);
                String tel = rs.getString(3);
                rs.next();


    %>
    <tr>
        <td><%=sno%>
        </td>
        <td><%=name%>
        </td>
        <td><%=tel%>
        </td>
    </tr>

    <%
            }


        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if(conn!=null)
                conn.close();
            if(stmt!=null)
                stmt.close();
            }


    %>
    </tbody>
</table>
<%--EL表达式是用户获取Servlet域对象中存储的数据

而非代码中定义的变量

--%>
<a href="paging.jsp?curPage=1">第一页</a>
<a href="paging.jsp?curPage=<%=curPage>1?curPage-1:curPage%>">上一页</a>
<a href="paging.jsp?curPage=<%=curPage==pageCount?curPage:curPage+1%>">下一页</a>
<a href="paging.jsp?curPage=<%=pageCount%>">尾页</a>
第<%=curPage%>页/共<%=pageCount%>页

</body>
</html>
