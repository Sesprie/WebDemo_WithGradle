package chapter05.user_login_dispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserLoginServlet", urlPatterns = "/chapter05/user_login_dispatcher/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //由于后面用到了response，需要设置编码，否则可能会中文乱码
        response.setContentType("text/html;charset=utf-8");
        //防止使用request.getParameter()时中文会乱码
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String pwd = request.getParameter("pwd");

        if("admin".equals(username) && "admin".equals(pwd)){
            request.setAttribute("username", username);
            request.setAttribute("info", "登录成功!");
            request.getRequestDispatcher("/chapter05/user_login_dispatcher/success.jsp").forward(request, response);
        }else{
            request.setAttribute("info", "用户名或密码错误!");
            request.getRequestDispatcher("/chapter05/user_login_dispatcher/login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
