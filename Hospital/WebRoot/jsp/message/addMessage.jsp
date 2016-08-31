<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div align="center">
	<p style="font-size:18pt;">留言版</p>

</div>
<div align="right">
	<a href="javascript:window.history.back(-1)">返回上页</a>
</div>

<script type="text/javascript">
	function addMessage() {
		var title = document.getElementById("title").value;
		var contert = document.getElementById("contert").value;
		if (title == null || title == "") {
			alert("请先填写留言的标题！");
			return;
		}
		if (contert == null || contert == "") {
			alert("请填写留言的内容！");
			return;
		} else {
			document.getElementById("add").submit();
		}

	}
</script>
<form id="add" action="message!saveMessage" method="post">
	<table width="100%" height="100%" border="0" cellpadding="0"
		cellspacing="0" valign="top">
		<tr>
			<td colspan="2" height="40"></td>
		</tr>
		<tr>
			<c:choose>
				<c:when test="${message ==null}">
					<tr>

						<td align="center">标题:</td>
						<td><textarea id="title" name="mess.title" rows="1" cols="60"
								wrap="hard"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" height="20"></td>
					</tr>
					<tr>
						<td>留言内容:</td>
						<td><textarea id="contert" rows="10" cols="60"
								name="mess.contert" wrap="hard"></textarea></td>
					</tr>
				</c:when>
				<c:otherwise>
				<tr><td align="center" colspan="2"><input type="hidden" name="mess.mid" value="${message.mid }"></td></tr>
					<tr>
						<td align="center">标题:</td>
						<td><textarea id="title" name="mess.title" rows="1" cols="60"
								wrap="hard">${message.title }</textarea></td>
					</tr>
					<tr>
						<td colspan="2" height="20"></td>
					</tr>
					<tr>
						<td>留言内容:</td>
						<td><textarea id="contert" rows="10" cols="60"
								name="mess.contert" wrap="hard">${message.contert }</textarea></td>
					</tr>
				</c:otherwise>
			</c:choose>
		<tr>
			<td colspan="2" height="40"></td>
		</tr>
		<tr>
		<tr>
		<tr align="center">
			<td align="center" colspan="2"><input type="button"
				onclick="addMessage()" value="提交" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="重置">
			</td>
		</tr>
	</table>
</form>




