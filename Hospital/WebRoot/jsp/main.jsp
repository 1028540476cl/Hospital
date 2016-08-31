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
<table width="980"  border="0" cellpadding="0" cellspacing="0" align="center" background="../images/main.gif">
  <tr>
    <td height="80" colspan="2"><c:import url="top.jsp" /></td>
  </tr>
  <tr>
    <td width="28%" height="400" valign="top"><c:import	url="left.jsp" /> </td>
    <td width="72%" valign="top">
    <table width="100%" height="310" border="0" cellpadding="0" cellspacing="0" valign="top">
      <tr>
        <td valign="top" align="center" height="35"><c:import url="search.jsp" /> 
								</td>
      </tr>
      <tr>
        <td align="center"><img src="../images/main2.jpg" width="600"
			height="428"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="136" colspan="2" align="top"><c:import url="bottom.jsp" /></td>
  </tr>
</table>
</body>
</html>
