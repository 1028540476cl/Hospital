<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script  type="text/javascript">
function search(){
    		var type=document.getElementById("type").value;
    		var key=document.getElementById("key").value;
    		if(type==0&&key==""){
    		alert("����������һ����������");
    		return;
    		}else{
    		document.getElementById("search").submit();
    		}
    	}
</script>

<form id="search"  method="post" action="doctor!searchDepartment?pageNo=1">
	<table width="100%" height="23" border="0" cellpadding="0"
		cellspacing="0" align="center">
		<tr>
			<td colspan="2" height="20"></td>
		</tr>
		<tr>

			<td width="85%" style="font-size: 20px">�������������������� <select id="type" name="type" class="textarea">
					<option value="0" selected style="font-size: 12px">ȫ������</option>
					<c:forEach var="home" items="${list}">
						<option value="${home.id }">${home.name}</option>
					</c:forEach>
			</select><a style="font-size: 16px">ҽ����</a><input id="key" name="key" type="search" class="txt_grey" size="33"></td>
			<td width="15%"><input  type="button" onclick="search()" class="btn_grey" value="����">
			</td>
		</tr>
		</Table>

</form>