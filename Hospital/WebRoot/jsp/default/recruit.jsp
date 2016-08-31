<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>医院预约挂号</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="../css/ind.css" rel="stylesheet" />
<script src="../js/ind.js" type="text/javascript"></script>
</head>

<body>
	<table width="980" border="1" cellpadding="0" cellspacing="0"
		align="center" background="../images/main.gif">
		<tr>
			<td height="80" colspan="2"><c:import url="../top.jsp" />
			</td>
		</tr>
		<tr>

			<td width="60%" valign="top">
				<table width="100%" height="310" border="0" cellpadding="0"
					cellspacing="0" valign="top">
					<tr>

						<td><input type="image"
							src="<c:url value='/images/zc1.jpg'/>">
						</td>
					</tr>
					<tr>
						<%/* 读取txt文件 */
	FileReader reader = new FileReader("D:/Users/acer/Workspaces/MyEclipse 10/Hospital/WebRoot/css/zx.txt");
	BufferedReader bufferedReader = new BufferedReader(reader);
	StringBuffer txt = new StringBuffer();
	String temp = null;
	while((temp = bufferedReader.readLine()) != null) {
		txt.append(temp);
	}
%>
						<td class="text"><%=txt%></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="136" colspan="2" align="top"><c:import
					url="../bottom.jsp" />
			</td>
		</tr>
	</table>
</body>
</html>
