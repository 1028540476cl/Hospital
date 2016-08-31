<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<table width="700" border="0" cellpadding="0" cellspacing="0"
		align="center" >
		<tr align="center">
						<td>
						<script type="text/javascript">
						var oid = ${oid};
						if(oid==0){
						setTimeout("location='time!adminorderdel'",100);
						}else{
						setTimeout("location='order!checkOrder?pageNo=1'",2000);
						}
						
						</script>
						<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0"align="center">
						<tr><td height="180"></td></tr>
						<tr><td>
						<p align="center" style="font-size: 18pt;color: red;" >${save}</p>
						</td></tr>
						 
						 </table>
					</td>
					</tr>
	</table>
