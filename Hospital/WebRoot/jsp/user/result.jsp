<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>医院预约挂号</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/ind.css" rel="stylesheet" />
<script src="../js/ind.js" type="text/javascript"></script>
<script src="<c:url value='/js/jquery-1.5.1.js'/>"></script>
<script src="../js/regist.js"></script>
</head>
<body>
	<table width="980" border="1" cellpadding="0" cellspacing="0"
		align="center" background="../images/main.gif">
		<tr>
			<td height="80" colspan="2"><c:import url="../top.jsp" /></td>
		</tr>
		<tr>

			<td width="100%" valign="top">
				<table width="100%" height="310" border="0" cellpadding="0"
					cellspacing="0" valign="top">
					<tr align="center">
						<td height="50">
						<td>
					</tr>
					<tr align="center">
						<td><script type="text/javascript">
						var answer="${save}";
						alert(answer);
						window.location.href="department";</script>
						<td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td height="136" colspan="2" align="top"><c:import
					url="../bottom.jsp" /></td>
		</tr>
	</table>
</body>
</html>
