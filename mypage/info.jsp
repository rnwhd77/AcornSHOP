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
         <span>ȸ������ �������Դϴ�.</span>
      </div>
   </div>
   <div id="wrap">
      <div id="re_left">
         <ul>
   <%
   try {
      String id = (String)session.getAttribute("NowUser");  //������ ���� �����͸� ������
   %>   
   <!--���ǻ�� ���ϰ� �������н��϶� ��� String id = (String)request.getAttribute("id");  -->
            <li><a href="pagemoving.do?id=<%=id %>">���� ����</a></li> 
            <!-- ���ǿ��� ���� id�� DetailController�������� ���� --> 
   <%      
      } catch (Exception ex) { }
   %>         
         </ul>
   </div>
      
</body>
</html>