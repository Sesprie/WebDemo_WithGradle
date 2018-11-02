package chapter05.cookie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * urlPatterns要以/开始否则报错，且报错不易查找
 */
@WebServlet(name="LastAccessServlet", urlPatterns = {"/chapter05/cookie/LastAccessServlet"})
public class LastAccessServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置返回内容的编码方式
        resp.setContentType("text/html; charset=utf-8");
        String lastAccessTime = null;
        //获取cookie数组
        Cookie[] cookies = req.getCookies();
        //遍历数组取出lastAccess属性值对应的值
        for(int i = 0; cookies != null && i < cookies.length; i++){
            if("lastAccess".equals(cookies[i].getName())){
                lastAccessTime = cookies[i].getValue();
                break;
            }
        }
        //判断lastAccess是否为空
        if(lastAccessTime == null){
            resp.getWriter().print("你是首次访问本站");
        }else{
            resp.getWriter().print("你上次访问本站的时间是:" + lastAccessTime);
        }


        String currentTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());
        //以当前时间创建cookie并返回
        Cookie cookie = new Cookie("lastAccess",currentTime);
        //Max-Age的默认属性是-1，即关闭浏览器就会删除这个对象，这里设置Max-Age为10秒
        cookie.setMaxAge(10);

        resp.addCookie(cookie);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
