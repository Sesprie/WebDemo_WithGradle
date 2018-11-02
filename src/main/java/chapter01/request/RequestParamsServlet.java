package chapter01.request;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(name="RequestParamsServlet", urlPatterns = {"/chapter01/request/RequestParamsServlet"})
public class RequestParamsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决response的编码方式
        resp.setContentType("text/html;charset=utf-8");
        //解决从request中取参数的解码方式，只对post方式有效
        req.setCharacterEncoding("utf-8");
        //对get方式有效
        //new String(username.getBytes("iso8859-1"),"utf-8");//先编码iso8859-1，在解码为utf-8
        PrintWriter writer = resp.getWriter();

        String username = req.getParameter("username");
        String pwd = req.getParameter("pwd");
        String[] hobbies = req.getParameterValues("hobby");
        writer.println("用户名：" + username + "<br>");
        writer.println("密码：" + pwd + "<br>");
        writer.print("hobbies：");

        for(int i=0; i < hobbies.length; i++){
            writer.print(hobbies[i] + ",");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
