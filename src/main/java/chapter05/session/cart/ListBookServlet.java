package chapter05.session.cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

@WebServlet(name="ListBookServlet", urlPatterns = {"/chapter05/session/cart/ListBookServlet"})
public class ListBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter writer = resp.getWriter();
        writer.print("提供的图书有：<br>");
        Collection<Book> books = BookDB.getAll();
        for(Book book:books){
            String url = "/chapter05/session/cart/PurchaseServlet?id=" + book.getId();
            //理应新的url里面应该包含session，但在这里没有！！即使不加上encodeRedirectURL，阻止cookie，同样可以使用，貌似浏览器阻止cookie没有效果
//            String newUrl = resp.encodeRedirectURL(url);
            writer.write(book.getName() + "&nbsp;&nbsp;&nbsp;<a href='" + url + "'>点击购买</a><br>");
        }
        writer.write("<a href='/chapter05/session/cart/LookMyCart'>查看购物车</a>");
    }

}
