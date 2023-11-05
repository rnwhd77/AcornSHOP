<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="product.common.DBDAO" %>
<%@ page import="product.common.DBVO" %>
<% DBDAO dao = new DBDAO();
   DBVO vo = new DBVO();
   int num = (Integer)request.getAttribute("pnum");
   int pnum = (Integer)request.getAttribute("qnanum");
   String id = (String)request.getAttribute("id");
   String title = (String)request.getAttribute("title");
   String content = (String)request.getAttribute("content");
   String rls = (String)request.getAttribute("rls");
   String ans = (String)request.getAttribute("ans");
   Date date = (Date)request.getAttribute("date");
   String name = (String)session.getAttribute("ID");
   if(name==null) name="";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>q&a</title>
<style>
*{text-decoration: none; margin-left:auto; margin-right:auto;}
.ac{color:black;}
#back_btn{width:70px; height:30px; color:#EFEDED; border:0px;}
#qsave{width:70px; height:30px; color:#EFEDED; border:0px;}
</style>
<jsp:include page="../top.jsp"></jsp:include>
</head>
<body>
<p style="margin-top:-30px">
<div align="center">
<p><hr><p>
<table border=0 width=60%>
<tr><td colspan=2><br></td></tr>
<tr><td><a href="qnaAll.do?idx=<%=pnum%>"><button id=back_btn style="background-color:#535353;">돌아가기</button></a></td></tr>
<tr><td><p></td></tr>
<tr><td colspan=2 align=left><h3>문의 보기</h3></td></tr>
	<%if(name.equals("TEST")&&rls.equals("n")||name.equals(id)&&rls.equals("n")||rls.equals("y")){%>
   <tr><td>작성자: <%=id %></td></tr>
   <tr><td>제목: <%=title %></td></tr>
   <tr><td>내용: <%=content %></td></tr>
   <tr><td><p></td></tr><tr><td><p></td></tr><tr><td><p></td></tr>
   <tr>
   <td align=center>
   <%if(name.equals(id)&&ans.equals("n")){%>
   	<a class="ac" href="product/listQnaUpdate.jsp?idx=<%=num%>&pnum=<%=pnum%>&name=<%=id%>&title=<%=title%>&content=<%=content%>">수정</a><%} %>
	<%if(name.equals(id)||name.equals("TEST")){%><a class="ac" href="./qnaDelete.do?idx=<%=pnum%>&pnum=<%=num%>">삭제</a></td><%} %>
   <%if(!name.equals(id)){ %></td><%} 
	} if(!name.equals(id)&&rls.equals("n")&&!name.equals("TEST")){ %>
   <td align=center>비밀 문의는 작성자와 관리자만 열람 가능합니다. <br> 로그인 후 이용해 주세요.</td>
   <%} %>
   </tr>
   <tr><td><p></td></tr>
   <%if(name.equals("TEST")){ %>
   <tr><td><jsp:include page="listQnaAnswer.jsp"></jsp:include>
   </td></tr>
   <%} %>
   <%if(name.equals("TEST")||name.equals(id)&&rls.equals("n")||rls.equals("y")){ %>
   <tr><td>
   <jsp:include page="listQnaAnswerAll.jsp">
		<jsp:param value="<%=num %>" name="idx"/>
		<jsp:param value="<%=pnum %>" name="qnum"/>
	</jsp:include>
   </td></tr>
   <%} %>
</table>
<p><p><p><p>
<jsp:include page="../bottom.jsp"></jsp:include>
</div>
</body>
</html>