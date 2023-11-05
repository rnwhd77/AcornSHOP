<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title> csDelete.jsp  </title>
  
</head>
<body>
<form name="myform" method="get" action=''>
<div>
	<%
    int qseq = (int)request.getAttribute("result");
    
    DBDAO dao = new DBDAO();
    int result = dao.dbDelete(qseq);
    System.out.println(result);
    if(result==qseq) {
    %>
       <script type="text/javascript">
           alert("게시글 삭제 완료");
           window.location=("cs/csList.jsp");
       </script>
    <%
    }else{
    %>
       <script type="text/javascript">
           alert("게시글 삭제 실패");
           history.back();
       </script>
    <%
    }
    %>
</div>
</form>
</body>
</html>









