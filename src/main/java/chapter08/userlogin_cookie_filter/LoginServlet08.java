package chapter08.userlogin_cookie_filter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet08", urlPatterns = {"/chapter08/userlogin_cookie_filter/LoginServlet08"})
public class LoginServlet08 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //1.获取用户名密码
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //2.检查用户名密码是否正确，正确就将用户信息加入session域
        if("admin".equals(username) && "admin".equals(password)){
            User user = new User(username, password);
            HttpSession session = request.getSession();
            //session可以存放任何object对象，request中只能存string
            session.setAttribute("user", user);
            //3.检查cookie是否为空，并在response中设置cookie
            String autoLogin = request.getParameter("autologin");
            if(autoLogin != null){
                Cookie cookie = new Cookie("autologin", username+"-" +password);
                cookie.setMaxAge(Integer.parseInt(autoLogin));
                cookie.setPath(request.getContextPath());
                System.out.println("cookie域:" + request.getContextPath());
                response.addCookie(cookie);
            }
            //4.跳转至首页
            response.sendRedirect("index.jsp");
        }else{
            request.setAttribute("errorMsg", "用户名或密码错误");
            //路径什么都不加表示当前文件所在的目录，如果加上/表示网站根目录
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

