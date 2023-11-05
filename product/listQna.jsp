<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="product.common.DBDAO" %>
<%@ page import="product.common.DBVO" %>
<% DBDAO dao = new DBDAO();
   DBVO vo = new DBVO();
   
   List list = (List)request.getAttribute("ok");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>q&a</title>
</head>
<body>
<div align="center">
<table border=0  width=95%>
		<%
			int num=Integer.parseInt(request.getParameter("idx"));
			List ok = (List) dao.productQnaSelect(num);
			for(int i=0; i<ok.size(); i++){
				DBVO vv=(DBVO)ok.get(i);
				String name = vv.getId();
				String title= vv.getTitle();
				String content = vv.getQcontent();
				int pnum = vv.getPqnum();
		%>
		<tr>
			<td><%= name %></td>
			<td><a href="listQnaDetail.do?idx=<%=num%>&pnum=<%=pnum%>"><%=title%></a></td>
			<td><%= vv.getQdate() %></td>
			<td><a href="product/listQnaUpdate.jsp?idx=<%=num%>&pnum=<%=pnum%>&name=<%=name%>&title=<%=title%>&content=<%=content%>">수정</a>
			<a href="qnaDelete.do?idx=<%=num%>&pnum=<%=pnum%>">삭제</a></td>
		</tr>
		<tr><td colspan=4><hr></td></tr>
	<%
		}
	%>
	</table>
</div>
</body>
</html>