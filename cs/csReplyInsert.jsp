<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>csInsert</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">


</script>
</head>

<style>
 body {
  background-color: white;
}

table {
  border-collapse: collapse;
  width: 800px;
  margin: 1rem auto;
  background-color: white;
}

/* 테이블 행 */
th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
  text-align: center;
}

th {
  background-color: #1b1b1b;
  color: #ddd;
}

th, td {
  border-top: 1px solid #ddd;;
  border-left: 1px solid #ddd;;
  border-right: 1px solid #ddd;;
}

.td_2 input{
  float: left;
  margin-left: 42px;
}

.input_2{ 
  background-color: white;
  border-radius: 8px;
  color: black;
  padding: 8px 15px;
  text-decoration: none;
  display: inline-block;
  width:200px;
  font-size: 15px;
  font-color: white;
}

 textarea{ 
  background-color: white;
  border-radius: 8px;
  color: black;
  padding: 8px 15px;
  text-decoration: none;
  display: inline-block;
  font-size: 15px;
  font-color: white;
}
 
/* 버튼 */
.input_1{
  background-color: white;
/*   border: 2px solid #555555; */
  border-radius: 8px;
  color: black;
  padding: 8px 15px;
  mirgin: 15px;
  text-decoration: none;
  display: inline-block;
  font-size: 15px;
  font-color: white; 
}

.input_1:hover, .input_1:active {
  opacity: 0.8;
  cursor: pointer;
  font-weight: 700;
}

.td_1{
  border-top: none;
  border-bottom: none;
  border-left: none;
  border-right: none;
}


button {
  background-color: white;
  border-radius: 8px;
  color: black;
  padding: 8px 15px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 15px;
  font-color: white;
}

a:link, a:visited {
 /*  background-color: black; */
  color: black;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

a:hover, a:active {
  opacity: 0.8;
  cursor: pointer;
  font-weight: 700;
}
 </style>  

<body>

<!-- top -->	
<div>
<jsp:include page="../top.jsp" flush="false" />	
</div>

<form name="myform" method="post" action='../csReplyInsert.do'>
<div>
<% 
Gdata = request.getParameter("idx") ; 
DBVO vo = dao.csDetail(Gdata);

String id = (String)session.getAttribute("ID");
int qseq = Integer.parseInt(request.getParameter("idx"));
 //System.out.println(qseq);
 %>
	<div>
	
	<table>	
		<input type="hidden" name='qseq' value="<%= qseq %>">
		<tr>
			<th>문의 ID</th>
			<td class="td_2"><input class="input_2" type='text'  name='id' value="<%=vo.getId()%>"></td>
		</tr>
		<tr>
			<th>댓글</th>
			<td><textarea name='reply' cols=60 rows=8 style="vertical-align: bottom;"></textarea>&nbsp;(200자 미만)</td>
		</tr>
		<input type="hidden" name='rep' value="1">
		<!-- <tr>			 
			<td>답변유무</td>			 
			<td><textarea name='rep' cols=50 style="vertical-align: bottom;">0</textarea>&nbsp;</td>
		</tr> -->
	</table>
	</div>
	
	<!-- 버튼 -->
	<table>
	<td class="td_1" align="center">
		<input class="input_1" type='submit' value="확인">
		<input class="input_1" type="reset"  value="입력취소">   
		<button><a href="/AcornSHOP/cs/csList.jsp">목록</a></button>
	</td>
	</table>
</div>
</form>
</body>
</html>