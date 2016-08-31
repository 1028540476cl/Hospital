<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/ind.css" rel="stylesheet" />

</head>
<body>
	<table width="980" border="0" cellpadding="0" cellspacing="0"
		align="center" background="../images/main.gif">
		<tr>
			<td height="80" colspan="3"><c:import url="../top.jsp" />
			</td>
		</tr>
		<tr>
			<td width="10%" height="400" valign="top"></td>
			<td width="80%" valign="top" height="100%">

				<div align="center">
					<p style="font-size:18pt;">我的预约订单</p>
				</div>

				<div align="right">
					<a href="javascript:window.history.back(-1)">返回上页</a>
				</div>
				<table width="100%" height="80%">

					<tr>
						<td height="10"></td>
						<td height="10"></td>
					<Tr>
						<c:choose>
							<c:when test="${dlist.list==null||dlist.list.size()==0 }">
								<div align="center">
									<p style="font-size:18pt;">没有你的预约挂号信息，请先去<a style="color: red" href="doctor!findAllDepartment?pageNo=1">预约</a>挂号···</p>
									
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
										var count = confirm("删除订单后不能再恢复了， 且挂号\n费也不能退回，是否继续删除？");
										if(count){
												window.location.href="order!delOreder?uid="+uid;
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
													<td><a href="javascript:del(${ord.oid })">删除</a></td>
												</tr>
											</table>
										</td>
									
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<c:choose>
		<c:when test="${dlist.list==null||dlist.list.size()==0 }">
		
		</c:when>
		<c:otherwise>
		<tr>
						<td width="72%" valign="top" height="10%" align="center" colspan="2"><c:import url="../default/Opage.jsp"/></td>
						
					</Tr>
		</c:otherwise>
		</c:choose>
					
				</table>
			</td>
			<td width="10%" height="400" valign="top"></td>

		</tr>
		
		<tr>
			<td height="136" colspan="3" valign="top"><c:import
					url="../bottom.jsp" />
			</td>
		</tr>
	</table>
</body>
</html>
