<%@ page language="java" import="java.util.*" import="cl.hospital.main.Doctor" import="javax.servlet.http.HttpServletRequest"
pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div align="center">
	<p style="font-size:18pt;">更改医生界面</p>
</div>
<script type="text/javascript">
	function addDoctor(){
	var dname      = document.getElementById("dname").value;
	var sex        = document.getElementById("sex").value;
    var department = document.getElementById("department").value;
    var picture        = document.getElementById("picture").value;
    var post        = document.getElementById("post").value;
    var description        = document.getElementById("description").value;
    if(dname==null||dname==""){
    alert("请输入医生姓名···");
    return;
    }else if(sex==null||sex==""){
    alert("请选择医生性别···");
    return;
    }else if(picture==null||picture==""){
    alert("请上传医生头像···");
    return;
    }else if(department==null||department==0){
    alert("请选择该医生的所属部门···");
    return;
    }else if(post==null||post==""){
    alert("请填写医生的职称····");
    return;
    
    }else if(description==null||description==""){
    alert("请填写医生的简介···");
    return;
    }else {
    document.getElementById("addDoc").submit();
    }

}	
</script>
<form  id="addDoc" action="time!adminUpDoctor?did=${doctor.did}&&sgin=1" method="post">
<table width="100%" height="100%" border="0" cellpadding="0"
		cellspacing="0" align="center">

		<tr align="center" height="80">
			<td >&nbsp;</td>
			<td ><input type="hidden" id = "did" name="doc.did" value="${doctor.did }"></td>
		</tr> 
		<tr height="40">
			<td align="center">&nbsp;&nbsp;&nbsp;姓名:</td>
			<td><input type="text" id="dname" name="doc.dname" value="${doctor.dname }">
			</td>
		</tr>

	
			 <%
			Doctor doctor = (Doctor)request.getAttribute("doctor");
			String sex=doctor.getSex();
			
			 %>
			
			<tr height="40">
			<td align="center">&nbsp;&nbsp;&nbsp;性别:</td>
			<td><input type="radio" id="sex" name="doc.sex" 
			 checked=<%=(sex.equals("男")?"checked":"")%> value="男">男<input type="radio" id="sex"
				name="doc.sex"   <%=(sex.equals("女")?"checked":"")%> value="女">女</td>
				</tr>
			
			<tr height="40">
			<td align="center">&nbsp;&nbsp;&nbsp;部门:</td>
			<Td ><select id="department" name="doc.typeid" class="textarea">
					<option value="0" selected style="font-size: 12px">全部部门</option>
					<c:forEach var="home" items="${list}">
						<option  value="${home.id}">${home.name}</option>
					</c:forEach>
			</select>&nbsp;&nbsp;&nbsp;${doctor.department.name }</Td>
			</tr>
		<tr height="40">
			<td align="center">&nbsp;&nbsp;&nbsp;图片:</td>
			<td><input type="file" size="12" id="picture" name="doc.picture" >
			</td>
		</tr>
		<tr height="60">
			<td align="center">&nbsp;&nbsp;&nbsp;职称:</td>
			<td><textarea id="post" name="doc.post" rows="1" cols="50">${doctor.post}</textarea>
			</td>
		</tr>
		<tr height="60">
			<td align="center">&nbsp;&nbsp;&nbsp;简介:</td>
			<td><textarea id="description" name="doc.description" rows="2" cols="50">${doctor.description}</textarea>
			</td>
		</tr>
		<tr align="center" height="60">
			<td align="left" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" height="20"
				onclick="javascript:window.history.back(-1)" value="取消">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" height="20"
				onclick="addDoctor()" value="下一页">
			</td>
		</tr>
	</table>
	

</form>
