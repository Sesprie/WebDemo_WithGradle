<%@ page import="chapter01.static_method.Greeting" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>$Title$</title>
  <script type="text/javascript">
      //window.onload在html文档加载完成后执行,如果不写window.onload，直接定义函数，那么会出现找不到元素节点，除非将本段代码放在文档末尾
      window.onload = fun1;
      function fun1(){
          var btn = document.getElementsByTagName("button")[0];
          //onclick在按钮被点击时执行
          btn.onclick = function(){
              alert("hello");
          }
      }
  </script>
</head>
<body>
<h1>Hello,</h1>
<%=Greeting.greetings() %>
<button>hello</button>
</body>
</html>
