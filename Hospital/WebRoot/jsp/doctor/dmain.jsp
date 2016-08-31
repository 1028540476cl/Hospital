<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	String mainPage=(String)request.getAttribute("mainPage");
	if(mainPage==null || mainPage.equals("")){
		mainPage="default.jsp";
	}
	
%>
<html>
<head>

<title>医院预约挂号</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/ind.css" rel="stylesheet" />
<style type="text/css">
.sgBtn {
	width: 62px;
	height: 35px;
	line-height: 35px;
	margin-left: 20px;
	margin-top: 12px;
	text-align: center;
	background-color: #0095D9;
	color: #FFFFFF;
	float: left;
	border-radius: 5px;
}
</style>
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
					url="dleft.jsp" /></td>
			<td width="72%" valign="top" height="90%"><c:import url="<%=mainPage%>"/></td>
		</tr>
						<c:choose>
		<c:when test="${dlist.list==null||dlist.list.size()==0 }">
		<tr></tr>
		</c:when>
		<c:otherwise>
		<tr>
		<td width="72%" valign="top" height="10%" align="center"><c:import url="../default/page.jsp"/></td>
		</tr>
		</c:otherwise>
		</c:choose>
		
		<tr>
			<td height="136" colspan="2" valign="top"><c:import url="../bottom.jsp" />
			</td>
		</tr>
	</table>
</body>
</html>
