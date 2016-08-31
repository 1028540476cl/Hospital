<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div align="center">
	<p style="font-size:18pt;">全部信息界面</p>

</div>
<div align="right">
	<a href="admindoctor!adminAddDoctor">添加医生</a>
</div>
<c:choose>

	<c:when test="${dlist.list==null||dlist.list.size() == 0 }">
		<table width="100%" height="25%" border="0" cellpadding="0"
			cellspacing="0" valign="top">
			<tr>
				<td align="center"><p style="font-size:18pt;">★★对不起，未找到信息！★★</p>
				</td>
			</tr>
		</table>
	</c:when>
	<c:otherwise>
		<c:forEach items="${dlist.list}" var="dlist">
			<table width="100%" height="25%" border="0" cellpadding="0"
				cellspacing="0" valign="top">


				<tr>
					<td rowspan="3" width="10%"><img
						src="<c:url value='/images/${dlist.picture}'/>">
					</td>
					<td colspan="2">${dlist.dname}&nbsp;&nbsp;&nbsp;${dlist.sex}&nbsp;&nbsp;&nbsp;
						<a
						href="admindoctor!findDepartment?typeid=${dlist.department.id }&&pageNo=1">${dlist.department.name}</a>
					</td>
				</tr>
				<tr>
					<td colspan="2">${dlist.post}</td>

				</tr>
				<tr>
					<td colspan="2">简介：</td>
				</tr>
				<tr>

					<td>&nbsp;</td>

					<td colspan="2">${dlist.description}</td>
				</tr>
				<tr>
					<td colspan="2"><a href="time!admincheckTime?did=${dlist.did}">查看医生排班</a>
					</td>
					<td align="right"><script type="text/javascript">
					function doc(did){
					var type = document.getElementById("type"+did).value;
					if(type==1){
					alert("请选择操作···");
					return;
					}else if(type==3){
					window.location.href="admindoctor!adminUpDoctor?type="+did;
					}else{
					 	var count = confirm("确定删除该信息！！！");
						if(count){
							window.location.href="time!delTime?did="+did;
								}else{
								return;
								}
					
					}
					}
					</script> <select id="type${dlist.did}" name="type" class="textarea">
							<option value="1" style="font-size: 14px">操作</option>
							<option value="2" style="font-size: 14px">删除</option>
							<option value="3" style="font-size: 14px">更改</option>
					</select> <input type="button" onclick="doc(${dlist.did})" class="btn_grey"
						value="确定">
					</td>
				</tr>
			</table>
			<hr>
		</c:forEach>
	</c:otherwise>

</c:choose>
<c:if test="${user.typeid==2}">
	<tr>
		<td width="72%" valign="top" height="10%" align="center" colspan="2">
			<c:import url="/adminjsp/doctor/page.jsp" /></td>
	</tr>
</c:if>
