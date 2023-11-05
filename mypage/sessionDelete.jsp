<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>

<html>
<head><title>sessionDelete</title>
</head>
<body>
<%
String id = request.getParameter("ID");
session.removeAttribute("ID");

%>
<% response.sendRedirect("../index.jsp"); %>
</body>
 
</html>
