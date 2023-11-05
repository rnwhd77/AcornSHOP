<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="product.common.DBDAO" %>
<%@ page import="product.common.DBVO" %>
<% DBDAO dao = new DBDAO();
	DBVO vo = new DBVO();
	int qnanum=Integer.parseInt(request.getParameter("idx"));
	int pnum=Integer.parseInt(request.getParameter("pnum"));
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String content= request.getParameter("content");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<jsp:include page="../top.jsp"></jsp:include>
<script type="text/javascript">

function mycheck(){
		
	var pnum = document.qna_form.pnum.value;
	var iname = document.qna_form.user.value;
	var itit = document.qna_form.title.value;
	var icont = document.qna_form.content.value;
	
	if(itit=="" || itit==null){
		document.getElementById("title_ch").innerHTML="<font style='font-size:12pt; color:red'> *제목을 입력해 주세요";
		document.qna_form.title.focus();
		return false;
	} else{
		document.getElementById("title_ch").innerHTML="";
	}
	if(icont=="" || icont==null){
		document.getElementById("cont_ch").innerHTML="<font style='font-size:12pt; color:red'> *내용을 입력해 주세요";
		document.qna_form.content.focus();
		return false;
	} else{
		document.getElementById("cont_ch").innerHTML="";
	}
	document.qna_form.submit();
	}
 	
 	function count(){
 		var cont = 0;
 		cont = document.qna_form.content.value;
 		if(cont.length>200){
 			alert('최대로 입력 가능한 글자수는 200자입니다.');
 			cont = cont.substring(0,200);
 			document.getElementById("content").value=cont;
 		}
 		document.getElementById("cnt_ck").innerHTML="글자수 ("+cont.length+"/200)";
 	}
 </script>
  <style>
*{text-decoration: none; margin-left:auto; margin-right:auto;}
#back_btn{width:70px; height:30px; color:#EFEDED; border:0px;}
#qsave{width:70px; height:30px; color:#EFEDED; border:0px;}
</style>
</head>
<body>
	<table border=0>
	<form name="qna_form" action="../qnaUpdate.do">
	<tr><td colspan=2 align=left><h3>문의 작성하기</h3></td></tr>
		<tr>
		 <td width=15%></td>
		 <td><input type="hidden" name="qnanum" value="<%=qnanum%>"></td>
		</tr>
		<tr>
		 <td></td>
		 <td><input type="hidden" name="pnum" value="<%=pnum%>"></td>
		</tr>
		<tr>
		 <td></td>
		 <td><input type="hidden" name="user" size="55" value="<%=name%>" readonly><span id="user_ch"></span></td>
		</tr>
		<tr>
		 <td>제목</td>
		 <td><input type="text" name="title" size="55" value="<%=title%>"><span id=title_ch></span></td>
		</tr>
		<tr>
		 <td>내용</td>
		 <td><textarea name="content" id=content rows="10" cols="56.5" style="resize:none" onkeyup="count();" style="resize:none"><%=content%></textarea><span id=cont_ch></span></td>
		</tr>
		<tr><td colspan=2><small><span id="cnt_ck" style="padding-left:400px;"></span></small></td></tr>
		<tr><td colspan=2><p></td></tr>
		<tr>
		 <td></td>
		 <td align="right"><input type="button" id="qsave" name="btn_save" onclick="mycheck();" value="수정하기" style="background-color:#8C3F3F;">
		 </form>
		 <a href="../qnaAll.do?idx=<%=pnum%>"><button id=back_btn style="background-color:#535353;">취소</button></a></td>
		</tr>
	</table>

</body>
</html>