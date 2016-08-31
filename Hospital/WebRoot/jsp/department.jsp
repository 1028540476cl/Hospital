<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>医院预约挂号</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <form action="" method="post">
  
  </form>
  <table>
  <tr align="center">
  <td>id:</td>
  <td><input type="text" name="de.id"></td>
  </tr>
  <tr align="center">
  <td>姓名:</td>
  <td><input type="text" name="de.name"></td>
  </tr>
  <tr align="center">
  <td><input type="submit" value="提交"></td>
  <td><input type="reset" name="重置"></td>
  </tr>
  </table>
   
  </body>
</html>
