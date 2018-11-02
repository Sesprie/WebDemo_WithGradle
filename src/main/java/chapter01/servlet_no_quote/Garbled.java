package chapter01.servlet_no_quote;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name="Garbled",urlPatterns = {"/GarbledTest"})
public class Garbled extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        /**
         * resp.setContentType("test/html;charset=utf-8")
         * 等同于
         * resp.setCharacterEncoding("utf-8"); //设置HttpServletResponse使用utf-8的编码方式
         * resp.setHeader("Content-Type","text/html;charset=utf-8");  //通知浏览器使用utf-8编码
         */
        PrintWriter writer = resp.getWriter();
        writer.print("中文测试");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
