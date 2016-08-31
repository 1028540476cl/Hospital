<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>医院预约挂号</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/ind.css" rel="stylesheet" />

</head>
<body>
	<table width="980" border="1" cellpadding="0" cellspacing="0"
		align="center" background="../images/main.gif">
		<tr>
			<td height="80" colspan="2"><c:import url="../top.jsp" />
			</td>
		</tr>
		<tr>
			<td width="28%" height="400" valign="top"><c:import
					url="../left.jsp" /></td>
			<td width="72%" valign="top">
				<table width="100%" height="430" border="0" cellpadding="0"
					cellspacing="0" valign="top">
					<tr>
						<td valign="top" align="center" height="35"><c:import
								url="../search.jsp" />
						</td>
					</tr>
					<tr>

						<td valign="top" align="center">
								<b style="font-size: 18pt">特色科室&nbsp;&nbsp;</b>
							<table border="1" cellpadding="0" cellspacing="0">
								<tr align="center" bgcolor="#00CCCC">
									<td width="8%">科室</td>
									<td width="35%">简介</td>
									<td width="58%">优势项目</td>
								</tr>
								<tr align="center">
									<td><a href="doctor!findDepartment?typeid=1&&pageNo=1">骨科</a>
									</td>
									<td align="left">&nbsp;&nbsp;骨科是我医院特色专科，
										擅长治疗颈，肩，腰，腿痛等骨科疾病。在继承传统的基础上，突破了常规方法的禁锢，遵循“内外兼治、动静结合”的原则，主要治疗骨折、股骨头坏死、骨髓炎、骨囊肿、骨结核、膝关节退行性病变
										骨不连接，腰椎间盘突出症，骨质疏松，肩周炎，腰腿痛，强直性脊柱炎，各类型股骨颈骨折等骨病，
										并可进行目前世界上最为先进的人工关节置换。</td>
									<td align="left">1、腰、颈椎间盘突出症的微创手术治疗和非手术治疗<br>
										2、腰椎滑脱手术矫治<br> 3、脊柱骨折的手术复位固定<br> 4、颈、胸、腰椎管狭窄的手术治疗<br>
										5、椎管内肿瘤的手术治疗<br> 6、脊椎结核、肿瘤的手术治疗<br> 7、脊柱侧弯狡治<br>
										8、颈椎病的治疗</td>
								</tr>
								<tr align="center">
									<td><a href="doctor!findDepartment?typeid=5&&pageNo=1">普外科</a>
									</td>
									<td align="left">&nbsp;&nbsp;普外科是我院外科系统最大的专科，也是我院重点学科之一,经过60年
										的发展和几代外科人的努力，普外科拥有技术精湛、技术先进的专家型治疗团队，设备先进、服务规范的诊疗环境，</td>
									<td align="left">1．腹腔镜微创治疗<br> 2. 肿瘤<br>
										3．开展特色甲状腺手术<br> 4．无张力网片修补术治腹股沟疝和腹壁切口疝<br> 5．外伤和急腹症手术</td>
								</tr>
							</table>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="136" colspan="2" align="top"><c:import
					url="../bottom.jsp" />
			</td>
		</tr>
	</table>
</body>
</html>
