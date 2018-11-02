package chapter01.request;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


/**
 * 发生编码错误分析
 * response使用iso8859-1-------》浏览器使用gb2312
 * 使用resp.setContentType("text/html;charset=utf-8")
 * 或者
 * resp.setCharacterEncoding("utf-8")//response响应使用utf-8编码传输
 * resp.setHeader("Content-Type","text/html;charset=utf-8");//通知浏览器该数据应该使用utf-8解码，F12抓包可以分析浏览器得到的响应头，可以看到有utf-8
 */

@WebServlet(name="DownManagerServlet", urlPatterns = {"/chapter01/request/DownManagerServlet"})
public class DownManagerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");

//        resp.setCharacterEncoding("utf-8");
//        resp.setHeader("Content-Type","text/html;charset=utf-8");

        String referer = req.getHeader("referer");
        String siteName = "http://" + req.getServerName();
        PrintWriter writer = resp.getWriter();
        if(referer != null && referer.startsWith(siteName)){
            writer.println("dealing downloading....");
            writer.println("<br>直接复制本页面网址，粘贴到浏览器其他标签会出现防盗链提示<br>必须在站内跳转到本页面才不会出现盗链提示");

        }else{
            writer.println("防盗链...");
            //盗链请求，指向提示页面
//            RequestDispatcher rd = req.getRequestDispatcher("/chapter01/request/illegalrequest.html");
//            rd.forward(req,resp);
        }
        writer.println("<br>当前使用传输编码为:" + resp.getCharacterEncoding());

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
