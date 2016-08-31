<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="JS/check.jsp"></script>

<%-- <table  width="30% " border="0" cellpadding="1" cellspacing="1">
	<tr>
		<td height="42"><img src="../images/lefttop.jpg" width="182"
			height="83"></td>
	</tr>
	<c:if test="${!user}" var="result">
		<tr>
			<table width="100%" border="1" cellpadding="1" cellspacing="1"
				background="../images/leftlogin.jpg">
				<form name="form1" method="post" action="Login_U.jsp">
					<tr>
						<td width="100%" height="24">会员名 <input name="username"
							type="text" size="16"></td>
						
					</tr>
					<tr>
						<td height="24">密&nbsp;&nbsp;码 <input name="PWD"
							type="password" size="16"
							onKeydown="if(event.keyCode==13) form1.submit();"></td>
						
					</tr>
					<tr>
						<td height="31"><input name="Button" type="button"
							class="btn_grey" value="注册"
							onClick="window.location.href='register.jsp'"> &nbsp; <input
							name="Submit2" type="button" class="btn_grey" value="登录"
							onClick="checkU(form1)"> <input name="Submit3"
							type="reset" class="btn_grey" value="重置"></td>
						
					</tr>
			</table>
		</tr>
	</c:if>
	<c:if test="false">
		<tr>
			<table width="100%" border="0" cellpadding="0" cellspacing="0"
				background="../images/leftlogin.jpg">
				<tr>
					<td width="94%" height="31" align="center" class="word_white">[${user
						}]您好!<br>您现在可以购物了!</td>
					<td width="6%">&nbsp;</td>
				</tr>
				<tr>
					<td height="24" align="center"><input name="Submit22"
						type="button" class="btn_grey" value="修改资料"
						onClick="window.location.href='modifyMember.jsp';"></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td height="24" align="center"><input name="Submit32"
						type="button" class="btn_grey" value="退出登录"
						onClick="window.location.href='logout.jsp';"></td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</tr>
	</c:if>
	<tr>
		<td height="43"><img src="../images/lefttop.jpg" width="182"
			height="43"></td>
	</tr>
	
			<tr>
				<td  height="24">科室1   科室2</td>
			</tr>
			<tr>
				<td  height="24">科室1   科室2</td>
			</tr>
			<tr>
				<td  height="24">科室1   科室2</td>
			</tr>
			<tr>
				<td  height="24">科室1   科室2</td>
			</tr>
			
</table> --%>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" valign="top" >
      <tr>
        <td height="42"><img src="../../images/lefttop.jpg" width="281"
			height="37"></td>
      </tr>
      <tr>
        <td height="51" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr align="center" >
						<td width="94%" height="24">会员名 <input name="username"
							type="text" size="16"></td>
							<td width="6%" >&nbsp;</td>
						
					</tr>
					<tr align="center">
						<td height="24">密&nbsp;&nbsp;码 <input name="PWD"
							type="password" size="16"
							onKeydown="if(event.keyCode==13) form1.submit();"></td>
							<td width="6%" >&nbsp;</td>
						
					</tr>
					<tr align="center">
						<td height="31"><input name="Button" type="button"
							class="btn_grey" value="注册"
							onClick="window.location.href='register.jsp'"> &nbsp; <input
							name="Submit2" type="button" class="btn_grey" value="登录"
							onClick="checkU(form1)"> <input name="Submit3"
							type="reset" class="btn_grey" value="重置"></td>
							<td width="6%" >&nbsp;</td>
						
					</tr>
        </table></td>
      </tr>
      <tr>
       <td height="43"><img src="../images/lefttop.jpg" width="182"
			height="43"></td>
      </tr>
      <tr>
        <td height="49"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
				<td  height="24">科室1</td> <td>   科室2</td>
			</tr>
			<tr>                      
				<td  height="24">科室1  </td> <td>科室2</td>
			</tr>                     
			<tr>                      
				<td  height="24">科室1  </td> <td>科室2</td>
			</tr>                     
			<tr>                      
				<td  height="24">科室1  </td> <td>科室2</td>
			</tr>
         
        </table></td>
      </tr>
    </table>

