<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div align="center">
	<p style="font-size:18pt;">部门列表</p>

</div>
<c:choose>
	<c:when test="${list==null||list.size()==0 }">
		<div align="center">
			<p style="font-size:18pt;">部门列表为空</p>
		</div>
	</c:when>
	<c:otherwise>
		<div align="right">
			<p style="font-size:12pt;">
				<input type="button" id="click_event" value="增加部门">
			</p>

		</div>


		<table width="100%" height="100%" border="0" cellpadding="0"
			cellspacing="0" valign="top">
			<tr align="center" height="40" bgcolor="#00CCCC">
				<td>部门编号</td>
				<td>部门名称</td>
				<td>部门操作</td>
			</tr>
			<c:forEach items="${list}" var="department">
				<tr align="center" height="40">
					<td>${department.id}</td>
					<td><a title="${department.name}"
						href="doctor!findDepartment?typeid=${department.id} ">${department.name}</a>
					</td>
					<td><a href="admindepartment!upfind?deid=${department.id }">更新</a>&nbsp;&nbsp;&nbsp;<a
						href="department!delDepart?deid=${department.id }">删除</a></td>
				</tr>
			</c:forEach>
		</table>
		
		<div id="hidden_enent" style="display:none" align="center">
			<hr>
			<script type="text/javascript">
		function addDe(){
		var name = document.getElementById("dename").value;
		if(name==null||name==""){
		alert("添加部门名字不能为空");
		return;
		}else{
		document.getElementById("adminAdd").submit();
		}
		}
		</script>
			<form id="adminAdd" action="department!addDepart" method="post">

				<table width="100%" height="40" border="0" cellpadding="0"
					cellspacing="0" valign="top">

					<Tr align="center">
						<td style="font-size: 14pt">&nbsp;&nbsp;增加部门</td>
					</Tr>
					<tr align="center" height="40">
						<td>部门名字:<input type="text" id="dename" name="de.name">
						</td>
					</tr>
					<tr align="center" height="60">
		
						<td><input type="button" value="提交" onclick="addDe()">&nbsp;&nbsp;&nbsp;<input
							type="reset" value="重置"></td>
					</tr>
				</table>
			</form>
		</div>
	</c:otherwise>
</c:choose>
