package chapter05.session.cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name="PurchaseServlet", urlPatterns = {"/chapter05/session/cart/PurchaseServlet"})
public class PurchaseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html;charset=utf-8");
        String id = req.getParameter("id");
        if(id == null){
            resp.sendRedirect("/chapter05/session/cart/ListBookServlet");
            return ;
        }
        Book book = BookDB.getBook(id);

        //从用户那里获取session
        HttpSession session = req.getSession();
        //从session中获取cart对象
        List<Book> cart = (List) session.getAttribute("cart");
        if(cart == null){
            cart = new ArrayList<>();
            //将购物车存入session对象
            session.setAttribute("cart", cart);
        }
        //放入当前请求对应的商品
        cart.add(book);
        //创建cookie对应的session标识号
        Cookie cookie = new Cookie("JESSIONID", session.getId());
        cookie.setMaxAge(60*60);
        cookie.setPath("/chapter05");
        resp.addCookie(cookie);
        resp.getWriter().print("'<script> alert('添加成功'); </script>'");
        resp.sendRedirect("/chapter05/session/cart/ListBookServlet");


    }
}
