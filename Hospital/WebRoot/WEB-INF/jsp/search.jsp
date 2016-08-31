<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<form name="form2" method="post" action="search_deal.jsp">
	<table width="100%" height="23" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td colspan="2" height="7"></td>
		</tr>
		<tr>
			<td width="85%">请输入查询条件： <select name="type" class="textarea">
					<option value="0" selected>全部分类</option>
					<c:forEach var="home" items="${list}">
						<option value="${home.id }">${home.name}</option>
					</c:forEach>
			</select> <input name="key" type="text" class="txt_grey" size="33"></td>
			<td width="15%"><input name="search" type="submit"
				class="btn_grey" value="搜索">
			</td>
		</tr>
	</table>
</form>