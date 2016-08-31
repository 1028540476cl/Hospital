<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sign==0 }">
<div align="center">
	<p style="font-size:18pt;">全部信息界面</p>
	
</div>
</c:if>
<c:if test="${sign==2 }">
<div align="center">
	<p style="font-size:18pt;">搜索结果界面</p>
	
</div>
</c:if>

<div align="right"> 
	<a href="javascript:window.history.back(-1)" >返回上页</a>
</div>
<c:choose>

	<c:when test="${dlist.list==null||dlist.list.size() == 0 }">
	<table width="100%" height="25%" border="0" cellpadding="0"
				cellspacing="0" valign="top">
				<tr>
					<td align="center"><p style="font-size:18pt;">★★对不起，未找到信息！★★</p></td>
				</tr>
			</table>
	</c:when>
	<c:otherwise>
		<c:forEach items="${dlist.list}" var="dlist">
			<table width="100%" height="25%" border="0" cellpadding="0"
				cellspacing="0" valign="top">


				<tr>
					<td rowspan="3" width="10%"><img
						src="<c:url value='/images/${dlist.picture}'/>"></td>
					<td colspan="2">${dlist.dname}&nbsp;&nbsp;&nbsp;${dlist.sex}&nbsp;&nbsp;&nbsp;
						<a href="doctor!findDepartment?typeid=${dlist.department.id }&&pageNo=1">${dlist.department.name}</a>
								</td>
				</tr>
				<tr>
					<td colspan="2">${dlist.post}</td>

				</tr>
				<tr>
					<td colspan="2">简介：</td>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${user.typeid==0 }">
							<td align="center" ><a href="time!checkTime?did=${dlist.did}"><div class="sgBtn">预约
								</div></a>
							</td>
							
						</c:when>
						<c:otherwise>
							<td>&nbsp;</td>
							
						</c:otherwise>
					</c:choose>

					<td colspan="2">${dlist.description}</td>
				</tr>

			</table>
			<hr>
		</c:forEach>
	</c:otherwise>

</c:choose>

