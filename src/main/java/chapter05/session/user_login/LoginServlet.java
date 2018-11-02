package chapter05.session.user_login;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/chapter05/session/user_login/LoginServlet"})
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String username = request.getParameter("username");
        String pwd = request.getParameter("pwd");
        String correct_code = (String) request.getSession().getAttribute("correct_code");
        String user_code = request.getParameter("code");

        //这里判断不能两个String对象使用==或者!=来判断，但java源程序里面可以
        if(!user_code.equals(correct_code)){
            response.getWriter().print("验证码错误");
        }else{
            if("admin".equals(username) && "admin".equals(pwd)){
                User user = new User(username,pwd);
                request.getSession().setAttribute("user",user);
                response.sendRedirect("/chapter05/session/user_login/IndexServlet");

            }else{
                response.getWriter().print("用户名或密码错误");
            }
        }
   }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
