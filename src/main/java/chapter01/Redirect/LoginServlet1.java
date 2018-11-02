package chapter01.Redirect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="LoginServlet1", urlPatterns = {"/chapter01/servlet_no_quote/LoginServlet1"})
public class LoginServlet1 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        String username = req.getParameter("username");
        String pwd = req.getParameter("pwd");
        /*if("admin".equals(username) && "admin".equals(pwd)){
            resp.sendRedirect("/chapter01/Redirect/success.html");
        }else {
            resp.getWriter().print("用户名或密码输入错误, 2秒后跳转到登录页面");
            resp.setHeader("Refresh", "2;URL=/chapter01/Redirect/login.jsp");
        //resp.sendRedirect("/chapter01/Redirect/login.jsp");
        }*/
        if(username.equals("admin") && pwd.equals("admin")){
            resp.sendRedirect("/chapter01/Redirect/success.html");
        }else {
            resp.getWriter().print("用户名或密码输入错误, 2秒后跳转到登录页面");
            resp.setHeader("Refresh", "2;URL=/chapter01/Redirect/login.jsp");
            //resp.sendRedirect("/chapter01/Redirect/login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
