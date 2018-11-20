package chapter08.listener_test;

import javax.servlet.*;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.HttpSessionBindingEvent;

@WebListener()
public class MyAttributeListener implements ServletContextAttributeListener,
        ServletRequestAttributeListener, HttpSessionAttributeListener {

    @Override
    public void attributeAdded(ServletContextAttributeEvent event) {
        String name = event.getName();
        System.out.println("ServletContext 添加属性:" + name + "=" + event.getServletContext().getAttribute(name));
    }

    @Override
    public void attributeRemoved(ServletContextAttributeEvent event) {
        String name = event.getName();
        System.out.println("ServletContext 移除属性:" + name);
    }

    @Override
    public void attributeReplaced(ServletContextAttributeEvent event) {
        String name = event.getName();
        System.out.println("ServletContext 替换属性:" + name + "=" + event.getServletContext().getAttribute(name));

    }










    @Override
    public void attributeAdded(ServletRequestAttributeEvent srae) {
        String name = srae.getName();
        System.out.println("ServletRequest 添加属性:" + name + "=" + srae.getServletRequest().getAttribute(name));

    }

    @Override
    public void attributeRemoved(ServletRequestAttributeEvent srae) {
        String name = srae.getName();
        System.out.println("ServletRequest 移除属性:" + name);

    }

    @Override
    public void attributeReplaced(ServletRequestAttributeEvent srae) {
        String name = srae.getName();
        System.out.println("ServletRequest 替换属性:" + name + "=" + srae.getServletRequest().getAttribute(name));

    }













    @Override
    public void attributeAdded(HttpSessionBindingEvent event) {
        String name = event.getName();
        System.out.println("HttpSession 添加属性:" + name + "=" + event.getSession().getAttribute(name));

    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent event) {
        String name = event.getName();
        System.out.println("HttpSession 移除属性:" + name);

    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent event) {
        String name = event.getName();
        System.out.println("HttpSession 替换属性:" + name + "=" + event.getSession().getAttribute(name));

    }
}
