<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/find.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	var request = null;
	
	function CheckForm() {
		request = new XMLHttpRequest();
		
		var findform = document.FindForm;
		var id = FindForm.F_id.value;
		var name = FindForm.F_name.value;
		var tel = FindForm.F_tel.value;
		
		
		if(id.length == 0 || id == 0 ){
			alert("아이디를 입력해주세요")
			document.FindForm.F_id.focus();
			return false;
		}
		if(name.length == 0 || name == 0 ){
			alert("이름을 입력해주세요")
			document.FindForm.F_name.focus();
			return false;
		}if(tel.length == 0 || tel == 0 ){
			alert("전화번호를 입력해주세요")
			document.FindForm.F_tel.focus();
			return false;
		}else if(isNaN(tel)){
            alert("전화번호는 - 제외한 숫자만 입력해주세요.");
            document.FindForm.F_tel.focus();
            return false;
        }
	return true;	
	}
</script>
</head>
<body>
<h2>PWDFind</h2>
<%
if (session.getAttribute("PWD")==null){
%>
<div id="Findivform">
<form name="FindForm" onsubmit="return CheckForm();" action="../PWDFinder.do" >
<input id="textbox" type="text" name="F_id" placeholder="가입하신 아이디" ><br>
<input id="textbox" type="text" name="F_name" placeholder="가입하신 이름" ><br>
<input id="textbox" type="text" name="F_tel" placeholder="가입하신 전화번호" ><br>
<input id="btnbox" type="submit" value="찾기">
<input id="btnbox" type="button" onClick="window.location='/AcornSHOP/index.jsp'" value="홈으로">
</form>
<%
} else{
	String pwd = (String)session.getAttribute("PWD");
		%>
	<h2> 당신의 패스워드는 <%=pwd%>입니다. </h2>
	<input type="button" onClick="window.location='logout.jsp'" value="홈으로">
		<%} %>


</div>

</body>
</html>