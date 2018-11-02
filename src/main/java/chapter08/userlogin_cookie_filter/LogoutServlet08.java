package chapter08.userlogin_cookie_filter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LogoutServlet08",urlPatterns = {"/chapter08/userlogin_cookie_filter/LogoutServlet08"})
public class LogoutServlet08 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //移除session中的user对象

        request.getSession().removeAttribute("user");

        //将autologin设置为没有username和pwd的cookie对象
        Cookie cookie = new Cookie("autologin", "invalidate");
        cookie.setPath(request.getContextPath());
        cookie.setMaxAge(0);
        response.addCookie(cookie);
        //如果本页面被autologinFilter过滤将无法退出，因为request中的cookie还没有擦除，autologinfilter又会转到此页面
        response.sendRedirect("login.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
