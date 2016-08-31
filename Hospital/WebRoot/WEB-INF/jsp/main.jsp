<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
</head>
<body>
	<%-- <table width="790" border="10" cellspacing="1" cellpadding="1"
		align="center" >
		<tr>
			<td colspan="2"><c:import url="top.jsp" />
			</td>
		</tr>
		<tr>
		
			<td width="120"  valign="top" >
			<c:import	url="left.jsp" /></td>
			
			<td width="670" valign="top" align="left">
			<table width="670" height="236" border="1" cellpadding="1" cellspacing="1">
				<tr>
								<td valign="top" align="center" height="35"><c:import url="search.jsp" />
								</td>
							</tr>
							<tr align="center" valign="top">
							<td>界面设置一个图片</td>
						
						</tr>
						</table>
			</td>
			
		</tr>
		<tr>
			<td colspan="2"><c:import url="bottom.jsp" />
			</td>
		</tr>
			</table> --%>
<table width="980"  border="2" cellpadding="0" cellspacing="1" align="center">
  <tr>
    <td height="101" colspan="2"><c:import url="top.jsp" /></td>
  </tr>
  <tr>
    <td width="28%" height="400" valign="top"><c:import	url="left.jsp" /></td>
    <td width="72%" valign="top">
    <table width="100%" height="310" border="1" cellpadding="0" cellspacing="0" valign="top">
      <tr>
        <td valign="top" align="center" height="35"><c:import url="search.jsp" />
								</td>
      </tr>
      <tr>
        <td align="center">插入一个图片</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="136" colspan="2" align="top"><c:import url="bottom.jsp" /></td>
  </tr>
</table>
</body>
</html>
