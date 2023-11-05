<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="product.common.DBDAO" %>
<%@ page import="product.common.DBVO" %>
<% DBDAO dao = new DBDAO();
	DBVO vo = new DBVO();
	int revnum=Integer.parseInt(request.getParameter("idx"));
	int star=Integer.parseInt(request.getParameter("star"));
	int pnum=Integer.parseInt(request.getParameter("pnum"));
	String name = request.getParameter("name");
	String content=request.getParameter("content");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

 	function mycheck(){
 		
 		var pnum = document.rev_form.pnum.value;
    	var iname = document.rev_form.user.value;
    	var icont = document.rev_form.content.value;
    	var istar = document.rev_form.star.value;
    	
    	if(iname=="" || iname==null){
    		document.getElementById("user_ch").innerHTML="<font style='font-size:12pt; color:red'>*ID를 입력해 주세요";
    		document.rev_form.user.focus();
    		return false;
    	} else{
    		document.getElementById("user_ch").innerHTML="";
    	}
    	
    	if(istar=="" || istar==null){
    		document.getElementById("star_ch").innerHTML="<font style='font-size:12pt; color:red'>*별점을 입력해 주세요";
    		document.rev_form.star.focus();
    		return false;
    	} else if(istar>5 || istar<1){
    		document.getElementById("star_ch").innerHTML="<font style='font-size:12pt; color:red'>*올바른 별점을 입력해 주세요";
    		document.rev_form.star.focus();
    		return false;
    	} else{
    		document.getElementById("star_ch").innerHTML="";
    	}
    	
    	if(icont=="" || icont==null){
    		icont=" ";
    	}
    	
    	document.rev_form.submit();
 	}
 	
 	function count(){
 		var cont = 0;
 		cont = document.rev_form.content.value;
 		if(cont.length>200){
 			cont = cont.substring(0,200);
 			document.getElementById("content").value=cont;
 		}
 		document.getElementById("cnt_ck").innerHTML="글자수 ("+cont.length+"/200)";
 	}
 </script>
  <style>
*{text-decoration: none; margin-left:auto; margin-right:auto;}
#back_btn{width:70px; height:30px; color:#EFEDED; border:0px;}
#rsave{width:70px; height:30px; color:#EFEDED; border:0px;}
</style>
</head>
<body>
	<jsp:include page="../top.jsp" flush="false"></jsp:include>
	<table border=0>
		<tr><td colspan=2 align=left><h3>리뷰 작성하기</h3></td></tr>
		<form name="rev_form" action="../reviewUpdate.do">
		<tr>
		 <td width=15%></td>
		 <td><input type="hidden" name="revnum" value="<%=revnum%>"></td>
		</tr>
		<tr>
		 <td></td>
		 <td><input type="hidden" name="pnum" value="<%=pnum%>"></td>
		</tr>
		<tr>
		 <td></td>
		 <td><input type="hidden" name="user" value="<%=name%>" readonly><span id="user_ch"></span></td>
		</tr>
		<tr>
		 <td>내용</td>
		 <td><textarea name="content" id=content rows="10" cols="50" style="resize:none" placeholder="해당 제품에 대한 리뷰를 입력해 주세요. 최대 200자까지 입력 가능합니다" onkeyup="count();"><%=content%></textarea></td>
		</tr>
		<tr><td colspan=2><small><span id="cnt_ck" style="padding-left:330px;"></span></small></td></tr>
		<tr>
		 <td>별점</td>
		 <td><input type="text" name="star" size=1 maxlength=1 value="<%=star%>">/5<span id="star_ch"></span></td>
		</tr>
		<tr>
		 <td></td>
		 <td align="right">
		 	<input type="button" id="back_btn" name="btn_save" onclick="mycheck();" value="수정하기" style="background-color:#8C3F3F;">
		 	</form>
		 	<a href="../reviewAll.do?idx=<%=pnum%>&order=1"><button id="back_btn" style="background-color:#535353;">취소</button></a>
		 </td>
		</tr>
	</table>
</body>
</html>