<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div align="center">
	<p style="font-size:18pt;">部门更新</p>

</div>
<c:choose>
	<c:when test="${department==null}">
		<div align="center">
			<p style="font-size:18pt;">查看部门信息出错</p>
		</div>
	</c:when>
	<c:otherwise>
			<script type="text/javascript">
		function upDe(){
		var name = document.getElementById("dename").value;
		if(name==null||name==""){
		alert("添加部门名字不能为空");
		return;
		}else{
		document.getElementById("adminUp").submit();
		}
		}
		</script>
			<form id="adminUp" action="department!upDepart" method="post">
		<table width="100%" height="100%" border="0" cellpadding="0"
			cellspacing="0" valign="top">
			<tr align="center" height="40" bgcolor="#00CCCC">
				<td>部门编号</td>
				<td>部门名称</td>
			</tr>
				<tr align="center" height="40">
					<td><input type="hidden" name=de.id value="${department.id}">${department.id}</td>
					<td><input type="text" id="dename" name=de.name value="${department.name}"></td>
				</tr>
				<Tr align="center" height="60">
				<td colspan="2" ><input type="button" value="提交" onclick="upDe()">&nbsp;&nbsp;&nbsp;<input
							type="reset" value="重置"></td>
				</Tr>
		</table>
		</form>
	</c:otherwise>
</c:choose>
