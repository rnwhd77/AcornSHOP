<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="product.common.DBDAO" %>
<%@ page import="product.common.DBVO" %>
<% DBDAO dao = new DBDAO();
   DBVO vo = new DBVO();
   int qnum=Integer.parseInt(request.getParameter("qnum"));
   String name = (String)session.getAttribute("ID");
   int pnum=Integer.parseInt(request.getParameter("idx"));
   List ok = (List)dao.productAnswerSelect(pnum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>answer</title>
</head>
<body> 
<div align=center>
	<p><p><p><p>
	<table border=0 width=100%>
		<tr><td width=10%>답변 번호</td><td>답변 내용</td><td>답변 일자</td></tr>
		<tr><td colspan=3><hr style="border:solid 1pt black;"></td></tr>
		<%
			for(int i=0; i<ok.size(); i++){
				DBVO vv=(DBVO)ok.get(i);
				String content = vv.getQcontent();
				int rn = vv.getRnum();
				Date date = vv.getQdate();
		%>
			<tr><td><%=rn %></td><td><%=content %></td><td width=15%><%=date %></td></tr>
			<tr><td colspan=3><hr></td></tr>
		<%
			}
		%>
	</table>
</div>
</body>
</html>