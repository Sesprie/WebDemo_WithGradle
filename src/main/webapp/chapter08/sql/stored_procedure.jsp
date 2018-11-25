<%@ page import="java.sql.*" %>
<%@ page import="jdk.nashorn.internal.codegen.CompilerConstants" %>
<%@ page import="java.util.concurrent.Callable" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2018/11/25
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>调用数据库的存储过程(函数)</title>
</head>
<body>
<%
    //在mysql中新建students数据库，然后执行'运行sql文件'，导入数据，里面包含几个存储过程
    String isAdd = "false";
    try {
        isAdd = request.getParameter("isAdd");
    } catch (Exception e) {
        e.printStackTrace();
    }
    if (isAdd != null) {
        if (isAdd.equals("true")) {
            Connection conn = null;
            CallableStatement stmt = null;
            try {
                String id = request.getParameter("id");
                String name = request.getParameter("name");
                String tel = request.getParameter("tel");
                //mysql8.0连接时需要设置timezone
                String sql_url = "jdbc:mysql://localhost:3306/students?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf-8";
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(sql_url, "root", "root");
                //PreparedStatement CallableStatement Statement
                stmt = conn.prepareCall("{call adds(?,?,?,?)}");
                stmt.setString(1, id);
                stmt.setString(2, name);
                stmt.setString(3, tel);
                stmt.registerOutParameter(4, Types.VARCHAR);
                stmt.execute();
//            out.print(stmt.getObject(4));
                request.setAttribute("result", stmt.getObject(4));
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("result", "添加失败！");
                //可能是由于mysql的改动，高版本中发生异常时，无法取出输出参数，也可能是我的方式有问题，但是低版本中即使不作捕获，发生异常时也可以取回返回参数，查看stored_procedure2.jsp
//                request.setAttribute("result", stmt.getObject(4));
            } finally {


                stmt.close();
                conn.close();
            }
        }
    }


%>

<form action="stored_procedure.jsp?isAdd=true" method="post">
    id：<input type="text" name="id"><br>
    姓名：<input type="text" name="name"><br>
    电话：<input type="text" name="tel"><br>
    <input type="submit" value="提交">
</form>
${result}

</body>
</html>
<%--

navicat 12 定义存储过程，直接新建函数，选择过程，可以跳过向导（也可以选择in和out参数，只不过完成之后还是要添加类型的大小），直接写入下面的代码
第一行相当于函数定义，只不过这里的返回值也在参数里，其次IN和OUT声明参数和返回值
begin和end之间是方法体，再者每一个语句都要添加;

其中DEFINER=`root`@`localhost` 不是必要的

CREATE DEFINER=`root`@`localhost` PROCEDURE `adds2`(IN `sno` varchar(6),IN `sname` varchar(6),IN `tel` varchar(10),OUT `result` varchar(11))
BEGIN
	# if语句跟有then，有end if，而且，分号不能忘记
	insert into stu values(sno,sname,tel,result);
	IF(ROW_COUNT() > 0)then
	set result='添加成功';
	ELSE
	set result='添加失败';
	END IF;



END


--%>