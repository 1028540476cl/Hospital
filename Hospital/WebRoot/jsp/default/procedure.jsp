<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>医院预约挂号</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/ind.css" rel="stylesheet" />

</head>
<body>
<table width="980"  border="1" cellpadding="0" cellspacing="0" align="center" background="../images/main.gif">
  <tr>
    <td height="80" colspan="2"><c:import url="../top.jsp" /></td>
  </tr>
  <tr>
    <td width="28%" height="400" valign="top"><c:import	url="../left.jsp" /> </td>
    <td width="72%" valign="top">
    <table width="100%" height="420" border="0" cellpadding="0" cellspacing="0" valign="top">
      <tr>
        <td valign="top" align="center" height="35"><c:import url="../search.jsp" /></td></tr>
     
      <tr>
	<td><p style="font-size: 18pt"><b>&nbsp;操作流程：</b></p>
	<p>&nbsp;</p>
	<p style="font-size: 13pt">&nbsp;&nbsp;第一步：在左边登录，假如你是新用户先在左边注册；</p>
	<p>&nbsp;</p>
    <p style="font-size: 13pt">&nbsp;&nbsp;第二步：你找到自己想预约的医生预约挂号，可以通过下面的方式来找医生</p>
   <p>&nbsp;</p>
    <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1）通过上面快速搜索直接搜索医生</p>
    <p>&nbsp;</p>
     <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2）通过特色门诊&gt;选择医生</p>
     <p>&nbsp;</p>
      <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3）通过名医风采&gt;选择医生</p>
      <p>&nbsp;</p>
     <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4）通过名医风采&gt;选择科室&gt;选择医生</p>
     <p>&nbsp;</p>
    <p style="font-size: 13pt">&nbsp;&nbsp;第三步：找到医生后点击医生图片下方的预约并且按照步骤一直到付费</p>
    <p>&nbsp;</p>
    <p style="font-size: 13pt">&nbsp;&nbsp;第四步：支付成功后，可以在登录后登录界面下方查看自己的订单，且可以选择留言</p>
   </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="136" colspan="2" align="top"><c:import url="../bottom.jsp" /></td>
  </tr>
</table>
</body>
</html>
