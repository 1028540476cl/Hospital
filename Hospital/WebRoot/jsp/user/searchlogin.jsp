<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>医院预约挂号</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/ind.css" rel="stylesheet" />
<script src="<c:url value='/js/jquery-1.5.1.js'/>"></script>
<script src="../js/regist.js"></script>
</head>
<body>
	<table width="980" border="1" cellpadding="0" cellspacing="0"
		align="center" background="../images/main.gif">
		<tr>
			<td height="80" colspan="2"><c:import url="../top.jsp" />
			</td>
		</tr>
		<tr>
			<td width="100%" valign="top">
				<table width="100%" height="300" border="0" cellpadding="0"
					cellspacing="0" valign="top">

					<c:choose>
						<c:when test="${user==null } ">
							<td align="center">★★对不起，未找到用户你的信息！★★</td>

						</c:when>
						<c:otherwise>
						<tr>
						<td height="15"></td>
					</tr>
					<tr >
						<td colspan="2" valign="top" align="center" height="35"
							style="font-size:18pt;" >修改资料界面</td>
					</tr>
					<tr>
						<td height="15"></td>
					</tr>
					<tr>
						<td width="20%"></td>
						<td width="80%">
							
								<form action="<c:url value='user!updatelogin'/>" method="post"
									id="registForm">

									<table>
										<tr>
											<td colspan="2"><input type="hidden" name="us.userid"
												value="${user.userid }" />
											</td>
										</tr>
										<tr>
											<td colspan="2"><input type="hidden" name="us.typeid"
												value="${user.typeid }" />
											</td>
										</tr>

										<tr>
											<td>用户姓名：</td>
											<td><input class="inputClass" type="text"
												id="username" name="us.username" value="${user.username }">
											</td>
											<td class="tdError"><label class="errorClass"
												id="usernameError">${errors.username}</label>
											</td>
										</tr>
										<tr>
											<td>用户密码：</td>
											<td><input class="inputClass" type="text" id="password"
												name="us.password" value="${user.password }">
											</td>
											<td class="tdError"><label class="errorClass"
												id="passwordError">${errors.password}</label>
											</td>
										</tr>
										<tr>
											<td>确认密码：</td>
											<td><input class="inputClass" type="password"
												id="password1" name="password1">
											</td>
											<td class="tdError"><label class="errorClass"
												id="password1Error">${errors.password1}</label>
											</td>
										</tr>
										<tr>
											<td>性别：</td>
											<td><input type="radio" id="sex" name="us.sex"
												checked="checked" value="男">男 <input type="radio" id="sex"
												name="us.sex" value="女">女</td>
										</tr>
										<tr>
											<td>电话号码：</td>
											<td><input class="inputClass" type="text" id="phone"
												name="us.phone" value="${user.phone }">
											</td>
											<td class="tdError"><label class="errorClass"
												id="phoneError">${errors.phone}</label>
											</td>
										</tr>
										<tr>
											<td>邮箱：</td>
											<td><input class="inputClass" type="text" id="email"
												name="us.mail" value="${user.mail }">
											</td>
											<td class="tdError"><label class="errorClass"
												id="emailError">${errors.email}</label>
											</td>
										</tr>
										<tr>
											<td>身份证号码：</td>
											<td><textarea class="inputClass" id="number" rows="1"
													cols="50" id="number" name="us.number">${user.number }</textarea>
											</td>
											<td class="tdError"><label class="errorClass"
												id="numberError">${errors.number}</label>
											</td>
										</tr>
										<tr>
											<td>家庭住址：</td>
											<td><textarea class="inputClass" id="address" rows="2"
													cols="50" id="address" name="us.address">${user.address }</textarea>
											</td>
										</tr>
										<tr>
											<td>设置问题：</td>
											<td><textarea class="inputClass" id="question" rows="2"
													cols="50" id="question" name="us.question">${user.question }</textarea>
											</td>
										</tr>
										<tr>
											<td>设置答案：</td>
											<td><textarea class="inputClass" id="answer" rows="2"
													cols="50" id="answer" name="us.answer">${user.answer}</textarea>
											</td>
										</tr>
										<tr height="60" valign="bottom">
											<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
											<td align="center"><input type="submit" value="提交" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="reset" value="重置"></td>
										</tr>
										<tr>
											<td height="20"></td>
										</tr>

										<tr align="center">
											<td colspan="2">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
												href="javascript:window.history.back(-1)">返回上一页</a></td>
										</tr>
									</table>
								</form>
						</c:otherwise>
					</c:choose>
					</td>
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
