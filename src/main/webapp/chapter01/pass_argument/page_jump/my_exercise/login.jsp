<%@ page contentType="text/html;charset=GBK" %>
<HTML>
	<BODY>
<script language="javascript">
function check()
{
    if (my.T1.value=="") 
    { 
         alert("�û�������Ϊ��"); 
          my.T1.focus();
         return false; 
      } 
      if (my.T2.value=="") 
      { 
          alert("���벻��Ϊ��"); 
          my.T2.focus();
          return false; 
      } 
      my.submit();    
}
</script>
<div align="center">
    <form method="post" action="login.jsp"�� name="my">
	�������û�����<input type="text" name="T1" size="20"><br>
          ������������:<input type="password" name="T2" size="20"><br>
	<input type="button" value="�ύ" name="B1" onclick="check()">
	<input type="reset" value="����" name="B2">
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
     alert("�Բ���������û����������������룡");
     </script>
     <% 
       }
} %>
	</BODY>
</HTML>


