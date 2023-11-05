<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="text-align:center; margin-top:100px;">



<h2>관리자페이지</h2>
<form name="myform" action="../member.do">
		<span><input type="submit" value="회원정보"></span>
		<span><input onclick="location.href='admin_product.jsp'"  type="button" value="상품등록"></span>
</form>

</body>
</html>