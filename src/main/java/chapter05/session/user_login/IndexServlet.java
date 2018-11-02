package chapter05.session.user_login;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "IndexServlet", urlPatterns = {"/chapter05/session/user_login/IndexServlet"})
public class IndexServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.getWriter().print("你还没有登录!请<a href='/chapter05/session/user_login/login.html'>登录</a>");
        } else {
            response.getWriter().print("登录成功! welcome, " + user.getUsername());
            response.getWriter().print("<br><a href='/chapter05/session/user_login/LogoutServlet'>退出</a>");

            Cookie cookie = new Cookie("JSESSIONUID", session.getId());
            cookie.setMaxAge(60 * 60);
            cookie.setPath("/chapter05");
            response.addCookie(cookie);
        }

    }
}
