<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="mypage.common.DBVO" %>
<html>
<head>
<title>info</title>
</head>
<body id="re_center">
   <div id="re_title"> 
      <div class="re_titleB">
         <span style="font-size:1.5em; padding-right:10px;">MYPAGE</span>
         <span>회원정보 페이지입니다.</span>
      </div>
   </div>
   <div id="wrap">
      <div id="re_left">
         <ul>
   <%
   try {
      String id = (String)session.getAttribute("NowUser");  //세션을 통해 데이터를 가져옴
   %>   
   <!--세션사용 안하고 페이지패싱일때 사용 String id = (String)request.getAttribute("id");  -->
            <li><a href="pagemoving.do?id=<%=id %>">나의 정보</a></li> 
            <!-- 세션에서 받은 id를 DetailController서블릿으로 보냄 --> 
   <%      
      } catch (Exception ex) { }
   %>         
         </ul>
   </div>
      
</body>
</html>