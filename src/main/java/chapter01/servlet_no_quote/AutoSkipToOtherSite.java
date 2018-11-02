package chapter01.servlet_no_quote;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 实现自动跳转
 */
@WebServlet(name = "AutoSkipToOtherSite",urlPatterns = {"/AutoSkipToOtherSite"})
    public class AutoSkipToOtherSite extends HttpServlet {
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request,response);
        }

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter writer = response.getWriter();
            writer.print("2秒后跳转到baidu");
            response.setHeader("Refresh","2;URL=https://www.baidu.com");

        }
}
