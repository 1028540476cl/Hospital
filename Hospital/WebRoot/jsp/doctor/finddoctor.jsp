<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	String mainPage = (String) request.getAttribute("mainPage");
	if (mainPage == null || mainPage.equals("")) {
		mainPage = "default.jsp";
	}
%>
<%@ page language="java"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.*"%>
<title>医院预约挂号</title>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/ind.css" rel="stylesheet" />
<script type="text/javascript"
	src="<c:url value='/js/jquery-1.9.1.js'/>"></script>

<style type="text/css">
.sgBtn {
	width: 60px;
	height: 35px;
	line-height: 35px;
	margin-left: 20px;
	margin-top: 12px;
	text-align: center;
	background-color: #0095D9;
	color: #FFFFFF;
	float: left;
	border-radius: 5px;
}

.sgBtn1 {
	width: 60px;
	height: 35px;
	line-height: 35px;
	margin-left: 20px;
	margin-top: 12px;
	text-align: center;
	float: left;
	border-radius: 5px;
}
</style>
</head>
<body>
	<table width="980" border="1" cellpadding="0" cellspacing="0"
		align="center" background="../images/main.gif">
		<tr>
			<td height="80" colspan="2"><c:import url="../top.jsp" /></td>
		</tr>
		<tr>
			<td width="20%" height="430" valign="top" align="center" style="font-size:18pt;">
			<jsp:include page="/jsp/doctor/dleft.jsp" />
			</td>
			<td width="80%" valign="top" height="100%" rowspan="2">
				<div align="center">
					<p style="font-size:18pt;">具体信息界面</p>
				</div> <c:choose>

					<c:when test="${dlist==null||dlist.size() == 0 } ">
						<td align="center">★★对不起，未找到该医生的信息！★★</td>
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
						</c:forEach>

						<table width="100%" height="25%" border="0" cellpadding="0"
							cellspacing="0" valign="top">
							<tr>
								<td colspan="8" height="25"></td>
							</tr>
							<tr>
								<td colspan="8" height="60" align="center" bgcolor="#00CCCC"
									style="font-size:18pt; ">预约界面</td>
							</tr>
								<% /* String datetime = new SimpleDateFormat("MM-dd EEEE")
									.format(Calendar.getInstance().getTime());//获取系统时间
									String date = new SimpleDateFormat("EEEE")
									.format(Calendar.getInstance().getTime()); */
									
									/* Date d=new Date();
									Calendar calendar = Calendar.getInstance(); //得到日历
									calendar.setTime(d);//把当前时间赋给日历
									calendar.add(Calendar.DAY_OF_MONTH, -1);  //设置为前一天
									Date dBefore1 = calendar.getTime();
									calendar.add(Calendar.DAY_OF_MONTH, -1);  //设置为前两天
									Date dBefore2 = calendar.getTime();
									calendar.add(Calendar.DAY_OF_MONTH, -1);  //设置为前三天
									Date dBefore3 = calendar.getTime();
									calendar.add(Calendar.DAY_OF_MONTH, -1);  //设置为前四天
									Date dBefore4 = calendar.getTime();
									calendar.add(Calendar.DAY_OF_MONTH, -1);  //设置为前五天
									Date dBefore5 = calendar.getTime();
									calendar.add(Calendar.DAY_OF_MONTH, -1);  //设置为前六天
									Date dBefore6 = calendar.getTime();
									calendar.add(Calendar.DAY_OF_MONTH, -1);  //设置为前七天
									Date dBefore7 = calendar.getTime(); */
									
									Date d1=new Date();
									Calendar calendar = Calendar.getInstance(); //得到日历
									calendar.setTime(d1);
									calendar.add(Calendar.DAY_OF_MONTH, 1);  //设置为后一天
									Date dBehind1 = calendar.getTime();
									calendar.add(Calendar.DAY_OF_MONTH, 1);  //设置为后两天
									Date dBehind2 = calendar.getTime();
									calendar.add(Calendar.DAY_OF_MONTH, 1);  //设置为后三天
									Date dBehind3 = calendar.getTime();
									calendar.add(Calendar.DAY_OF_MONTH, 1);  //设置为后四天
									Date dBehind4 = calendar.getTime();
									calendar.add(Calendar.DAY_OF_MONTH, 1);  //设置为后五天
									Date dBehind5 = calendar.getTime();
									calendar.add(Calendar.DAY_OF_MONTH, 1);  //设置为后六天
									Date dBehind6 = calendar.getTime();
									calendar.add(Calendar.DAY_OF_MONTH, 1);  //设置为后七天
									Date dBehind7 = calendar.getTime();
									
									SimpleDateFormat sdf=new SimpleDateFormat("MM-ddEEEE"); //设置时间格式
									/* String defaultStartDate1 = sdf.format(dBefore1);    //格式化前一天
									String defaultStartDate2 = sdf.format(dBefore2);    //格式化前两天
									String defaultStartDate3 = sdf.format(dBefore3);    //格式化前三天
									String defaultStartDate4 = sdf.format(dBefore4);    //格式化前四天
									String defaultStartDate5= sdf.format(dBefore5);    //格式化前五天
									String defaultStartDate6 = sdf.format(dBefore6);    //格式化前六天
									String defaultStartDate7 = sdf.format(dBefore7);    //格式化前七天 */
									
									String StartDate1 = sdf.format(dBehind1);    //格式化后一天
									String StartDate2 = sdf.format(dBehind2);    //格式化后两天
									String StartDate3 = sdf.format(dBehind3);    //格式化后三天
									String StartDate4 = sdf.format(dBehind4);    //格式化后四天
									 String StartDate5= sdf.format(dBehind5);    //格式化后五天
									String StartDate6 = sdf.format(dBehind6);    //格式化后六天
									String StartDate7 = sdf.format(dBehind7);    //格式化后七天
									
									String defaultEndDate = sdf.format(d1);//格式化当前时间
									String strDate = null;
										int i = d1.getDay();
										switch (i) 
											{ 
											case 0:{ 
											strDate = "星期日" ;
											}break; 
											case 1:{ 
											strDate = "星期一" ;
											}break; 
											case 2:{ 
											strDate ="星期二" ;
											}break; 
											case 3:{ 
											strDate = "星期三" ;
											}break; 
											case 4:{ 
											strDate = "星期四" ;
											}break; 
											case 5:{ 
											strDate = "星期五" ;
											}break; 
											case 6:{ 
											strDate = "星期六"; 
											}break; 
											case 7:{ 
											strDate = "星期日" ;
											}break; 
											
											} 
									%>
										
							<tr bgcolor="#999999" align="center" height="40">
								<td>日期</td>
								<td><%=defaultEndDate %></td>
								<td><%=StartDate1 %></td>
								<td><%=StartDate2 %></td>
								<td><%=StartDate3 %></td>
								<td><%=StartDate4 %></td>
								<td><%=StartDate5%> </td>
								<td><%=StartDate6 %></td>		
							</tr>

							<c:forEach var="dlist" items="${dlist}">

								<script type="text/javascript">
									function checkFrom(txt,number,date) {
									var date = document.getElementById("date"+date+number).value;
									
										if (txt <= 0) {
											confirm(
													"今天的预约号码已经取完，请换其他医生或者下次来预约！",
													1);
											return;
										} else {
											var r = confirm("预约号码剩下" + txt
													+ "，是否进行挂号", 1);
											if (r) {

												window.location.href = "order!onlyOrder?oid="+number+"&&date="+date;
											} else {
												return;
											}

										}
									}
								</script>
								<!-- -----------星期四的排班--------- -->
								<%if("星期四".equals(strDate)) {%>
								<tr align="center" height="40">
									<td bgcolor="#CCCCCC">${dlist.remark }</td>
								<c:if test="${dlist.timef!=null }">
										<td >
										<input type="hidden" id="date4${dlist.timeid}" value="<%=defaultEndDate%>">
										<a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},4)"><div
													class="sgBtn">${dlist.timef }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timef==null }">
										<td><div class="sgBtn1">${dlist.timef }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timefi!=null }">
										<td><input type="hidden" id="date5${dlist.timeid}" value="<%=StartDate1%>">
										<a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},5)"><div
													class="sgBtn">${dlist.timefi }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timefi==null }">
										<td><div class="sgBtn1">${dlist.timefi }</div>
										</td>
									</c:if>
									<c:if test="${dlist.times!=null }">
										<td><input type="hidden" id="date6${dlist.timeid}" value="<%=StartDate2%>">
										<a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},6)"><div
													class="sgBtn">${dlist.times }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.times==null }">
										<td><div class="sgBtn1">${dlist.times }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timesi!=null }">
										<td><input type="hidden" id="date7${dlist.timeid}" value="<%=StartDate3%>">
										<a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},7)"><div
													class="sgBtn">${dlist.timesi }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timesi==null }">
										<td><div class="sgBtn1">${dlist.timesi }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timeo!=null }">
										<td><input type="hidden" id="date1${dlist.timeid}" value="<%=StartDate4%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},1)"><div
													class="sgBtn">${dlist.timeo }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timeo==null }">
										<td><div class="sgBtn1">${dlist.timeo }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timet!=null }">
										<td><input type="hidden" id="date2${dlist.timeid}" value="<%=StartDate5%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},2)"><div
													class="sgBtn">${dlist.timet }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timet==null }">
										<td><div class="sgBtn1">${dlist.timet }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timetr!=null }">
										<td><input type="hidden" id="date3${dlist.timeid}" value="<%=StartDate6%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},3)"><div
													class="sgBtn">${dlist.timetr }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timetr==null }">
										<td><div class="sgBtn1">${dlist.timetr }</div>
										</td>
									</c:if>
									</tr>
								<%} %>
								<!-- -----星期五的格式--------- -->
								<%if("星期五".equals(strDate)) {%>
								<tr align="center" height="40">
									<td bgcolor="#CCCCCC">${dlist.remark }</td>
									<c:if test="${dlist.timefi!=null }">
										<td><input type="hidden" id="date5${dlist.timeid}" value="<%=defaultEndDate%>">
										<a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},5)"><div
													class="sgBtn">${dlist.timefi }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timefi==null }">
										<td><div class="sgBtn1">${dlist.timefi }</div>
										</td>
									</c:if>
									<c:if test="${dlist.times!=null }">
										<td><input type="hidden" id="date6${dlist.timeid}" value="<%=StartDate1%>">
										<a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},6)"><div
													class="sgBtn">${dlist.times }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.times==null }">
										<td><div class="sgBtn1">${dlist.times }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timesi!=null }">
										<td><input type="hidden" id="date7${dlist.timeid}" value="<%=StartDate2%>">
										<a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},7)"><div
													class="sgBtn">${dlist.timesi }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timesi==null }">
										<td><div class="sgBtn1">${dlist.timesi }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timeo!=null }">
										<td><input type="hidden" id="date1${dlist.timeid}" value="<%=StartDate3%>">
										<a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},1)"><div
													class="sgBtn">${dlist.timeo }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timeo==null }">
										<td><div class="sgBtn1">${dlist.timeo }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timet!=null }">
										<td><input type="hidden" id="date2${dlist.timeid}" value="<%=StartDate4%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},2)"><div
													class="sgBtn">${dlist.timet }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timet==null }">
										<td><div class="sgBtn1">${dlist.timet }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timetr!=null }">
										<td><input type="hidden" id="date3${dlist.timeid}" value="<%=StartDate5%>">
										<a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},3)"><div
													class="sgBtn">${dlist.timetr }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timetr==null }">
										<td><div class="sgBtn1">${dlist.timetr }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timef!=null }">
										<td><input type="hidden" id="date4${dlist.timeid}" value="<%=StartDate6%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},4)"><div
													class="sgBtn">${dlist.timef }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timef==null }">
										<td><div class="sgBtn1">${dlist.timef }</div>
										</td>
									</c:if>
									</tr>
								<%} %>
								<!-- -----星期六的格式--------- -->
								<%if("星期六".equals(strDate)) {%>
								<tr align="center" height="40">
									<td bgcolor="#CCCCCC">${dlist.remark }</td>
								
									<c:if test="${dlist.times!=null }">
										<td><input type="hidden" id="date6${dlist.timeid}" value="<%=defaultEndDate%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},6)"><div
													class="sgBtn">${dlist.times }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.times==null }">
										<td><div class="sgBtn1">${dlist.times }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timesi!=null }">
										<td><input type="hidden" id="date7${dlist.timeid}" value="<%=StartDate1%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},7)"><div
													class="sgBtn">${dlist.timesi }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timesi==null }">
										<td><div class="sgBtn1">${dlist.timesi }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timeo!=null }">
										<td><input type="hidden" id="date1${dlist.timeid}" value="<%=StartDate2%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},1)"><div
													class="sgBtn">${dlist.timeo }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timeo==null }">
										<td><div class="sgBtn1">${dlist.timeo }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timet!=null }">
										<td><input type="hidden" id="date2${dlist.timeid}" value="<%=StartDate3%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},2)"><div
													class="sgBtn">${dlist.timet }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timet==null }">
										<td><div class="sgBtn1">${dlist.timet }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timetr!=null }">
										<td><input type="hidden" id="date3${dlist.timeid}" value="<%=StartDate4%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},3)"><div
													class="sgBtn">${dlist.timetr }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timetr==null }">
										<td><div class="sgBtn1">${dlist.timetr }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timef!=null }">
										<td><input type="hidden" id="date4${dlist.timeid}" value="<%=StartDate5%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},4)"><div
													class="sgBtn">${dlist.timef }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timef==null }">
										<td><div class="sgBtn1">${dlist.timef }</div>
										</td>
									</c:if>
									
									<c:if test="${dlist.timefi!=null }">
										<td><input type="hidden" id="date5${dlist.timeid}" value="<%=StartDate6%>">
										<a href="javascript:checkFrom(${dlist.number },${dlist.timeid},5)"><div
													class="sgBtn">${dlist.timefi }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timefi==null }">
										<td><div class="sgBtn1">${dlist.timefi }</div>
										</td>
									</c:if>
									</tr>
								<%} %>
								<!-- -----星期日的格式--------- -->
								<%if("星期日".equals(strDate)) {%>
								<tr align="center" height="40">
									<td bgcolor="#CCCCCC">${dlist.remark }</td>
									<c:if test="${dlist.timesi!=null }">
										<td><input type="hidden" id="date7${dlist.timeid}" value="<%=defaultEndDate%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},7)"><div
													class="sgBtn">${dlist.timesi }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timesi==null }">
										<td><div class="sgBtn1">${dlist.timesi }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timeo!=null }">
										<td><input type="hidden" id="date1${dlist.timeid}" value="<%=StartDate1%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},1)"><div
													class="sgBtn">${dlist.timeo }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timeo==null }">
										<td><div class="sgBtn1">${dlist.timeo }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timet!=null }">
										<td><input type="hidden" id="date2${dlist.timeid}" value="<%=StartDate2%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},2)"><div
													class="sgBtn">${dlist.timet }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timet==null }">
										<td><div class="sgBtn1">${dlist.timet }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timetr!=null }">
										<td><input type="hidden" id="date3${dlist.timeid}" value="<%=StartDate3%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},3)"><div
													class="sgBtn">${dlist.timetr }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timetr==null }">
										<td><div class="sgBtn1">${dlist.timetr }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timef!=null }">
										<td><input type="hidden" id="date4${dlist.timeid}" value="<%=StartDate4%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},4)"><div
													class="sgBtn">${dlist.timef }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timef==null }">
										<td><div class="sgBtn1">${dlist.timef }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timefi!=null }">
										<td><input type="hidden" id="date5${dlist.timeid}" value="<%=StartDate5%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},5)"><div
													class="sgBtn">${dlist.timefi }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timefi==null }">
										<td><div class="sgBtn1">${dlist.timefi }</div>
										</td>
									</c:if>
									<c:if test="${dlist.times!=null }">
										<td><input type="hidden" id="date6${dlist.timeid}" value="<%=StartDate6%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},6)"><div
													class="sgBtn">${dlist.times }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.times==null }">
										<td><div class="sgBtn1">${dlist.times }</div>
										</td>
									</c:if>
									</tr>
								<%} %>
								<!-- -----星期一的格式--------- -->
								<%if("星期一".equals(strDate)) {%>
								<tr align="center" height="40">
									<td bgcolor="#CCCCCC">${dlist.remark }</td>
									<c:if test="${dlist.timeo!=null }">
										<td><input type="hidden" id="date1${dlist.timeid}" value="<%=defaultEndDate%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},1)"><div
													class="sgBtn">${dlist.timeo }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timeo==null }">
										<td><div class="sgBtn1">${dlist.timeo }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timet!=null }">
										<td><input type="hidden" id="date2${dlist.timeid}" value="<%=StartDate1%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},2)"><div
													class="sgBtn">${dlist.timet }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timet==null }">
										<td><div class="sgBtn1">${dlist.timet }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timetr!=null }">
										<td><input type="hidden" id="date3${dlist.timeid}" value="<%=StartDate2%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},3)"><div
													class="sgBtn">${dlist.timetr }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timetr==null }">
										<td><div class="sgBtn1">${dlist.timetr }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timef!=null }">
										<td><input type="hidden" id="date4${dlist.timeid}" value="<%=StartDate3%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},4)"><div
													class="sgBtn">${dlist.timef }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timef==null }">
										<td><div class="sgBtn1">${dlist.timef }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timefi!=null }">
										<td><input type="hidden" id="date5${dlist.timeid}" value="<%=StartDate4%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},5)"><div
													class="sgBtn">${dlist.timefi }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timefi==null }">
										<td><div class="sgBtn1">${dlist.timefi }</div>
										</td>
									</c:if>
									<c:if test="${dlist.times!=null }">
										<td><input type="hidden" id="date6${dlist.timeid}" value="<%=StartDate5%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},6)"><div
													class="sgBtn">${dlist.times }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.times==null }">
										<td><div class="sgBtn1">${dlist.times }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timesi!=null }">
										<td><input type="hidden" id="date7${dlist.timeid}" value="<%=StartDate6%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},7)"><div
													class="sgBtn">${dlist.timesi }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timesi==null }">
										<td><div class="sgBtn1">${dlist.timesi }</div>
										</td>
									</c:if>
									</tr>
								<%} %>
								<!-- -----星期二的格式--------- -->
								<%if("星期二".equals(strDate)) {%>
								<tr align="center" height="40">
									<td bgcolor="#CCCCCC">${dlist.remark }</td>
								
									<c:if test="${dlist.timet!=null }">
										<td><input type="hidden" id="date2${dlist.timeid}" value="<%=defaultEndDate%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},2)"><div
													class="sgBtn">${dlist.timet }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timet==null }">
										<td><div class="sgBtn1">${dlist.timet }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timetr!=null }">
										<td><input type="hidden" id="date3${dlist.timeid}" value="<%=StartDate1%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},3)"><div
													class="sgBtn">${dlist.timetr }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timetr==null }">
										<td><div class="sgBtn1">${dlist.timetr }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timef!=null }">
										<td><input type="hidden" id="date4${dlist.timeid}" value="<%=StartDate2%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},4)"><div
													class="sgBtn">${dlist.timef }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timef==null }">
										<td><div class="sgBtn1">${dlist.timef }</div>
										</td>
									</c:if>
									
									<c:if test="${dlist.timefi!=null }">
										<td><input type="hidden" id="date5${dlist.timeid}" value="<%=StartDate3%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},5)"><div
													class="sgBtn">${dlist.timefi }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timefi==null }">
										<td><div class="sgBtn1">${dlist.timefi }</div>
										</td>
									</c:if>
									<c:if test="${dlist.times!=null }">
										<td><input type="hidden" id="date6${dlist.timeid}" value="<%=StartDate4%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},6)"><div
													class="sgBtn">${dlist.times }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.times==null }">
										<td><div class="sgBtn1">${dlist.times }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timesi!=null }">
										<td><input type="hidden" id="date7${dlist.timeid}" value="<%=StartDate5%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},7)"><div
													class="sgBtn">${dlist.timesi }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timesi==null }">
										<td><div class="sgBtn1">${dlist.timesi }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timeo!=null }">
										<td><input type="hidden" id="date1${dlist.timeid}" value="<%=StartDate6%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},1)"><div
													class="sgBtn">${dlist.timeo }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timeo==null }">
										<td><div class="sgBtn1">${dlist.timeo }</div>
										</td>
									</c:if>
									</tr>
								<%} %>
								<!-- -----星期三的格式--------- -->
								<%if("星期三".equals(strDate)) {%>
								<tr align="center" height="40">
									<td bgcolor="#CCCCCC">${dlist.remark }</td>
								
									
									<c:if test="${dlist.timetr!=null }">
										<td><input type="hidden" id="date3${dlist.timeid}" value="<%=StartDate6%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},3)"><div
													class="sgBtn">${dlist.timetr }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timetr==null }">
										<td><div class="sgBtn1">${dlist.timetr }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timef!=null }">
										<td><input type="hidden" id="date4${dlist.timeid}" value="<%=StartDate1%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},4)"><div
													class="sgBtn">${dlist.timef }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timef==null }">
										<td><div class="sgBtn1">${dlist.timef }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timefi!=null }">
										<td><input type="hidden" id="date5${dlist.timeid}" value="<%=StartDate2%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},5)"><div
													class="sgBtn">${dlist.timefi }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timefi==null }">
										<td><div class="sgBtn1">${dlist.timefi }</div>
										</td>
									</c:if>
									<c:if test="${dlist.times!=null }">
										<td><input type="hidden" id="date6${dlist.timeid}" value="<%=StartDate3%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},6)"><div
													class="sgBtn">${dlist.times }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.times==null }">
										<td><div class="sgBtn1">${dlist.times }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timesi!=null }">
										<td><input type="hidden" id="date7${dlist.timeid}" value="<%=StartDate4%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},7)"><div
													class="sgBtn">${dlist.timesi }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timesi==null }">
										<td><div class="sgBtn1">${dlist.timesi }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timeo!=null }">
										<td><input type="hidden" id="date1${dlist.timeid}" value="<%=StartDate5%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},1)"><div
													class="sgBtn">${dlist.timeo }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timeo==null }">
										<td><div class="sgBtn1">${dlist.timeo }</div>
										</td>
									</c:if>
									<c:if test="${dlist.timet!=null }">
										<td><input type="hidden" id="date2${dlist.timeid}" value="<%=StartDate6%>"><a
											href="javascript:checkFrom(${dlist.number },${dlist.timeid},2)"><div
													class="sgBtn">${dlist.timet }</div>
										</a></td>
									</c:if>
									<c:if test="${dlist.timet==null }">
										<td><div class="sgBtn1">${dlist.timet }</div>
										</td>
									</c:if>
									</tr>
								<%} %>
							</c:forEach>

						</table>

					</c:otherwise>

				</c:choose></td>
		</tr>
		
		<tr>
			<td height="136" colspan="2" valign="top"><c:import
					url="../bottom.jsp" /></td>
		</tr>
	</table>
</body>
</html>
