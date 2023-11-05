<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="product.common.DBDAO" %>
<%@ page import="product.common.DBVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review</title>
 <style>
*{text-decoration: none; margin-left:auto; margin-right:auto;}
#back_btn{width:90px; height:30px; color:#EFEDED; border:0px;}
.ac{color:black;}
.ac:hover{font-weight:bold;}
</style>
<jsp:include page="../top.jsp"></jsp:include>
</head>
<body>
<%
DBDAO dao = new DBDAO();
DBVO vo = new DBVO();

int pnum = (Integer)request.getAttribute("pnum");
List ok = (List)request.getAttribute("list");
String id = (String)session.getAttribute("ID");
if(id==null){ id="";}
%>
<div align=center>
<p><p>
	<table border=0 width=60%>
		<tr><td colspan=5><a href="./listDetail.do?idx=<%=pnum%>"><button id="back_btn" style="background-color:#535353;">이전으로</button></a></td></tr>
		<tr><td colspan=5><p></p></td></tr>
		<tr><td colspan=5><h3>리뷰목록</h3></td></tr>
		<tr>
		<td colspan=4>
		 <a class="ac" href="reviewAll.do?idx=<%=pnum%>&order=1">최신순</a>
		 <a class="ac" href="reviewAll.do?idx=<%=pnum%>&order=2">처음부터</a>
		 <% if (!id.equals("")) {%>
		 <a class="ac" href="reviewAll.do?idx=<%=pnum%>&order=1&user=<%=id%>">내 리뷰 보기</a>
		</td>
		<td align="right">
	  	 <a href="product/listReviewInsert.jsp?idx=<%=pnum%>"><button id="back_btn" style="background-color:#535353;">리뷰 쓰기</button></a>
	  	<%} else{ %>
	  	
		<%} %>
		</td></tr>
		<tr><td colspan=5><p></p></td></tr>
		<%
			for(int i=0; i<ok.size(); i++){
				DBVO vv=(DBVO)ok.get(i);
				int star = vv.getStar();
				String content = vv.getRcontent();
				int num = vv.getPrnum();
				String name = vv.getId();
		%>
		<tr><td rowspan=2 width=3%><%=vv.getRnum() %></td>
			<td colspan=3><pre><%= content %></pre></td>
			<td rowspan=2 width=12% align=center>
			<% if(name.equals(id)){ %>
			<a href="product/listReviewUpdate.jsp?idx=<%=num%>&star=<%=star%>&pnum=<%=pnum%>&name=<%=name%>&content=<%=content%>">
				<button id=back_btn style="background-color:#8C3F3F; width:40px;">수정</button></a>
			<%}if(name.equals(id)||id.equals("TEST")){ %>
			<a href="./reviewDelete.do?idx=<%=num%>&pnum=<%=pnum%>">
				<button id=back_btn style="background-color:#535353; width:40px;">삭제</button></a>
			<%} %>
			</td>
			
		</tr>
		<tr>
			<td><font color="ashblue"><%= name %></font></td>
			<td><font color="#ffbc00"><% for(int a=1; a<=star; a++) {out.print("★");} 
				for(int a=1; a<=5-star; a++) {out.print("☆");} %></font></td>
			<td><%= vv.getRdate() %></td>
		</tr>
		<tr><td colspan=5><hr></td></tr>
	<%
		}
	%>
	</table>
</div>
</body>
</html>