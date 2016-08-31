<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${user.typeid==0 }">
<div align="center">
	<p style="font-size:18pt;">我的留言列表</p>

</div>
<div align="right">
	<a href="message!addMessage">添加留言</a>
</div>

	<c:choose>
		<c:when test="${dlist.totalRecords==0 }">
			<div align="center">
				<p style="font-size:18pt;">我的留言列表为空，请先<a style="color: red" href="message!addMessage">添加留言</a></p>

			</div>

		</c:when>
		<c:otherwise>
			<c:forEach items="${dlist.list}" var="message">

				<table width="100%" height="100%" border="0" cellpadding="0"
					cellspacing="0" valign="top">
					<tr>
						<td height="10"></td>
					</tr>
					<tr>
					<tr>
						<td bgcolor="#00CCCC">【${message.title }】</td>
					</tr>
					<tr>
					<tr>
						<td height="20"></td>
					</tr>
					<tr>
						<td>${message.contert }</td>
					</tr>

					<tr>
						<td align="right">${message.user.username
							}&nbsp;&nbsp;&nbsp;${message.cretaTime}&nbsp;&nbsp;&nbsp; 
							<script type="text/javascript">
				function update(text){
				var type = document.getElementById("type"+text).value;
				if(type==1){
				alert("请输入你要操作的类型···");
				return;
				}else if(type==2){
				window.location.href="message!delMessage?mid="+text;
				}else{
				window.location.href="message!updateMessage?mid="+text;
				}
				}
				</script> <select id="type${message.mid}" name="type" class="textarea">
								<option value="1" style="font-size: 14px">操作</option>
								<option value="2" style="font-size: 14px">删除</option>
								<option value="3" style="font-size: 14px">修改</option>
						</select> <input type="button" onclick="update(${message.mid})"
							class="btn_grey" value="确定"></td>
					</tr>

					<tr>
						<td>【医生回复：】</td>
					</tr>
					<c:if test="${message.revert==null}">
						<tr>
							<td>还未回复</td>
						</tr>
					</c:if>
					<!-- 判断医生是否回复的分割线 -->
					<c:if test="${message.revert!=null}">
						<tr>
							<td>${message.revert.contert}</td>
						</tr>
						<tr>
							<td align="right">${message.revert.rname}&nbsp;&nbsp;&nbsp;${message.revert.revertTime}</td>
						</tr>
					</c:if>
					<tr>
						<td height="20"></td>
					</tr>
					<hr>
				</table>

			</c:forEach>
		</c:otherwise>
	</c:choose>
</c:if>

<!-- 	-------------------------------------------------------------------------------------------------
 -->
 <c:if test="${user.typeid==1||user.typeid==2}">
<div align="center">
	<p style="font-size:18pt;">留言列表</p>

</div>
	<c:choose>
		<c:when test="${dlist.totalRecords==0 }">
			<div align="center">
				<p style="font-size:18pt;">留言列表为空</p>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach items="${dlist.list}" var="message">
				<script type="text/javascript">
				function revert(text) {
					var con = "recontert"+text;
					var contert = document.getElementById(con).value;
					
					if (contert == null || contert == " "){
						alert("请输入回复的内容···");
						return;
					}else{
						window.location.href="revert!saveRevert?mid="+text+"&contert="+contert;
					}
				}
			</script>
					<table width="100%" height="100%" border="0" cellpadding="0"
						cellspacing="0" valign="top">
						<tr>
							<td height="10"></td>
						</tr>
						<tr>
						<tr>
							<td bgcolor="#00CCCC">【${message.title }】</td>
						</tr>
						<tr>
						<tr>
							<td height="20"></td>
						</tr>
						<tr>
							<td>${message.contert }</td>
						</tr>
						<tr>
							<td height="10"></td>
						</tr>
						<tr>
							<td >【回复：】</td>
						</tr>
						<c:if test="${message.revert==null}">
						<tr>
							<td align="center"><textarea id="recontert${message.mid}" rows="4" cols="80"
									name="contert${message.mid}" wrap="hard"></textarea>
							</td>
						</tr>
						<tr>
							<td height="10"></td>
						</tr>
						<tr>

							<td align="center" height="20"><input type="button"
								onclick="revert(${message.mid})" value="回复">&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="reset" value="重置">
							</td>
						</tr>
						</c:if>
						<!-- 判断医生是否回复的分割线 -->
						<c:if test="${message.revert!=null}">
						<tr>
							<td>${message.revert.contert}</td>
						</tr>
						<tr>
				<script type="text/javascript">
				function updateRevert(text,text1){
				var type = document.getElementById("type"+text).value;
				if(type==1){
				window.location.href="message!updateRevert?rid="+text+"&mid="+text1;
				}else {
				window.location.href="message!upRevert?rid="+text+"&mid="+text1;
			}
				}
				</script> 
							<td align="right">${message.revert.rname}&nbsp;&nbsp;&nbsp;${message.revert.revertTime}&nbsp;&nbsp;&nbsp;
							<select id="type${message.revert.rid}" name="type" class="textarea">
								<option value="1" selected="selected"  style="font-size: 14px">修改</option>
								<option value="2" style="font-size: 14px">删除</option>
								
						</select> <input type="button" onclick="updateRevert(${message.revert.rid},${message.mid})" class="btn_grey" value="确定">
							</td>
						</tr>
					</c:if>
						
						<hr>
					</table>

			</c:forEach>
		</c:otherwise>
	</c:choose>
	</c:if>

<tr>
	<td width="72%" valign="top" height="20%" align="center">
	<c:import url="/jsp/message/page.jsp" />
	</td>
</tr>

