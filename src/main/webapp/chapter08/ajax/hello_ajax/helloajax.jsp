<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2018/11/13
  Time: 22:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ajax</title>

    <script type="text/javascript">
        window.onload = function() {
            document.getElementsByTagName("a")[0].onclick = function(){
                //1.创建XMLHttpRequest对象
                var xmlHttprequest = new  XMLHttpRequest();
                //2.打开连接
                xmlHttprequest.open("GET", this.href + "?=" + new Date());//关于this，看这里https://zhuanlan.zhihu.com/p/23804247，这里的时间戳保证每次的url都不一样，从而起到禁用缓存的效果；再则注意这里的Date()对象跟java对象不同
                //3.发送请求
                xmlHttprequest.send(null);
                // xmlHttprequest.open("POST",this.href+"?time="+new Date());
                // xmlHttprequest.setRequestHeader("ContentType","application/x-www-form-urlencoded");//Header的设置必须在open之后
                // xmlHttprequest.send("name='test'");

                //4.监听响应状态
                xmlHttprequest.onreadystatechange = function(){//如果这里调用函数，则直接写函数名，不用带括号
                    // alert(xmlHttprequest.readyState);
                    //4代表响应成功
                    if(xmlHttprequest.readyState == 4 && (xmlHttprequest.status == 200 || xmlHttprequest.status == 304)){
                        alert(xmlHttprequest.responseText);
                    }
                }

                return false;//不让a连接的请求走下去
            }
        }
    </script>


</head>
<body>
<a href="helloajax.txt">hello,ajax</a>
</body>
</html>
