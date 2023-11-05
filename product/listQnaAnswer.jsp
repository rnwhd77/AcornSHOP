<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="product.common.DBDAO" %>
<%@ page import="product.common.DBVO" %>
<% DBDAO dao = new DBDAO();
   DBVO vo = new DBVO();
   int qnum=Integer.parseInt(request.getParameter("idx"));
   String name = (String)session.getAttribute("ID");
   int pnum = (Integer)request.getAttribute("qnanum");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>q&a</title>
</head>
<body>
<div align="center">
<form name="answer_form" action="./answerInsert.do">
	 <table border=0 width=100%>
	 	<tr>
		 <td></td>
		 <td colspan=2><input type="hidden" name="pnum" value="<%=pnum%>"></td>
		</tr>
	 	<tr>
		 <td width=8%></td>
		 <td colspan=2><input type="hidden" name="qnum" value="<%=qnum%>"></td>
		</tr>
		<tr>
		 <td>답변</td>
		 <td><textarea name="content" rows="5" cols="170" style="resize:none"></textarea></td>
		 <td width=10%><input type="submit" id="qsave" name="btn_save" value="답변하기" style="background-color:#8C3F3F; height:90px;">
		 </td>
		</tr>
		<tr><td><p></td></tr><tr><td><p></td></tr>
	 </table>
	</form>
</div>
</body>
</html>