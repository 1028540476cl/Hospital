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
<%@ page language="java"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<html>
<head>
<title>医院预约挂号系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/ind.css" rel="stylesheet" />
<script type="text/javascript">
	function checkForm() {
		var oname = document.getElementById("oname").value;

		var onumber = document.getElementById("onumber").value;
		var ophone = document.getElementById("ophone").value;
		if (oname == null || oname == "") {
			alert("请填写预约人的名字！");
			return;
		}
		if (onumber == null || onumber == "") {
			alert("请填写预约人的身份证号码！");
			return;
		}
		if (!/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/
				.exec(onumber)) {
			alert("请填写正确的身份证格式！");
			return;
		}
		if (ophone == null || ophone == "") {
			alert("请填写预约人的电话号码！");
			return;
		}
		if (!/^(13[0-9]|15[0|1|3|6|7|8|9]|18[1|7|8|9]|17[0-9])\d{8}$/
				.exec(ophone)) {
			alert("请填写正确的电话号码格式！");
			return;
		} else {
			document.getElementById("orderForm").submit();
		}

	}
</script>
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
					<p style="font-size:18pt;">确定预约信息界面</p>
				</div>
				<form id="orderForm" action="order!orderTrue" method="post">
					<table width="100%" height="80%">

						<tr>
							<td height="10"></td>
						<Tr>
							<c:choose>
								<c:when test="${time==null }">
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
														value="${time.doctor.department.name }">${time.doctor.department.name
														}</td>
													<td><input type="hidden" id="odname" name="od.dname"
														value="${time.doctor.dname }">${time.doctor.dname
														}</td>
													<td><input type="hidden" id="otime" name="od.otime"
														value="${date }">${date }
													</td>
													<td><input type="hidden" id="oprice" name="od.oprice"
														value="4.0">4.0</td>
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
									<td>&nbsp;预约人信息
										<table width="100%" height="100%" border="0" cellpadding="0"
											cellspacing="0" valign="top">
											<tr align="center" bgcolor="#00CCCC" height="30">
												<td>姓名</td>
												<td>身份证</td>
												<td>电话号码</td>

											</tr>
											<tr align="center">
												<td><input type="text" id="oname" name="od.oname"
													value="${user.username }">
												</td>
												<td><input type="text" id="onumber" name="od.onumber"
													value="${user.number}">
												</td>
												<td><input type="text" id="ophone" name="od.ophone"
													value="${user.phone}">
												</td>

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
							<Td><input type="button" onclick="checkForm()" value="提交订单">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" onclick="javascript:window.history.back(-1)" value="上一页">
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
