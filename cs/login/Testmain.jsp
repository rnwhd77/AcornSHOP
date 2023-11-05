<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="mypage.common.DBDAO" %>
<%@ page import="mypage.common.DBVO" %>
<%@ page import="mypage.mvc.CartController" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Testmain.jsp</title>
<h3>Testmain </h3>
<% 
String id =(String)session.getAttribute("ID");


DBDAO dao = new DBDAO();
DBVO vo = dao.memberDetail(id);

System.out.println(id +"환영합니다");
%>

<h3><%=id %>님 환영합니다</h3>

<span id=member>
	<a href="../mypage/mypage.jsp"><input type=button value="내 정보 보기" class="member_bt2"></a>
</span>

<span id=Cart>
	<a href ="mypage/cart"><input type=button value="장바구니" class="member_bt2"></a>
</span>

</head>
</body>
</html>