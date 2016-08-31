<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div style="text-align: right; margin-top: 10px;margin-right: 20px;">
	<c:choose>
		<c:when test="${dlist.pageNo>dlist.topPageNo}">
			<a href="order!ordercheck?pageNo=${dlist.topPageNo}">第一页</a>
			<a href="order!ordercheck?pageNo=${dlist.previousPageNo}">上一页</a>
		</c:when>
		<c:otherwise>
		首页　上一页
</c:otherwise>
	</c:choose>
	<SPAN style="color: red;"> 第[${dlist.pageNo}]页 </SPAN>
	<c:choose>
		<c:when test="${dlist.pageNo<dlist.bottomPageNo}">
					
			<a href="order!ordercheck?pageNo=${dlist.nextPageNo}">下一页</a>
			<a href="order!ordercheck?pageNo=${dlist.bottomPageNo}">最后页</a>
		</c:when>
		<c:otherwise>
下一页　尾页
</c:otherwise>
	</c:choose>
	<SPAN style="color: red;">总[${dlist.totalPages}]页 </SPAN>
</div>