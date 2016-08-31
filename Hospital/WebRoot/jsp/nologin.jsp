<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>医院预约挂号系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/ind.css" rel="stylesheet" />
</head>
<body>
	<table width="980" border="0" cellpadding="0" cellspacing="0"
		align="center" background="../images/main.gif">
		<tr>
			<td height="80" colspan="3"><c:import url="top.jsp" /></td>
		</tr>
		<tr align="center">
						<td  height="400" >
						<script type="text/javascript">
						setTimeout("location='department'",3000);
						</script>
						<td>
						 <p align="center"  style="font-size: 18pt;color: red;" >
						 你还未登录，无法访问这里的资源，请等待3秒，正在帮你跳转至首页登录，或者点击<a href="department">这里</a>跳转
						 </p>
					</tr>

		<tr>
			<td height="136" colspan="3" valign="top"><c:import
					url="bottom.jsp" /></td>
		</tr>
	</table>
</body>
</html>
