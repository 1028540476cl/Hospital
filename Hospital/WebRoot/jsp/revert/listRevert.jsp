<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<tr>
	<td width="72%" valign="top" height="10%" align="center">
	<c:import url="/jsp/message/page.jsp" />
	</td>
</tr>