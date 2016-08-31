<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	String mainPage = (String) request.getAttribute("mainPage");
	if (mainPage == null || mainPage.equals("")) {
		mainPage = "addMessage.jsp";
	}
%>
<html>
<head>
<title>医院预约挂号</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/ind.css" rel="stylesheet" />

</head>
<body>
	<table width="980" border="1" cellpadding="0" cellspacing="0"
		align="center" background="../images/main.gif">
		<tr>
			<td height="80" colspan="2"><c:import url="../top.jsp" />
			</td>
		</tr>
		<tr>
			<td width="28%" rowspan="2" height="400" valign="top"><c:import
					url="../left.jsp" /></td>
			<td width="72%" valign="top"><c:import url="<%=mainPage%>"/></td>
		</tr>
		
		<tr>
			<td height="136" colspan="2" align="top"><c:import
					url="../bottom.jsp" />
			</td>
		</tr>
	</table>
</body>
</html>
