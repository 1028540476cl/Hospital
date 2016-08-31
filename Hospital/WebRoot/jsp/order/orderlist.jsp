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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/ind.css" rel="stylesheet" />
<title>医院预约挂号系统</title>
</head>
<body>
	<table width="980" border="0" cellpadding="0" cellspacing="0"
		align="center" background="../images/main.gif">
		<tr>
			<td height="80" colspan="3"><c:import url="../top.jsp" />
			</td>
		</tr>
		<tr>
			<td width="10%" height="400" valign="top"></td>
			<td width="80%" valign="top" height="100%">

				<div align="center">
					<p style="font-size:18pt;">订单信息界面</p>
				</div>
				<script type="text/javascript">
				function qu(){
				var count = confirm("提交预约订单后不能再更改订单信息了， \n请保证你的信息无误！是否继续提交？");
				if(count){
				document.getElementById("order").submit();
				}else{
				return;
				}
				}
				</script>
				<form id="order" action="order!orderList" method="post">
					<table width="100%" height="80%">

						<tr>
							<td height="10"></td>
						<Tr>
							<c:choose>
								<c:when test="${ord==null }">
									<div align="center">
										<p style="font-size:18pt;">这个挂号预约信息出错，请重新返回去挂号</p>
										<a style="font-size:12pt;"
											href="javascript:window.history.back(-1)">返回</a>
									</div>
								</c:when>
								<c:otherwise>
									<tr>
										<td>&nbsp;挂号信息确定
											<table width="100%" height="100%" border="0" cellpadding="0"
												cellspacing="0" valign="top">
												<tr align="center" bgcolor="#00CCCC" height="30">
													<td>医院名称</td>
													<td>科室名称</td>
													<td>医生姓名</td>
													<td>就诊时间</td>
													<td>挂号费(元)</td>
												</tr>
												<tr align="center">
													<td>XX第一医院</td>
													<td><input type="hidden" id="kesi" name="od.kesi"
														value="${ord.kesi }">${ord.kesi }</td>
													<td><input type="hidden" id="odname" name="od.dname"
														value="${ord.dname}">${ord.dname}</td>
													<td><input type="hidden" id="otime" name="od.otime"
														value="${ord.otime}">${ord.otime }</td>
													<td><input type="hidden" id="oprice" name="od.oprice"
														value="${ord.oprice}">${ord.oprice }</td>
												</tr>

											</table>
										<td>
									</tr>
								</c:otherwise>
							</c:choose>
						<tr>
							<td height="50"></td>
						</Tr>
						<c:choose>
							<c:when test="${user==null }">
								<div align="center">
									<p style="font-size:18pt;">个人信息出错，请返回主页登录</p>
									<a style="font-size:12pt;" href="department">返回首页</a>
								</div>
							</c:when>
							<c:otherwise>
								<tr>
									<td>&nbsp;就诊人信息

										<table width="100%" height="100%" border="0" cellpadding="0"
											cellspacing="0" valign="top">
											<tr align="center" bgcolor="#00CCCC" height="30">
												<td>姓名</td>
												<td>身份证</td>
												<td>电话号码</td>

											</tr>
											<tr align="center">
												<td><input type="hidden" id="oname" name="od.oname"
													value="${ord.oname }">${ord.oname }</td>
												<td><input type="hidden" id="onumber" name="od.onumber"
													value="${ord.onumber }">${ord.onumber }</td>
												<td><input type="hidden" id="ophone" name="od.ophone"
													value="${ord.ophone}">${ord.ophone}</td>

											</tr>

										</table>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
						<tr>
							<td height="30"></td>
						<Tr>
						<tr align="center">
					
							<Td><input type="button" value="付费" onclick="qu()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" value="上一页" onclick="javascript:window.history.back(-1)">
							</Td>
						</tr>

					</table>
				</form>
			</td>
			<td width="10%" height="400" valign="top"></td>

		</tr>

		<tr>
			<td height="136" colspan="3" valign="top"><c:import
					url="../bottom.jsp" />
			</td>
		</tr>
	</table>
</body>
</html>
