<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>​
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="mypage.common.DBVO" %>
<%@ page import="mypage.common.DBDAO" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<title>Mypage</title>
<link rel="stylesheet" type="text/css" href="../style.css">
</head>
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
.member_bt {
  			align-items:center;
    		background-color: ff6600;
            color : white;
            width:100px;	
            height:50px;
            font-size: 17px;
            border : none;
            border-radius: 5px;
            margin : 20px 0 30
            px 0;
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
            margin : 20px 0 30
            px 0;
  }
  .member_tr {
        	height: 40px;
        	padding: 0 10px;
       	 	margin-bottom: 10px;
  			font-size: 20px;
  			width:470px;
    		padding:5px;
			margin-right: 10px;
			margin-bottom: 10px;
			border-style: none;
			padding:10px;
  }
  #member_center{
  			width:800px;
  }
</style>
<body>
<jsp:include page="../top.jsp"/>
	
<%
			String id = (String)session.getAttribute("ID");
		
			DBDAO dbsql=new DBDAO();
			DBVO bean=dbsql.memberDetail(id);
%>
	<div id="member_center">
		<form name=signin method=get onsubmit="return check()" action= >
		  <div class="title">MEMBER INFO</div>
		<table id=member_tableF>
		
			<tr>
				<td class="member_tr">
					&nbsp;아이디 : <%=bean.getId()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr><td><hr></td></tr>
			<tr>
				<td class="member_tr">
					&nbsp;비밀번호 : <%=bean.getPwd()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr><td><hr></td></tr>
			<tr>
				<td class="member_tr">
					&nbsp;이름 : <%=bean.getName()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr><td><hr></td></tr>
			<tr>
				<td class="member_tr">
					&nbsp;이메일 :  <%=bean.getEmail()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr><td><hr></td></tr>
			<tr>
			    <td class="member_tr">
				    &nbsp;주소 :  <%=bean.getAddress()%>
			    	<div id=member_hr></div>
			    </td>
	 		</tr>
			<tr><td><hr></td></tr>
			<tr>
				<td class="member_tr">
					&nbsp;연락처 : <%=bean.getPhone()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr><td><hr></td></tr>
			
		</table><br>
		<div id=member_bottom>
			<a href="../index.jsp"><input type=button value="메인화면" class="member_bt2"></a>
			<a href="mypageedit.jsp"><input type=button value="수정하기" class="member_bt2"></a>
			<a href="guestDelete.jsp?ID=<%=id %>>"><input type="button" value="탈퇴하기" class="member_bt2"></a>
		</div>
		</form>
		

</div>
</body>
</html>
