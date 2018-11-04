package chapter08.listener_test;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


@javax.servlet.annotation.WebListener()
public class MyListener implements ServletContextListener,
        HttpSessionListener, ServletRequestListener {

    public MyListener() {
    }
    public void contextInitialized(ServletContextEvent sce) {
      System.out.println("context对象被创建");
    }

    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("context对象被销毁");
    }



    /*==============================================================================================*/



    @Override
    public void requestInitialized(ServletRequestEvent sre) {

        System.out.println("request对象被创建");
    }
    @Override
    public void requestDestroyed(ServletRequestEvent sre) {

        System.out.println("request对象被销毁");
    }

    /*==============================================================================================*/



    public void sessionCreated(HttpSessionEvent se) {
        /* Session is created. */
        System.out.println("session对象被创建");
    }

    public void sessionDestroyed(HttpSessionEvent se) {
        /* Session is destroyed. */
        System.out.println("session对象被销毁");
    }





}
