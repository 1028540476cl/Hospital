<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div align="center">
	<p style="font-size:18pt;">设置该医生排班表</p>
</div>
<form action="time!admingAddTime" method="post">

	<table width="100%" height="100%" border="0" cellpadding="0"
		cellspacing="0" valign="top">
		<tr>
			<td colspan="9" height="25"></td>
		</tr>
		<tr>
			<td colspan="9" height="60" align="center" bgcolor="#00CCCC"
				style="font-size:18pt; ">星期表</td>
		</tr>
		<tr bgcolor="#999999" align="center" height="40">
			<td>日期</td>
			<td>周日</td>
			<td>周一</td>
			<td>周二</td>
			<td>周三</td>
			<td>周四</td>
			<td>周五</td>
			<td>周六</td>
			<td>号码数</td>
		</tr>
		<tr align="center" height="40">
			<td><input type="hidden" value="上午" name=time1.remark>上午</td>
			<td>确定:<input type="checkbox" value="预约" name=time1.timesi>
			</td>
			<td>确定:<input type="checkbox" value="预约"  name=time1.timeo>
			</td>
			<td>确定:<input type="checkbox"  value="预约" name=time1.timet>
			</td>
			<td>确定:<input type="checkbox" value="预约" name=time1.timetr>
			</td>
			<td>确定:<input type="checkbox" value="预约"  name=time1.timef>
			</td>
			<td>确定:<input type="checkbox" value="预约" name=time1.timefi>
			</td>
			<td>确定:<input type="checkbox"  value="预约" name=time1.times>
			</td>
			<td>数量:<input type="text"  name=time1.number>
			</td>
		</tr>
		<tr align="center" height="40">
			<td><input type="hidden" value="下午" name=time2.remark>下午</td>
			<td>确定:<input type="checkbox" name=time2.timesi value="预约">
			</td>
			<td>确定:<input type="checkbox" name=time2.timeo value="预约">
			</td>
			<td>确定:<input type="checkbox" name=time2.timet value="预约">
			</td>
			<td>确定:<input type="checkbox" name=time2.timetr value="预约">
			</td>
			<td>确定:<input type="checkbox" name=time2.timef value="预约">
			</td>
			<td>确定:<input type="checkbox" name=time2.timefi value="预约">
			</td>
			<td>确定:<input type="checkbox" name=time2.times value="预约">
			</td>
			<td>数量:<input type="text"  name=time2.number>
			</td>
		</tr>
		<tr align="center" height="40">
			<td colspan="4"><input type="submit"  value="确定">
			</td>
			<td colspan="5"><input type="button"
				onclick="javascript:window.location.href='doctor!adminDoctor?type=${doc.did}'" value="上一步">
			</td>
		</tr>
	</table>
</form>