<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%
request.setCharacterEncoding("utf-8");
 
%>
<!DOCTYPE html>
<html>
<head>
<style>
h1{
    text-align: center;
}
table{
    text-align: center;
}
th{
    width: 200px;
}
td{
    width: 400px;
}
.cls1{
    font-size: 40px;
    text-align: center;
}
 
</style>
<meta charset="UTF-8">
<title>회원정보 수정창</title>
</head>
<body>
<%
String id= request.getParameter("id");
String date= request.getParameter("signdate");
%>
    <h1 class="cls1">회원 정보 수정창</h1>
    <form method="post" action="../memberEdit.do">
        <table>
            <tr>
                <th>
                    <p align="right">아이디</p>
                </th>
                <td><input type="text" name="ID"  value=<%=id %> ></td>
            </tr>
            
            <tr>
                <th>
                    <p align="right">비밀번호</p>
                </th>
                <td><input type="password" name="PWD"></td>
            </tr>
            
            <tr>
                <th>
                    <p align="right">이름</p>
                </th>
                <td><input type="text" name="NAME" ></td>
            </tr>
            
            <tr>
                <th>
                    <p align="right">이메일</p>
                </th>
                <td><input type="text" name="EMAIL" ></td>
            </tr>
            
            <tr>
                <th>
                    <p align="right">가입일</p>
                </th>
                <td><input type="text" name="SIGNDATE" value="<%=date %>"></td>
            </tr>
            
            <tr align="center">
                <td></td>
                <td><input type="submit" value="수정하기"></td>
            </tr>
 
            <tr align="center">
            <td></td>
            <td ><input type="reset" value="다시입력"></td>
            </tr>
        </table>
    
    </form>
 
</body>
</html>