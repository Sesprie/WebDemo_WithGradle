package chapter01.request;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name="RequestForwardServlet", urlPatterns = {"/chapter01/request/RequestForwardServlet"})
public class RequestForwardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("message","这是RequestForwardServlet设置在request中的消息，丢给我(ResultServlet)处理，不要只看表面");
        resp.setContentType("text/html;charset=utf-8");
        RequestDispatcher dispatcher = req.getRequestDispatcher("/chapter01/request/ResultServlet");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
