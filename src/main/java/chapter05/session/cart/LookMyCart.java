package chapter05.session.cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


@WebServlet(name="LookMyCart", urlPatterns = {"/chapter05/session/cart/LookMyCart"})
public class LookMyCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        boolean purFlag = true;
        PrintWriter writer = resp.getWriter();
        HttpSession session = req.getSession();
        List<Book> cart = null;
        if(session == null){
            purFlag = false;
        }else{
            cart = (List) session.getAttribute("cart");

            if(cart == null)
                purFlag = false;
        }
        if(purFlag){
            writer.print("您购买的图书有:<br>");
            for(Book book:cart){
                writer.print(book.getName() + "<br />");
            }
        }else{
            writer.print("你没有购买任何图书。");
        }
    }
}
