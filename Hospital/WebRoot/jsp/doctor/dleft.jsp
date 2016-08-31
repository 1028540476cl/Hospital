<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function checkForm() {
		var username = document.getElementById("userlogin").value;
		var password = document.getElementById("passwordlogin").value;

		if (username == null || username == "") {
			alert("请填写会员名！");
			return;
		} else if (password == null || password == "") {
			alert("请填写密码！");
			return;
		} else {
			document.getElementById("login").submit();
		}
	}
</script>
<table valign="top">
	<tr>
		<td height="42" valign="top"><img src="../images/lefttop.jpg"
			width="281" height="53"></td>
	</tr>
	<c:choose>
		<c:when test="${user==null }">
			<tr>
				<td height="40" valign="middle">
					<form id="login" method="post" action="user!login">
						<table width="100%" height="100" border="0" cellspacing="0"
							cellpadding="0" background="../images/leftlogin.jpg" valign="top">
							<tr align="center">
								<td width="70%" height="24">会员名 <input name="us.username"
									type="text" size="16" id="userlogin"></td>
								<td width="30%">&nbsp;</td>
							</tr>
							<tr align="center">
								<td height="24">密&nbsp;码 <input name="us.password"
									type="password" size="16" id="passwordlogin"></td>
								<td width="30%" style="color: red;font-size: 10px;">${error}</td>
								<td width="30%" style="font-size: 10px;">${save}</td>
							<tr align="center">
								<td height="31"><input name="Button" type="button"
									class="btn_grey" value="注册"
									onClick="window.location.href='department!reg'"> &nbsp;
									<input type="button" value="登录" onclick="checkForm()">
									<input name="Submit3" type="reset" class="btn_grey" value="重置">
								</td>
								<td width="6%">&nbsp;</td>

							</tr>
						</table>
					</form></td>
			</tr>
		</c:when>
		<c:otherwise>

			<tr>

				<td height="40" valign="middle"><table width="100%"
						height="100" border="0" cellspacing="0" cellpadding="0"
						background="../images/leftlogin.jpg" valign="top">
						<tr>
							<c:if test="${user.typeid==0}">
								<td width="94%" height="31" align="center" class="word_white">[${user.username
									}]您好!<br>您现在可以预约了!</td>
								<td width="6%">&nbsp;</td>
						</tr>
						<tr>
							<td width="94%" height="31" align="center" class="word_white"><a
								href="order!ordercheck?pageNo=1">我的预约</a>&nbsp;&nbsp;<a href="message">留言</a>
							</td>
							<td width="6%">&nbsp;</td>
						<tr>
							<td height="24" align="center"><input name="Submit22"
								type="button" value="修改资料"
								onClick="window.location.href='user!answerlogin?uid=${user.userid }';">
								<input name="Submit32" type="button" class="btn_grey"
								value="退出登录" onClick="window.location.href='user!loginout';">
							</td>
						</tr>
						</tr>
						</c:if>
						<c:if test="${user.typeid==1}">
							<td width="94%" height="31" align="center" class="word_white">[${user.username
								}]您好!<br>你现在可以工作了!</td>
							<td width="6%">&nbsp;</td>
							</tr>
							<tr>
								<td width="94%" height="31" align="center" class="word_white"><a
									href="message?pageNo=1">留言</a>
								</td>
								<td width="6%">&nbsp;</td>
							</tr>
							<tr>
								<td><input name="Submit32" type="button" class="btn_grey"
									value="退出登录" onClick="window.location.href='user!loginout';">
								</td>
							</tr>
						</c:if>


						<tr>

							<td>&nbsp;</td>
						</tr>

					</table>
				</td>
			</tr>

		</c:otherwise>
	</c:choose>
	<tr>
		<td height="49" align="center">
		<script type="text/javascript">
	function check() {
		var condition = document.getElementById("condition").value;
		if (condition == null || condition == "") {
			alert("请选择搜索条件！");
			return;
		} else {
			document.getElementById("check").submit();
		}
	}
</script>
		<form  id="check" action="doctor!checkDepartment?pageNo=1" method="post">
			<table border="0" cellspacing="1" cellpadding="1">
			<tr>
						<td height="15" colspan="2"></td>
					</tr>
					<tr >
						<td colspan="2" valign="top" align="center" height="35"
							style="font-size:18pt;" >查询该科室医生</td>
					</tr>
					<tr>
						<td height="15" colspan="2"></td>
					</tr>
					<tr>
				<Tr>
					<Td colspan="2">选择科室：<select id="condition" name="condition" class="textarea">
							<option value="" selected style="font-size: 12px">全部分类</option>
							<c:forEach var="home" items="${list}">
								<option value="${home.id }">${home.name}</option>
							</c:forEach>
					</select>
					</td>
				</tr>
				<tr>
						<td height="40" colspan="2"></td>
					</tr>
				<tr>
					<Td width="8%"></Td>
					<td ><input type="button" onclick="check()" value="查询">&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"></td>
				</tr>
			</table>
			</form>
			</td>
	</tr>
</table>
