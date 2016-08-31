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
		mainPage = "default.jsp";
	}
%>
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
			<td height="80" colspan="3"><c:import url="../top.jsp" /></td>
		</tr>
		<tr align="center">
						<td>
						<script type="text/javascript">
						var oid=${oid};
						
						if(oid==0){
						setTimeout("location='department'",2000);
						}else if(oid==null||oid==""){
						setTimeout("location='order!ordercheck?pageNo=1'",2000);
						}else if(oid==7){
						setTimeout("location='time!orderTrue'",100);
						}else if(oid==98){
						setTimeout("location='time!orderdel'",100);
						}else if(oid==580){
						setTimeout("location='doctor!findAllDepartment?pageNo=1'",2000);
						}else if(oid==581){
						setTimeout("location='time!orderTime'",100);
						}else{
						setTimeout("location='order!orderPay?oid='+oid",2000);
						}
						
						</script>
						<td height="400">
						 <p align="center" style="font-size: 18pt;color: red;" >&nbsp;${save}</p>
					</tr>

		<tr>
			<td height="136" colspan="3" valign="top"><c:import
					url="../bottom.jsp" /></td>
		</tr>
	</table>
</body>
</html>
