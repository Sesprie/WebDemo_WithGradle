package chapter05.file;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

@WebServlet(name = "ReadProperties", urlPatterns = "/chapter05/file/ReadProperties")
public class ReadProperties extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        ServletContext context = request.getServletContext();
        PrintWriter out = response.getWriter();

        //项目运行后，src目录下的文件会被发布到该项目的WEB-INF/classes的文件夹下
        //D:\software_workspace\JetBrains\WorkSpace\Idea_U\myExercise\WebDemo\out\artifacts\WebDemo_war_exploded\1.properties (系统找不到指定的文件。)
        //String path = context.getRealPath("1.properties");//这样写系统会提示找不到文件
        //而web目录下的文件会被直接发布到该项目的根目录内
        //D:\software_workspace\JetBrains\WorkSpace\Idea_U\myExercise\WebDemo\out\artifacts\WebDemo_war_exploded\



        String path = context.getRealPath("/WEB-INF/classes/chapter05/file/1.properties");
        FileInputStream fis = new FileInputStream(path);

        //可以用context.getResourceAsStream直接获取流
        //InputStream fis = context.getResourceAsStream("/WEB-INF/classes/chapter05/file/1.properties");


        Properties pros = new Properties();     //properties文件要一行一个键值对，类似username=12345
        pros.load(fis);
        out.print("username: " + pros.getProperty("username") + "<br>");
        out.print("pwd: " + pros.getProperty("pwd") + "<br>");
        out.print("读取自: " + path +"<br>");
        out.print("\\WEB-INF\\classes\\chapter05\\file\\1.properties是相对于当前项目的路径");


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
