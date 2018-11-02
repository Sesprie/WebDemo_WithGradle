package chapter05.session.user_login;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

@WebServlet(name = "CheckServlet", urlPatterns = {"/chapter05/session/user_login/CheckServlet"})
public class CheckServlet extends HttpServlet {
    public static final int WIDTH = 60;
    public static final int HEIGHT = 20;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("image/jpeg");
        ServletOutputStream sos = resp.getOutputStream();   //resp返回信息由两种方式，一种字节流resp.getOutputStream，一种字符串
        HttpSession session = req.getSession();
        char[] rands = generateCheckCode();
        System.out.println("验证码: " + new String(rands));
        session.setAttribute("correct_code", new String(rands));
        BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();
        ByteArrayOutputStream bos = new ByteArrayOutputStream();

        drawBackground(g);
        drawRands(g, rands);
        g.dispose();    //结束绘制

//        ImageIO.write(image,"PNG",new FileOutputStream("./captcha.png"));


        ImageIO.write(image, "PNG", bos);//格式不要写错，否则无法显示图片
        byte[] buffer = bos.toByteArray();
        resp.setContentLength(buffer.length);
        sos.write(buffer);
        sos.close();
        bos.close();
    }


    //返回一个随机生成的验证码字符数组
    private static char[] generateCheckCode() {
        String chars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        char[] rands = new char[4];
        for (int i = 0; i < 4; i++) {
            int rand = (int) (Math.random() * 62);
            rands[i] = chars.charAt(rand);
        }
        return rands;
    }

    private static void drawRands(Graphics g, char[] rands) {
        g.setColor(Color.BLACK);
        g.setFont(new Font(null, Font.ITALIC | Font.BOLD, 18));
        g.drawString("" + rands[0], 1, 17);
        g.drawString("" + rands[1], 16, 15);
        g.drawString("" + rands[2], 31, 18);
        g.drawString("" + rands[3], 46, 16);
    }

    //画矩形背景
    private static void drawBackground(Graphics g) {
        g.setColor(new Color(0xdcdcdc));
        g.fillRect(0, 0, WIDTH, HEIGHT);
        //产生一些随机的点
    }
}
