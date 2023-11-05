<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>​
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="mypage.common.DBVO" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="member_center">
		<form name=signin method=get onsubmit="return check()" action=/detailController>
		<table id=member_tableF>
			<tr>
				<%
					try{
					DBVO bb=(DBVO)request.getAttribute("detail");
				%>
				<td class="member_tr">
					&nbsp;id <%=bb.getId()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					&nbsp;password <%=bb.getPwd()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					&nbsp;이름 <%=bb.getName()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					&nbsp;성별 <%=bb.getEmail()%>
					<div id=member_hr></div>
				</td>
			</tr>
		
			<tr>
				<td class="member_tr">
					&nbsp;이메일  <%=bb.getEmail()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					&nbsp;연락처 <%=bb.getPhone()%>
					<div id=member_hr></div>
				</td>
			</tr>
	
		</table><br>
		<div id=member_bottom>
			<a href="memberEditPre.do?id=<%=bb.getId() %>"><input type=button value="수정하기" class="member_bt2"></a>
		</div>
		</form>
	</div>
<%
	}catch(Exception e){  System.out.println("edit 오류 : "+e.toString());}
%>	
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
</body>
</html>