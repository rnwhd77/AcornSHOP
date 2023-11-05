<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/JoinSucsses.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
String id =(String)session.getAttribute("ID");
%>
<div id="wrapper">
					<nav id="Update">	
						<ul class="actions vertical">
							<li><h1><%=id %> 님 환영합니다! &nbsp;</h1>
							회원가입을 축하합니다.&nbsp;</li>
							<li>시스템의 새로운 아이디는 <%= id  %> 입니다. &nbsp;</li>
							<li><button id="btnbox"onclick='location.href="../index.jsp"'>시작하기</button></li>
						</ul>
					</nav>			
			</div>
</body>
</html>