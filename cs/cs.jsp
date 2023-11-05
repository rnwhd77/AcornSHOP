<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title> [index.jsp] </title>
<link href="../style.css" rel="stylesheet" type="text/css">    
  <script type="text/javascript">
  </script>
</head>
<body>
	<!-- top -->	
	<div>
	<jsp:include page="top.jsp" flush="false" />	
	</div>
	
	
<!-- main  -->
	
	<div>
	<p style="margin-top:200px">
	<jsp:include page="csList.jsp" flush="false" />
	</div>
	
<!-- bottom -->  	
	<div>
	<jsp:include page="../bottom.jsp" flush="false" /> 
	</div>
	
	<p style="margin-bottom:1070px">

</body>
 

</html>



