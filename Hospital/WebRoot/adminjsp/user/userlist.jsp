<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div align="center">
	<p style="font-size:18pt;">用户列表</p>

</div>
	<c:choose>
		<c:when test="${dlist.totalRecords==0 }">
			<div align="center">
				<p style="font-size:18pt;">用户列表为空</p>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach items="${dlist.list}" var="user">
					<table width="100%" height="100%" border="0" cellpadding="0"
						cellspacing="0" valign="top">
					
						<tr>
						<tr align="center" height="30">
							<td bgcolor="#00CCCC">编号</td>
							<td bgcolor="#00CCCC">用户名</td>
							<td bgcolor="#00CCCC">密码</td>
							<td bgcolor="#00CCCC">性别</td>
							<td bgcolor="#00CCCC">身份证号码</td>
							<td bgcolor="#00CCCC">电话号码</td>
							<td bgcolor="#00CCCC">邮箱</td>
							<td bgcolor="#00CCCC">权限</td>
						</tr>
						<tr align="center" height="60">
							<td >${user.userid}</td>
							<td >${user.username}</td>
							<td >${user.password}</td>
							<td >${user.sex}</td>
							<td >${user.number}</td>
							<td >${user.phone}</td>
							<td >${user.mail}</td>
							<c:if test="${user.typeid==0}">
							<td >普通用户</td>
							</c:if>
							<c:if test="${user.typeid==1}">
							<td >医生</td>
							</c:if>
							<c:if test="${user.typeid==2}">
							<td >超级管理员</td>
							</c:if>
						</tr>
						<tr align="center" height="30" >
							<td bgcolor="#00CCCC" colspan="3">设置的问题</td>
							<td bgcolor="#00CCCC" colspan="2">设置的答案</td>
							<td  bgcolor="#00CCCC" colspan="2">地址</td>
							<td  bgcolor="#00CCCC" colspan="2">操作</td>
							
						</tr>
						<tr align="center" height="60">
							<td colspan="3">${user.question }</td>
							<td colspan="2">${user.answer }</td>
							<td colspan="2">${user.address }</td>
							<c:if test="${user.typeid==0}">
							<td ><a href="user!deluser?uid=${user.userid}">删除</a></td>
							</c:if>
							<c:if test="${user.typeid==1}">
							<td >&nbsp;</td>
							</c:if>
							<c:if test="${user.typeid==2}">
							<td >&nbsp;</td>
							</c:if>
							
						</tr>
						<tr>
							<td height="10" colspan="8"></td>
						</tr>
						<hr>
					</table>

			</c:forEach>
		</c:otherwise>
	</c:choose>
<tr>
	<td width="72%" valign="top" height="10%" align="center">
	<c:import url="/adminjsp/user/page.jsp" />
	</td>
</tr>