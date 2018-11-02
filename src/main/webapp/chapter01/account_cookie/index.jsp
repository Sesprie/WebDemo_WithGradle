<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
  request.setCharacterEncoding("gbk");
  String  user=request.getParameter("user");
  String  tijiao=request.getParameter("tj");
  String  pass=request.getParameter("password");
  String  chk=request.getParameter("chk");
  Cookie cookies[] =request.getCookies();
  String zh="";
  if(cookies !=null)
  {
	  for(int i=0;i<cookies.length;i++)
	  {
		  if(cookies[i].getName().equals("Name"));
		  zh=cookies[i].getValue();		  
	  }
  }


if(tijiao !=null){
	if(chk != null){
		Cookie c= new Cookie("Name",user);
		c.setMaxAge(1000);
		response.addCookie(c);
		
	}
	if((user != null && user.equals("sunli")) &&(pass != null && pass.equals("7204"))){
		session.setAttribute("p","1");
		session.setAttribute("nam", user);
		response.sendRedirect("success.jsp");
		
	}else{
		out.print("<script>alert('对不起账号或密码不正确，请重新登录')</script>");
	}
}

%>


<form action="index.jsp" method="post">
账号：<input type=test name="user" value="<%=zh %>"/>
<input type=checkbox name="chk">是否记住密码<br/>
密码：<input type=password name="password"/><br>
<input type="submit" name="tj" value="提交">
</form>


</body>
</html>