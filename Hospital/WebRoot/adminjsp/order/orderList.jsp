<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div align="center">
	<p style="font-size:18pt;">预约订单列表</p>
</div>

<div align="right">
	<a href="javascript:window.history.back(-1)">返回上页</a>
</div>
<table width="100%" height="100%">

	<tr>
		<td height="10"></td>
		<td height="10"></td>
	<Tr>
		<c:choose>
			<c:when test="${dlist.list==null||dlist.list.size()==0 }">
				<div align="center">
					<p style="font-size:18pt;">没有科室的预约挂号信息···</p>

				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${dlist.list}" var="ord">
					<tr>
						<td>挂号人：${ord.user.username}</td>
						<td align="right">挂号时间：${ord.otime}</td>
					</tr>
					<tr>
						<td colspan="2">
						<script type="text/javascript">
										function del(uid){
										var count = confirm("确定后，预约挂号订单被清除且不能恢\n复 ，请确定预约人已就诊");
										if(count){
												window.location.href="order!admindelOreder?uid="+uid;
										}else{
												return;
												}
					 
										}
										</script>
							<table width="100%" height="180" border="1" cellpadding="0"
								cellspacing="0" valign="top">
								<tr align="center" bgcolor="#00CCCC" height="50">
									<td>预约编号</td>
									<td>医院名称</td>
									<td>科室名称</td>
									<td>医生姓名</td>
									<td>预约人</td>
									<td>预约人电话号码</td>

									<td>挂号费(元)</td>
									<td>是否已付费</td>
									<td>操作</td>
								</tr>
								<tr align="center">
									<Td>${ord.oid }</Td>
									<td>XX第一医院</td>
									<td>${ord.kesi }</td>
									<td>${ord.dname}</td>
									<td>${ord.oname }</td>
									<td>${ord.ophone}</td>

									<td>${ord.oprice }</td>
									<td>是</td>
									<td><a href="javascript:del(${ord.oid })">已就诊</a></td>
								</tr>
							</table>
						</td>

					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</Tr>
</table>
<c:choose>
			<c:when test="${dlist.list==null||dlist.list.size()==0 }">
			
			</c:when>
			<c:otherwise>
				<tr>
		<td width="72%" valign="top" height="10%" align="center" colspan="2">
			<c:import url="/adminjsp/order/page.jsp" /></td>
	</tr>
			</c:otherwise>
			</c:choose>


