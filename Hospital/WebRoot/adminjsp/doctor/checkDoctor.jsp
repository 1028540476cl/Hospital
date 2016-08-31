<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table width="780" border="0" cellpadding="0" cellspacing="0" align="center" >
		<tr>

			<td width="80%" valign="top" height="100%" rowspan="2">
				<div align="center">
					<p style="font-size:18pt;">具体信息界面</p>
				</div> 
			<c:choose>

					<c:when test="${dlist==null||dlist.size() == 0 } ">
					
						<td align="center">★★对不起，没有该医生的排班信息！★★</td>
						
					</c:when>
					<c:otherwise>
						<c:forEach var="dlist" items="${dlist}" begin="0" end="0">
							<table width="100%" height="25%" border="0" cellpadding="0"
								cellspacing="0" valign="top">
								<tr>
									<td rowspan="3" width="10%"><img
										src="<c:url value='/images/${dlist.doctor.picture}'/>">
									</td>
									<td colspan="2">${dlist.doctor.dname}&nbsp;&nbsp;&nbsp;${dlist.doctor.sex}</td>
								</tr>
								<tr>
									<td colspan="2">${dlist.doctor.post}</td>

								</tr>
								<tr>
									<td colspan="2">简介：</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td colspan="2">${dlist.doctor.description}</td>
								</tr>

							</table>
							
							<hr>
							<div align="center">
								<a href="javascript:window.history.back(-1)">选择其他医生</a>
							</div>
						

						<table width="100%" height="25%" border="0" cellpadding="0"
							cellspacing="0" valign="top">
							<tr>
								<td colspan="8" height="25"></td>
							</tr>
							<tr>
								<td colspan="6" height="60" align="center" bgcolor="#00CCCC"
									style="font-size:18pt; ">时间表界面</td>
									
									 <td align="right" bgcolor="#00CCCC" colspan="2"> <a href="time!adminUpDoctor?did=${dlist.doctor.did }&&sgin=2">更改排班表</a></td>
									</c:forEach> 
							</tr>
							
							<tr bgcolor="#999999" align="center" height="40">
								<td>日期</td>
								<td>周日</td>
								<td>周一</td>
								<td>周二</td>
								<td>周三</td>
								<td>周四</td>
								<td>周五</td>
								<td>周六</td>
							</tr>

							<c:forEach var="dlist" items="${dlist}">
								<tr align="center" height="40">
									<td bgcolor="#CCCCCC">${dlist.remark }</td>
									<c:if test="${dlist.timesi!=null }">
										<td>${dlist.timesi }</td>
									</c:if>
									<c:if test="${dlist.timesi==null }">
										<td><div class="sgBtn1">${dlist.timesi }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timeo!=null }">
										<td>${dlist.timeo }</td>
									</c:if>
									<c:if test="${dlist.timeo==null }">
										<td><div class="sgBtn1">${dlist.timeo }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timet!=null }">
										<td>${dlist.timet }</td>
									</c:if>
									<c:if test="${dlist.timet==null }">
										<td><div class="sgBtn1">${dlist.timet }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timetr!=null }">
										<td>${dlist.timetr }</td>
									</c:if>
									<c:if test="${dlist.timetr==null }">
										<td><div class="sgBtn1">${dlist.timetr }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timef!=null }">
										<td>${dlist.timef }</td>
									</c:if>
									<c:if test="${dlist.timef==null }">
										<td><div class="sgBtn1">${dlist.timef }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timefi!=null }">
										<td>${dlist.timefi }</td>
									</c:if>
									<c:if test="${dlist.timefi==null }">
										<td><div class="sgBtn1">${dlist.timefi }</div>
										</td>
									</c:if>
									<c:if test="${dlist.times!=null }">
										<td>${dlist.times }</td>
									</c:if>
									<c:if test="${dlist.times==null }">
										<td><div class="sgBtn1">${dlist.times }</div>
										</td>
									</c:if>

								</tr>
							</c:forEach>

						</table>

					</c:otherwise>

				</c:choose>
				
	</table>