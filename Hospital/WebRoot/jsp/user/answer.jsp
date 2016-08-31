<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>医院预约挂号</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<link href="../css/ind.css" rel="stylesheet" />
<script src="../js/ind.js" type="text/javascript"></script>

</head>
<body>
	<table width="980" border="1" cellpadding="0" cellspacing="0"
		align="center" background="../images/main.gif">
		<tr>
			<td height="80" colspan="2"><c:import url="../top.jsp" /></td>
		</tr>
		<tr>
		
			<td width="80%" valign="top">
				<table width="100%" height="310" border="0" cellpadding="0"
					cellspacing="0" valign="top">

					<tr>
						<td align="center"><c:choose>
								<c:when test="${user==null } }">
									<td colspan="8" align="center">★★对不起，未找到用户你的信息！★★</td>

								</c:when>
								<c:otherwise>
									<script type="text/javascript">
										function checkFormAnswer() {
										var question=document.getElementById("question").value;
										
									var answer=document.getElementById("answer").value;
										
											if (answer == null || answer == "") {
												alert("请填写你的答案！");
												return;
											} else {
												document.getElementById("answorForm").submit();
											}
										}
									</script>
									<form id="answorForm" action="<c:url value='user!searchlogin?uid=${user.userid }'/>"
										method="post">
										<input type="hidden" name="method" value="regist" />
										<table>
											<tr align="center">
												<td colspan="2" style="font-size: 14pt;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;要修改资料请先回答之前的问题</td>
											</tr>
											<tr>
												<td colspan="2" style="font-size: 14pt;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
											</tr>
											<tr>

												<td>问题：</td>
												<td><textarea id="question" rows="2" cols="50"
														id="question" name="us.question" readonly="readonly">${user.question }</textarea>
												</td>
											</tr>
											<tr>
												<td>答案：</td>
												<td><textarea id="answer" rows="2" cols="50"
														id="answer" name="us.answer"></textarea></td>
											</tr>
											<tr>
												<td colspan="2" style="font-size: 14pt; color: red;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${error }</td>

											</tr>
											<tr height="60" valign="bottom">
												<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
												<td align="center"><input type="button" value="确定" onclick="checkFormAnswer()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<input type="reset" value="重置">
												</td>
											</tr>
											<tr>
									<td height="20"></td>
									</tr>
									
									<tr align="center">
									<td colspan="2"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.history.back(-1)">返回上一页</a></td>
									</tr>
										</table>
									</form>
								</c:otherwise>
							</c:choose>
						</td>
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
