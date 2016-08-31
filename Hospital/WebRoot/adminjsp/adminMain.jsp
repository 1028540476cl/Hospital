<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	String adminmainPage = (String) request.getAttribute("adminmainPage");
	if (adminmainPage == null || adminmainPage.equals("")) {
		adminmainPage = "adminDefault.jsp";
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../css/ind.css" rel="stylesheet" />
<title>医院预约系统后台</title>

<script type="text/javascript"
	src="<c:url value='/js/jquery-1.10.2.min.js'/>"></script>
<script type="text/javascript">
$(function(){
  $('#click_event').click(function(){
    if($('#hidden_enent').is(':hidden')){
      $('#hidden_enent').show();
      $('#click_event').val('取消增加');
    }
    else{
      $('#hidden_enent').hide();
      $('#click_event').val('增加部门');
    }
  })
})
</script>
<script type="text/javascript">
$(function(){
  $('#click_event1').click(function(){
    if($('#hidden_enent1').is(':hidden')){
      $('#hidden_enent1').show();
      $('#click_event1').val('取消');
    }
    else{
      $('#hidden_enent1').hide();
      $('#click_event1').val('更改部门');
    }
  })
})
</script>
</head>

<body>
	<DIV>
		<p>
		<P>
	</DIV>
	<table width="980" border="1" align="center" cellpadding="0"
		cellspacing="0" background="../images/back.gif">
		<tr>
			<td width="20%" rowspan="2"><c:import url="adminleft.jsp" />
			</td>
			<td height="100%"><img src="../images/admintop.jpg">
			</td>
		</tr>
		<tr>
			<td height="450" valign="top">
				<table width="100%"  hight="300" border="0" cellpadding="0"cellspacing="0">
					<tr>
						
						<td height="10"><b style="font-size: 14pt">当前位置|<a href="adminuser!defaultjsp">首页</a>
						<c:if test="${dlist!=null}">
						&gt;<a href="javascript:window.history.back(-1)">返回</a></c:if>
						</b></td>
					
					</tr>
					<tr>
						<td align="right" style="font-size: 14pt"><input  type="button" class="btn_grey" value="退出登录"
							onClick="window.location.href='user!loginout';"></td>
					</tr>
						
					<tr>
						<td ><c:import url="<%=adminmainPage%>" />
						</td>
					</tr>
					
				
				</table></td>
		</tr>
	
		<tr>
			<td height="30"  colspan="2"><c:import url="../jsp/bottom.jsp" />
			</td>
		</tr>
	</table>
</body>
</html>
