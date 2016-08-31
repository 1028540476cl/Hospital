<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${dlist.list}" var="dlist" begin="0" end="0">
<div align="center">
	<p style="font-size:18pt;" ><c:out value="${dlist.department.name}医生信息界面"></c:out></p>
</div>
<div align="right"> 
	<a href="javascript:window.history.back(-1)" >返回上页</a>
</div>
</c:forEach>
<c:choose>
	<c:when test="${dlist.list==null||dlist.list.size() == 0 }">
	<div align="center">
	<p style="font-size:18pt;" >★★对不起，未找到该科室的医生信息！★★</p>
</div>
	</c:when>
	<c:otherwise>
		<c:forEach items="${dlist.list}" var="dlist">
			<table width="100%" height="20%" border="0" cellpadding="0"
				cellspacing="0" valign="top">
				<Tr>
					<td rowspan="3" width="10%"><img
						src="<c:url value='/images/${dlist.picture}'/>">
					</td>
					<td colspan="2">${dlist.dname}&nbsp;&nbsp;&nbsp;${dlist.sex}</td>
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
						<td align="center"><a href="time!checkTime?did=${dlist.did}"><div class="sgBtn">预约</div></a>
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
<c:if test="${user.typeid==2}">
		<tr>
	<td width="72%" valign="top" height="10%" align="center" colspan="2">
	<c:import url="/jsp/doctor/page.jsp" />
	</td>
</tr>
</c:if>
