<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div align="center">
	<p style="font-size:18pt;">修改回复留言</p>

</div>
<div align="right">
	<a href="javascript:window.history.back(-1)">返回上页</a>
</div>
<c:choose>
	<c:when test="${message==null }">
		<div align="center">
			<p style="font-size:18pt;">留言列表为空</p>
		</div>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
				function revert() {
			
					var contert = document.getElementById("recontert").value;
					if (contert == null || contert ==""){
						alert("请输入回复的内容···");
						return;
					}else{

					document.getElementById("update").submit();
					}
				}
			</script>
		<form id="update" action="revert!updateRevert?mid=${message.mid }" method="post">
			<table width="100%" height="100%" border="0" cellpadding="0"
				cellspacing="0" valign="top">
				<tr>
					<td height="10"></td>
				</tr>
				<tr>
				<tr>
					<td bgcolor="#00CCCC">【${message.title }】</td>
				</tr>
				<tr>
				<tr>
					<td height="20"></td>
				</tr>
				<tr>
					<td>${message.contert }</td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>
				<tr>
					<td>【回复：】</td>
				</tr>
				<tr>
					<td><input type="hidden" name=re.rid value="${message.revert.rid}">
					</td>
				</tr>
				<tr>
					<td align="center"><textarea id="recontert" rows="4" cols="80"
							name="re.contert" wrap="hard">${message.revert.contert}</textarea>
					</td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>
				<tr>

					<td align="center" height="20"><input type="button"
						onclick="revert()" value="回复">&nbsp;&nbsp;&nbsp;&nbsp; <input
						type="reset" value="重置"></td>
				</tr>
				<hr>
			</table>
		</form>

	</c:otherwise>
</c:choose>
