package chapter08.userlogin_cookie_filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "AutoLoginFilter",urlPatterns = {"/chapter08/userlogin_cookie_filter/*"})
public class AutoLoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //1.获取cookie，验证用户名密码，确认是否放行
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        Cookie[] cookies = request.getCookies();
        String autoLogin = null;
        for(int i = 0; cookies!= null && i < cookies.length; i++){
            if("autologin".equals(cookies[i].getName())){
                autoLogin = cookies[i].getValue();
                break;
            }
        }
        if(autoLogin != null){
            String [] parts = autoLogin.split("-");
            String username = parts[0];
            String password = parts[1];

            System.out.println(username);
            System.out.println(password);
            if("admin".equals(username) && "admin".equals(password)){
                User user = new User(username, password);
                request.getSession().setAttribute("user", user);

            }
//            response.sendRedirect("index.jsp");
//            request.getRequestDispatcher("index.jsp").forward(request,response);
        }
        chain.doFilter(request,response);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
