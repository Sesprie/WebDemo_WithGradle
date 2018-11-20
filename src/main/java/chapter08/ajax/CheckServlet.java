package chapter08.ajax;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "Check",urlPatterns = {"/chapter08/ajax/CheckServlet"})
public class CheckServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getParameter("user_id");

        try{
            String user_id = request.getParameter("user_id");
            //8.0版本的驱动Driver的包改变了，但是com.mysql.jdbc.Driver仍可用
            Class.forName("com.mysql.cj.jdbc.Driver");
            //包Server Time Zone错误    https://blog.csdn.net/qq_15653601/article/details/79940090
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db01?serverTimezone=GMT%2B8","root","root");
            String sql = "select * from user where user_id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,user_id);
            ResultSet rs = statement.executeQuery();
            if(rs.next()){
                response.getWriter().print("true");
            }else{
                response.getWriter().print("false");
            }
        }catch (Exception e){
            e.printStackTrace();
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
