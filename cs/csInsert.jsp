<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>csInsert</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script type="text/javascript"></script>

<style>
 body {
  background-color: white;
}

table {
  border-collapse: collapse;
  width: 1100px;
  margin: 1rem auto;
  background-color: white;
}

/* 테이블 행 */
th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
  border-left: 1px solid #ddd;
  border-right: 1px solid #ddd;
  text-align: center;
  
}

th {
  background-color: #1b1b1b;
  color: #ddd;
  font-size: 17px;
}

/* 테이블 비율 */
th:nth-child(1),
td:nth-child(1) {
  width: 30%;
}

th:nth-child(2),
td:nth-child(2) {
  width: 97.4%;
}

.td_1 input, textarea{
 float: left;
 margin-left: 50px;
}

.td_1 select {
  float: left;
  margin-left: 50px;
  width: 130px;
  height: 30px;
}

.td_3{
  border-top: none;
  border-bottom: none;
  border-left: none;
  border-right: none;
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
  width: 100px;
}

.input_3{
  background-color: white;
  border-radius: 8px;
  color: black;
  padding: 8px 15px;
  text-decoration: none;
  display: inline-block;
  width:200px;
  font-size: 15px;
  font-color: white;
  width: 573px;
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

 .span_1 {
  display: inline-block;
  vertical-align: bottom;
  padding-top: 13px;
  font-size: 13px;
}

.span_2{
 display: inline-block;
 text-align: right;
 vertical-align: bottom;
 padding-top: 110px;
 font-size: 13px;
}

button {
  background-color: white;
/*   border: 2px solid #555555; */
  border-radius: 8px;
  color: black;
  padding: 8px 15px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 15px;
  font-color: white;
}

a:link, a:visited:not(.jo) {
 /*  background-color: black; */
  color: black;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

a:hover, a:active:not(.jo) {
 /*  color: black; */
  /* background-color: rgb(222, 222, 222); */
  opacity: 0.8;
  cursor: pointer;
  font-weight: 700;
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

 </style>  

</head>
<body>

<!-- top -->	
<div>
<jsp:include page="../top.jsp" flush="false" />	
</div>
<div>

<%String id = (String)session.getAttribute("ID"); %>
<form name="myform" method="post" action='../csInsert.do'>
<div>
	<div>
	<table>
		<th colspan="2">문의사항</th>
		<tr>
			<td>문의구분</td>
			<td class="td_1">
			<select name="inquiryType">
				<option >배송문의</option>
				<option >주문문의</option>
				<option >상품문의</option>
				<option >기타문의</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>ID</td>
			<td class="td_1"><input class="input_2" type="text" name='id' value="<%=id%>"></td>
		</tr>
			
		<tr>
			<td>제목</td>
			<td class="td_1"><input class="input_3" type='text' name='subject'>
			<span class="span_1">&nbsp;(20자 미만)</span>
			</td>
		</tr>	
		<tr>
			<td>문의 내용</td>
			<td class="td_1"><textarea name='content' rows=7 cols=70></textarea>
			<span class="span_2">&nbsp;(400자 미만)</span>
			</td>
		</tr>
		<!-- 댓글 -->
		<input type="hidden" name='reply' value=""> 
		<!-- 답변유무 -->
		<input type="hidden" name='rep' value="0">
	</table>
	</div>

	<!-- 버튼 -->
	<table>
	<td class="td_3" align="right">
		<input class="input_1" type='submit' value="확인">
		<input class="input_1" type="reset"  value="입력취소"> 
		<button><a href="/AcornSHOP/cs/csList.jsp">목록</a></button>
	</td>
	</table>  
</div>
</form>
</body>
</html>