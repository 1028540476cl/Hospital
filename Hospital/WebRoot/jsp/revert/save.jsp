<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<table width="980" border="0" cellpadding="0" cellspacing="0"
		align="center" background="../images/main.gif">
		<tr align="center">
						<td><script type="text/javascript">
						var answer="${save}";
						var mid = "${mid}";
						var rid = "${rid}";
						alert(answer);
						if(answer=="回复成功，正在跳转至留言列表..."){
						window.location.href="message!saveRevert?mid="+mid;
						}else if(answer=="请稍候..."){
						window.location.href="revert!delRevert?rid="+rid;
						}
						</script>
						<td>
					</tr>
	</table>

