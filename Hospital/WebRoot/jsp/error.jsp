<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <title>错误界面</title>
  </head>
  <script type="text/javascript">
  setTimeout("location='javascript:window.history.back(-1)'",3000);
  </script>
  <body>
  
   <p align="center" style="font-size: 18pt;color: red;" >${save},3s后自动跳转到上一页</p>
  </body>
</html>
