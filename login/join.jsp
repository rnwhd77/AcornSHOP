<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<link href="css/join.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	var request = null;
	
	function joinCheck() {
		request = new XMLHttpRequest();
		
		var writeForm = document.writeForm;
		var Id = writeForm.userid.value;
		var Pwd = writeForm.pwd.value;
		var rePwd =writeForm.repwd.value;
		var Name = writeForm.name.value;
		var Addr = writeForm.addr.value;
		
		if (Id.length==0 ||Id == ""){
			alert("아이디를 입력하세요");
			document.writeForm.userid.focus();
			return false;
		}else if (Pwd.length==0 || Pwd == ""){
			alert("비밀번호를 입력하세요");
			document.writeForm.pwd.focus();
			return false;
		}else if (rePwd != Pwd){// 비밀번호 동일값
			alert("비밀번호를 확인해주세요")
			document.writeForm.repwd.focus();
			return false;
		}else if(Name.length == 0 || Name == 0 ){
			alert("이름을 입력해주세요")
			document.writeForm.name.focus();
			return false;
		}else if(Addr.length == 0 || Addr == 0){
			alert("주소를 입력해주세요")
			document.writeForm.addr.focus();
			return false;
		}if(isNaN(writeForm.tel.value)){
            alert("전화번호는 - 제외한 숫자만 입력해주세요.");
            return false;
        }
		   if (writeForm.reid.value !="idCheck") {
		       alert("아이디 중복체크를 먼저 해주세요.");
		       return false;}
		    return true;
	}
	
	function openIdCheck() {
	    var writeForm = document.writeForm;
	    var id = writeForm.userid.value;

	    if (id.length === 0) {
	        alert("아이디를 먼저 입력하세요.");
	        writeForm.userid.focus();
	        return false;
	    }else{
	    	window.name= "parentForm";
	    	window.open("IdCheckForm.jsp", "chkForm", "width=500,height=300,resizable=no,scrollbars=no");
	    }

	}
	function goFirstForm(){
		location.href="../index.jsp";
	}
	
	function inputIdChk(){
		document.writeForm.reid.value="idUncheck";
	}//hidden 중복체크
</script>
</head>
<body>
<div class="con">
    <div id="login">
                <div id="login_form"><!--로그인 폼-->
	<h3 class="login" style="letter-spacing:-1px">회원가입</h3>
	<h5 style="color:pink;">*표시 항목은 필수 입력 항목입니다.</h5>
	<form name="writeForm" method="post" onsubmit="return joinCheck();" action="../JoinController" >
		<table class="signform"border="1" cellspacing="0" cellpadding="6">
			<tr width="70">
				<td style="text-align: left; font-size:12px; color:#666">아이디</td>
				<td>
				<input class="size1" type="text" name="userid" size="20" onkeydown="inputIdChk()" placeholder="*" size=15> 
				<input class="btn1" type="button" value="중복체크" onclick="openIdCheck()">
				<input type="hidden" name="reid" value="idUncheck">
				</td>
			</tr>
			<tr width="70">
				<td style="text-align: left; font-size:12px; color:#666">비밀번호</td>
				<td><input class="size" type="password" name="pwd" size="20" placeholder="*"></td>
			</tr>
			<tr width="70">
				<td style="text-align: left; font-size:12px; color:#666">비밀번호 재확인</td>
				<td><input class="size" type="password" name="repwd" size="20" 	placeholder="*"></td>
			</tr>
			<tr width="70">
				<td style="text-align: left; font-size:12px; color:#666">이름</td>
				<td><input class="size" type="text" name="name" id="name" size="20"	placeholder="*"></td>
			</tr>
			<tr width="70">
				<td style="text-align: left; font-size:12px; color:#666">이메일</td>
				<td><input class="size" type="text" name="email" size="40">
				</td>
			</tr>
			<tr>
			<tr>
				<td style="text-align: left; font-size:12px; color:#666">주소</td>

				<td><input class="size" type="text" name="addr" id="addr1" size=40 placeholder="*"></td>
			</tr>
			<tr>
				<td style="text-align: left; font-size:12px; color:#666">핸드폰</td>
				<td>
				<input class="size" type="text" name="tel" size=40 maxlength="15"> 
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input class="btn" type="submit" value="회원가입">&emsp;
				 <input class="btn" type="button" value="뒤로" onclick="goFirstForm()"></td>
			</tr>
		</table>
	</form>
			<p class="find">
                <span><a href="IDFind.jsp"target="_blank">아이디 찾기</a></span>
                <span><a href="PWDFind.jsp"target="_blank">비밀번호 찾기</a></span>
                <span><a href="../index.jsp"target="_blank" >홈으로</a></span>
            </p>
		</div>
	</div>
</div>
</body>



