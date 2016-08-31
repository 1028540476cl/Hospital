<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<table width="700" border="0" cellpadding="0" cellspacing="0"
		align="center" background="../images/main.gif">
		<tr align="center">
						<td><script type="text/javascript">
						var type=${type};
						 setTimeout("location='admindoctor!adminDlDoctor?pageNo=1&&type='+type",300);</script>
						 <p align="center" style="font-size: 18pt;color: red;" >${save}</p>
						<td>
					</tr>
	</table>