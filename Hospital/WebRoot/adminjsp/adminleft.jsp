<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>

	<table width="100%" height="500" border="0" cellpadding="0"
		cellspacing="0">
		<tr hight="100">

			<td ><img src="../bank_img/1.jpg"></td>
			<td style="font-size: 12pt; color: red">欢迎你${user.username }</td>
		</tr>
		<c:if test="${user.typeid==2}">
		<tr>
			<td colspan="2" height="30"></td>
		</tr>
		
		<tr>
	
			<td colspan="2"><a href="adminuser!listuser?pageNo=1"><img src="../bank_img/6.jpg"></a>
			
			</td>
		</tr>
		<tr>
			<td colspan="2" height="10"></td>
		</tr>
		<tr>

			<td colspan="2" ><a href="admindepartment!allDepater"><img src="../bank_img/2.jpg"></a>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="10"></td>
		</tr>
		<tr>
			<td colspan="2"><a href="admindoctor!adminListDoctor?pageNo=1"><img src="../bank_img/3.jpg"></a>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="10"></td>
		</tr>
		<tr>
			<td colspan="2" ><a href="message!adminexecute?pageNo=1"><img src="../bank_img/4.jpg">
			</a></td>
		</tr>
		<tr>
			<td colspan="2" height="10"></td>
		</tr>
		<tr>
			<td colspan="2" ><a href="order!checkOrder?pageNo=1"><img src="../bank_img/5.jpg"></a>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="30"></td>
		</tr>
</c:if>
<c:if test="${user.typeid==1}">
<tr>
			<td colspan="2" height="30"></td>
		</tr>
<tr>
			<td colspan="2" ><a href="message!adminexecute?pageNo=1"><img src="../bank_img/4.jpg">
			</a></td>
		</tr>
		<tr>
			<td colspan="2" height="10"></td>
		</tr>
		<tr>
			<td colspan="2" ><a href="order!DcheckOrder?pageNo=1"><img src="../bank_img/5.jpg"></a>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="30"></td>
		</tr>

</c:if>
	</table>
</div>