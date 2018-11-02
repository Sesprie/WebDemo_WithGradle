<%@ page contentType="text/html;charset=GBK" %>
<HTML>
	<BODY>
<script language="javascript">
function check()
{
    if (my.T1.value=="") 
    { 
         alert("用户名不能为空"); 
          my.T1.focus();
         return false; 
      } 
      if (my.T2.value=="") 
      { 
          alert("密码不能为空"); 
          my.T2.focus();
          return false; 
      } 
      my.submit();    
}
</script>
<div align="center">
    <form method="post" action="login.jsp"　 name="my">
	请输入用户名：<input type="text" name="T1" size="20"><br>
          请输入你密码:<input type="password" name="T2" size="20"><br>
	<input type="button" value="提交" name="B1" onclick="check()">
	<input type="reset" value="重置" name="B2">
	</form>
</div>
<%  
    request.setCharacterEncoding("gb2312"); 
    String name=request.getParameter("T1") ;
    String pass=request.getParameter("T2") ;
    if (name!=null && pass!=null)
    {
        if (name.equals("root") && pass.equals("root"))
        { 
        session.setAttribute("p", "1"); 
	    response.sendRedirect("success.jsp");
        }
         else
        {
       %>
     <script language="javascript">
     alert("对不起密码或用户名错误，请重新输入！");
     </script>
     <% 
       }
} %>
	</BODY>
</HTML>


