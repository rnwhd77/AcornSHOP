<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pro_login</title>
<link href="login/css/login.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	var request = null;

	function log() {
		request = new XMLHttpRequest();
		var ID = myform.ID.value;
		var PW = myform.PW.value;
		if (ID == "" && PW == "") {
			alert("ID,PW를 입력해주세요");
		}else if (ID == ""){
			alert("ID를 입력해주세요");			
		}else if (PW == ""){
			alert("PW를 입력해주세요")
		}
	}
	
	  
</script>
</head>
<body>

<!--<H2>2023-07-25</H2>-->


<%
if(session.getAttribute("ID")==null){
%>
	<div id="message">
		<form name="myform" action="../loginController.do">
		<span class="logintext">ID &nbsp;<input type="text" name="ID" placeholder="ID.."style="width:70px;"></span>
		<span class="logintext">PW &nbsp;<input type="password" name="PW" placeholder="PW.."style="width:70px;"></span>
		<span><input type=submit value="login" onClick="log()"></span>
		<span class="text">&nbsp; / &nbsp;</span>
		<span><a href="login/join.jsp" class="jo" >Sign</a></span>	
		</form>
	</div>	

<%
  } else {String id=(String)session.getAttribute("ID"); 
 	 if(id.equals("TEST")){
	  %>
	<span class='logintext'><%=id%> 관리자 ▶&nbsp;</span>
  	<span><a href="../admin/admin.jsp" class='jo'>관리자페이지</a></span>
  	<span class='logintext'>&nbsp; / &nbsp;</span>
  	<span><a href='#' class='jo' onClick="window.location='../login/logout.jsp'">Logout</a></span>
	<%
 	 }else if(id!="TEST"){ 
	%>
  	<span class='logintext'><%=id %> 고객님 ▶&nbsp;</span>
		<%
		if(id!=null){
		%>		
		<!-- <span class='logintext'><a href='revStep3.do?&id=<%=id %>'>예약확인</a></span>-->
		
  	<span class='logintext'>&nbsp; / &nbsp;</span>
  	<span><a href="../mypage/mypage.jsp" class='jo' onClick=''>Mypage</a></span>
  	<%
		}
	%>
  	<span class='logintext'>&nbsp; / &nbsp;</span>
  	<span><a href='#' class='jo' onClick="window.location='../login/logout.jsp'">Logout</a></span>  		
<%			
 	 }
  }
%>
	
		
</body>
</html>