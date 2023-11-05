<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>​
<%@ page import="java.sql.*" %>  
<%@ page import="mypage.common.DBVO" %>
<%@ page import="mypage.common.DBDAO" %>
<html>
<head>

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
  			height: 40px;
        	padding: 0 10px;
       	 	margin-bottom: 10px;
  			font-size: 20px;
  			width:470px;
    		padding:5px;
			margin-right: 10px;
			margin-bottom: 10px;
			border-style: none;
			padding:9px;
}
.member_tr2{
height: 40px;
        	padding: 0 10px;
       	 	margin-bottom: 10px;
  			font-size: 17px;
  			width:470px;
    		padding:5px;
			margin-right: 10px;
			margin-bottom: 10px;
			border-style: none;
			padding:9px;
}

.member_bt2 {
  			align-items:center;
    		background-color: rgb(89,117,196);
            color : white;
            width:100px;
            height:50px;
            font-size: 17px;
            border-color : none;
            border-radius: 5px;
            margin : 20px 0 30px 0;
  }
  
  .member_ta2 {
  			font-size:14px;
			text-align :center;
			color:red;  
  }
  
  #member_center .title {
    margin-bottom: -10px
</style>

<title>memberEdit</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	
	function pass(){
		//비밀번호 길이 체크(4~8자 까지 허용)
		if (signin.password1.value.length<4 || signin.password1.value.length>8){
			 document.getElementById("ch_pw1").innerHTML = "4~6자리를 입력해주세요.";
			 signin.password1.value="";
	         signin.password1.focus();
		}
		else{
			document.getElementById("ch_pw1").innerHTML = "";
		}
	}//end
	
	function pass1(){
		if(signin.password1.value!=signin.password2.value) {
			document.getElementById("ch_pw2").innerHTML = "비밀번호가 일치하지 않습니다";
            signin.password2.value="";
            signin.password1.value="";
            signin.password1.focus();
    	}else if (signin.password1.value==signin.password2.value) {
    		document.getElementById("ch_pw2").innerHTML = "일치 합니다.";
    	}
	}//end
	
	function emailcheck(){
		  var email = document.signin.email.value;
		  if(email == "" | email==null){
			alert("주소를 입력해주세요"); 
			return  false;
		  }
		  if( email.includes("@") == false){
			  alert("@포함해주세요");
			  document.signin.email.value="";
		   }
		}//end
	
	function validateForm() {
		  var address = document.forms["signin"]["address"].value;
		  var tel = document.forms["signin"]["tel"].value;
			  
		  if (address == "") {
			    alert("주소를 입력해주세요.");
			    return false;
			  } else if (tel == "") {
			    alert("번호를 입력해주세요.");
			    return false;
			  } else {
			    return true;
			  }
			}
				

</script> 
</head>
<%
		String id = (String)session.getAttribute("ID");
		//DBVO bean = (DBVO)request.getAttribute("detail1");
		DBDAO dbsql=new DBDAO();
		DBVO bean=dbsql.memberDetail(id);
%>
<body>
<jsp:include page="../top.jsp"/>
	<div id="member_center">
		<form name=signin method=get onsubmit="return validateForm()" action="../EditController">
		<div class="title">MEMBER EDIT</div>
		<input type=hidden name=id value=<%=id%>>
		<table id=member_tableF>
			<tr>
		        <td class="member_tr2">
					&nbsp;* 표시는 필수 입력 표시입니다.
					<div id=member_hr></div>
				</td>
			</tr>
			<tr><td><hr></td></tr>
			<tr>
				<td class="member_tr">
				&nbsp; 아이디 : <%=id%>
					<div id=member_hr></div>   
				</td>
			</tr>
			<tr><td><hr></td></tr>
			<br>
			<tr>
				<td class="member_tr">
				&nbsp;* 비밀번호 :
					<input type=password name=password1 placeholder=비밀번호 onblur="pass()" class="member_ta" style="padding:4px; width:230px;" value="<%=bean.getPwd()%>" >
					<div class="member_ta2" >필수 정보입니다. <span class="member_ta3" id="ch_pw1"></span></div>
					<div id=member_hr></div>  
				</td>
			</tr>
			<tr><td><hr></td></tr>
			
			<tr>
				<td class="member_tr">
				&nbsp;* 번호확인 :
					<input type=password name=password2 placeholder="비밀번호 재확인" onblur="pass1()" style="padding:4px; width:230px;" class="" >
					<div class="member_ta2">필수 정보입니다. <span class="member_ta3" id="ch_pw2"></span></div>
				</td>
			</tr>
			<tr><td><hr></td></tr>
		</table>
		
		<table id=member_tableF>
			<tr>
				<td class="member_tr">
					&nbsp; 이름 : <%=bean.getName()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr><td><hr></td></tr>
			
			<tr>
				<td class="member_tr">
				&nbsp;* 이메일 : &nbsp;
					<input type=text name="email" placeholder="이메일" onblur= "emailcheck()" style="padding:4px; width:230px;" class="">
					<div id=member_hr></div>
				</td>
			</tr>
			<tr><td><hr></td></tr>
			<tr>
				<td class="member_tr" >
				&nbsp;* 주소 : &nbsp;&nbsp;&nbsp;&nbsp;
					<input type=text name="address" placeholder="주소" onblur="" style="padding:4px; width:230px;" class= "">
					<div id=member_hr></div>
				</td>
			</tr>
			<tr><td><hr></td></tr>
			<tr>
				<td class="member_tr">
				&nbsp;* 연락처: &nbsp;&nbsp;
					<input type=text name="tel" placeholder="-없이 입력해주세요" onblur="" style="padding:4px; width:230px;" class="">
					<div id=member_hr></div>
				</td>
			</tr>
			<tr><td><hr></td></tr>
			
		</table><br>
		<div id=member_bottom>
			<input type=submit value="수정하기" class="member_bt2" onclick="">  
			<input type="reset" value="다시쓰기"  class="member_bt2">
			<a href="mypage.jsp"><input type=button value="뒤로가기" class="member_bt2"></a>
		</div>
		</form>
	</div>
</body>
</html>