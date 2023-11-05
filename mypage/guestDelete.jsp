<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mypage.common.DBDAO" %>
<%@ page import="mypage.common.DBVO" %>
<!DOCTYPE html>
<html>
<head>
<title>guestDelete</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<style>
.title {
            font-size : 27px;
            margin: 40px 0 30px 0;
        }

form {
            width:800px;
            height:700px;
            display : flex;
            flex-direction: column;
            align-items:center;
            position : absolute;
            top:50%;
            left:50%;
            transform: translate(-50%, -50%) ;
            border-radius: 10px;            
        }
        
 .member_tr {
        	text-align : center;
        	font-size: 20px;
 		 	width:240px;
    		padding:5px;
    		
    		
			margin-right: 10px;
			margin-bottom: 10px;
			border-style: none;
			padding:10px;
  }
  
 .member_bt2 {
  			align-items:center;
    		background-color: rgb(89,117,196);
            color : white;
            width:100px;
            height:50px;
            font-size: 17px;
            border : none;
            border-radius: 5px;
            margin : 20px 0 30px 0;
  }
</style>
<body>
<jsp:include page="../top.jsp"/>
<%
String id = "";
try{
id = (String)session.getAttribute("ID");
	//String id = request.getParameter("ID");
%>	

<div id="guestF">
<jsp:include page="../top.jsp"></jsp:include>
<form action="../DeleteController" name=guestF3>
	<div id="guestF2">
		<div class="title">SIGN OUT</div>
	</div>	
		<span class="member_tr"> 
			&nbsp;비밀번호 확인
		</span>
		<input type=hidden name="id" value=<%=id %>>
		<input type=text name="pwd" style="padding:7px;">
		
		<span><input type='submit' value="탈퇴"  class="member_bt2">	
		<a href='./mypage.jsp'><input type='button' value="취소" class="member_bt2"></a></span>
		
</form>
</div>
<%
}catch(Exception ex){}

%>
</body>
</head>
</html>
