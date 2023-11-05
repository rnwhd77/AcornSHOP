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
<title>q&a</title>
<style>
*{text-decoration: none; margin-left:auto; margin-right:auto;}
.ac{color:black;}
.ac:hover{font-weight:bold;}
#back_btn{width:90px; height:30px; color:#EFEDED; border:0px;}
</style>
<jsp:include page="../top.jsp"></jsp:include>
</head>
<body>
<%
DBDAO dao = new DBDAO();
DBVO vo = new DBVO();

String id=(String)session.getAttribute("ID");
if(id==null)id="";
int pnum=Integer.parseInt(request.getParameter("idx"));
List ok=(List)request.getAttribute("list");
%>
<div align=center>
	<p><p><p><p>
	<table border=0 width=60%>
	<tr><td colspan=5><a href="./listDetail.do?idx=<%=pnum%>"><button id=back_btn style="background-color:#535353;">돌아가기</button></a></td></tr>
	<tr><td colspan=5 align=left><h3>문의 목록</h3></td></tr>
	<tr><td colspan=5><p></td></tr>
	<tr><td colspan=4>
		<a class=ac href="qnaAll.do?idx=<%=pnum%>">전체</a>
		<% if (!id.equals("")) {%>
		<a class=ac href="qnaAll.do?idx=<%=pnum%>&id=<%=id%>">내 문의</a></td>
	  	<%} else{ } %>
		</tr>
	<tr><td colspan=5><p></td></tr>
	<tr style="font-weight:bold"><td></td><td>작성자</td> <td>제목</td> <td>작성일자</td> <td width=15%>답변여부</td></tr>
	<tr><td colspan=5><hr style="border:solid 1pt black;"></td></tr>
		<%
		for(int i=0; i<ok.size(); i++){
			DBVO vv=(DBVO)ok.get(i);
			String name = vv.getId();
			String title = vv.getTitle();
			String content = vv.getQcontent();
			String rls = vv.getRls();
			int num = vv.getPqnum(); int rn = vv.getRnum();
			String ansyn = vv.getAns();
	%>
	<tr>
		<td><%=rn %></td>
		<td><%=name %></td>
		<td>
		  <a class=ac href="./qnaDetail.do?idx=<%=num%>&pnum=<%=pnum%>"><%= title %><%if(rls.equals("n")){ %><img src="product/images/lock.png" width=20><%} %></a>
		<td><%= vv.getQdate() %></td>
		<td><%if(ansyn.equals("n")){%><b><font color="#BC3D3D">대기 중</font></b><%} %> <%if(ansyn.equals("y")){%><b><font color="#3DBC49">답변 완료</font></b><%} %></td>
	</tr>
	<tr><td colspan=5><hr></td></tr>
<%
	}
%>
  <tr><td colspan=5><br></td></tr>
  <%if(!id.equals("")) {%>
	<tr><td colspan=5 align="right">
	  	 <a href="product/listQnaInsert.jsp?idx=<%=pnum%>"><button id=back_btn style="background-color:#8C3F3F;">문의하기</button></a>
	</td></tr><%} %>
	</table>
</div>
</body>
</html>