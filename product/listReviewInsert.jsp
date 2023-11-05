<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="product.common.DBDAO" %>
<%@ page import="product.common.DBVO" %>
<% DBDAO dao = new DBDAO();
	DBVO vo = new DBVO();
	int pnum=Integer.parseInt(request.getParameter("idx"));
	String id = (String)session.getAttribute("ID");
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
	var icont = document.rev_form.content.value;
	var istar = document.rev_form.star.value;
	
	if(isNaN(istar)==true){
		document.getElementById("star_ch").innerHTML="<font style='font-size:12pt; color:red'>*별점은 숫자로 입력해 주세요";
		document.rev_form.star.focus();
		return false;
	} else{
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
	} if(icont=="" || icont==null){
		icont=" ";
	} document.rev_form.submit();
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
	<table border=0 width=60%>
		<tr><td colspan=2 align=left><h3>리뷰 작성하기</h3></td></tr>
		<form name="rev_form" action="../reviewInsert.do">
		<tr>
		 <td width=15%></td>
		 <td><input type="hidden" name="pnum" value="<%=pnum%>"></td>
		</tr>
		<tr>
		 <td></td>
		 <td><input type="hidden" name="user" value="<%=id%>"></td>
		</tr>
		<tr>
		 <td>내용</td>
		 <td><textarea name="content" id=content rows="10" cols="50" placeholder="해당 제품에 대한 리뷰를 입력해 주세요. 최대 200자까지 입력 가능합니다" onkeyup="count();" style="resize:none"></textarea></td>
		</tr>
		<tr><td colspan=2><small><span id="cnt_ck" style="padding-left:400px;"></span></small></td></tr>
		<tr>
		 <td>별점</td>
		 <td>
	
		 <input type="text" name="star" size=1 maxlength=1 >/5<span id="star_ch"></span> 
		 </td>
		</tr>
		
		<tr>
		 <td colspan=2 align="center">
		 	<input type="button" id="rsave" name="btn_save" onclick="mycheck();" value="작성하기" style="background-color:#8C3F3F;">
		 </form>
		 <a href="../reviewAll.do?idx=<%=pnum%>&order=1"><button id="back_btn" style="background-color:#535353;">취소</button></a>
		 </td>
		</tr>
	</table>

</body>
</html>