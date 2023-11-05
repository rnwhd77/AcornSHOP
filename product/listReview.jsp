<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page session="true"%>
<%@ page import="product.common.DBDAO" %>
<%@ page import="product.common.DBVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review</title>
</head>
<body>
<%
DBDAO dao = new DBDAO();
DBVO vo = new DBVO();

int pnum=Integer.parseInt(request.getParameter("idx"));
List ok = (List) dao.productReviewSelect(pnum);
%>
<div align=center>
	<table border=0 width=100%>
		<%
			for(int i=0; i<ok.size(); i++){
				DBVO vv=(DBVO)ok.get(i);
				int star = vv.getStar();
				String content = vv.getRcontent();
				int num = vv.getPrnum();
				String name = vv.getId();
		%>
		<tr>
			<td colspan=3><%= content %></td>
		</tr>
		<tr>
			<td><font color="ashblue"><%= name %></font></td>
			<td><font color="#ffbc00"><% for(int a=1; a<=star; a++) {out.print("★");} 
				for(int a=1; a<=5-star; a++) {out.print("☆");} %></font></td>
			<td><%= vv.getRdate() %></td>
			
		</tr>
		<tr><td colspan=3><hr></td></tr>
	<%
		}
	%>
	</table>
</div>
</body>
</html>