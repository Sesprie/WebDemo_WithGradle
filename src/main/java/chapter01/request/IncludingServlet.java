package chapter01.request;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name="IncludingServlet",urlPatterns = {"/chapter01/request/IncludingServlet"})
public class IncludingServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter writer = resp.getWriter();
        writer.print("req.getRequestURI(): " + req.getRequestURI() + "<br>");
        writer.print("上为IncludingServlet的输出（包括本条输出），下为IncluedServlet的输出<br>");
        RequestDispatcher dispatcher = req.getRequestDispatcher("/chapter01/request/IncluedServlet");
        req.setAttribute("message", "message from IncludingServlet 中文参数测试");
        dispatcher.include(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
