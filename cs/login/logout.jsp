<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>

<%
session.invalidate();
%>
<html>
<head><title>�α׾ƿ�</title>

<script>
alert("�α׾ƿ� �Ǿ����ϴ�. �̿��� �ּż� �����մϴ�.");
</script>
</head>

<body>
<% response.sendRedirect("../index.jsp"); %>
</body>

</html>