<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
		
		sign标记为1的page
		------------------------------------------------------------
	 -->
<c:if test="${sign==1}">
		<div style="text-align: right; margin-top: 10px;margin-right: 20px;">
			<c:choose>
				<c:when test="${dlist.pageNo>dlist.topPageNo}">
				
					<a
						href="doctor!findDepartment?typeid=${typeid }&&pageNo=${dlist.topPageNo}">第一页</a>
					<a
						href="doctor!findDepartment?typeid=${typeid }&&pageNo=${dlist.previousPageNo}">上一页</a>
				
				</c:when>
				<c:otherwise>
		首页　上一页
</c:otherwise>
			</c:choose>
			<SPAN style="color: red;"> 第[${dlist.pageNo}]页 </SPAN>
			<c:choose>
		<c:when test="${dlist.pageNo<dlist.bottomPageNo}">
					<a
						href="doctor!findDepartment?typeid=${typeid }&&pageNo=${dlist.nextPageNo}">下一页</a>
					<a
						href="doctor!findDepartment?typeid=${typeid }&&pageNo=${dlist.bottomPageNo}">最后页</a>
				</c:when>
				<c:otherwise>
下一页　尾页
</c:otherwise>
			</c:choose>
			<SPAN style="color: red;">总[${dlist.totalPages}]页 </SPAN>
		</div>
		
	</c:if>
	<!-- 
		
		sign标记为0的page
		------------------------------------------------------------
	 -->
	
	<c:if test="${sign==0 }">
		<div style="text-align: right; margin-top: 10px;margin-right: 20px;">
			<c:choose>
				<c:when test="${dlist.pageNo>dlist.topPageNo}">
					<a href="doctor!findAllDepartment?pageNo=${dlist.topPageNo}">第一页</a>
					<a href="doctor!findAllDepartment?pageNo=${dlist.previousPageNo}">上一页</a>
				</c:when>
				<c:otherwise>
		首页　上一页
</c:otherwise>
			</c:choose>
			<SPAN style="color: red;"> 第[${dlist.pageNo}]页 </SPAN>
			<c:choose>
				<c:when test="${dlist.pageNo<dlist.bottomPageNo}">

					<a href="doctor!findAllDepartment?pageNo=${dlist.nextPageNo}">下一页</a>
					<a href="doctor!findAllDepartment?pageNo=${dlist.bottomPageNo}">最后页</a>
				</c:when>
				<c:otherwise>
下一页　尾页
</c:otherwise>
			</c:choose>
			<SPAN style="color: red;">总[${dlist.totalPages}]页 </SPAN>
		</div>
		</c:if>
		<!-- 
		
		sign标记为2的page
		------------------------------------------------------------
	 -->
	 <c:if test="${sign==2 }">
		<div style="text-align: right; margin-top: 10px;margin-right: 20px;">
			<c:choose>
				<c:when test="${dlist.pageNo>dlist.topPageNo}">
					<a href="doctor!searchDepartment?key=${key}&&type=${typeid }&&pageNo=${dlist.topPageNo}">第一页</a>
					<a href="doctor!searchDepartment?key=${key}&&type=${typeid }&&pageNo=${dlist.previousPageNo}">上一页</a>
				</c:when>
				<c:otherwise>
		首页　上一页
</c:otherwise>
			</c:choose>
			<SPAN style="color: red;"> 第[${dlist.pageNo}]页 </SPAN>
			<c:choose>
				<c:when test="${dlist.pageNo<dlist.bottomPageNo}">

					<a href="doctor!searchDepartment?key=${key}&&type=${typeid }&&pageNo=${dlist.nextPageNo}">下一页</a>
					<a href="doctor!searchDepartment?key=${key}&&type=${typeid }&&pageNo=${dlist.bottomPageNo}">最后页</a>
				</c:when>
				<c:otherwise>
下一页　尾页
</c:otherwise>
			</c:choose>
			<SPAN style="color: red;">总[${dlist.totalPages}]页 </SPAN>
		</div>
	</c:if>
	
