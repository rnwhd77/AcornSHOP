<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faq</title>
<link href="../style.css" rel="stylesheet" type="text/css">


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
  padding: 10px;
  text-align: left;
  border-bottom: 1px solid #ddd;
  border-right: 1px solid #ddd;
  border-left: 1px solid #ddd;
  text-align: center;
}

th {
  background-color: #1b1b1b;
  color: #ddd;
  border-collapse: collapse;
}

/* 테이블 비율 */
th:nth-child(1),
td:nth-child(1) {
  width: 10%;
}

th:nth-child(2),
td:nth-child(2) {
  width: 50%;
}

.td_1{
height: auto;
}

.td_2 {

  visibility:hidden;
  overflow: hidden;
  width: 0;
  height: 0;
  margin: 0;
  padding: 0;
  

  padding: 8px;
  text-align: center;
  border-bottom: 1px solid #ddd;
  border-right: 1px solid #ddd;
  border-left: 1px solid #ddd;
  
}

.tr {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
  border-right: 1px solid #ddd;
  border-left: 1px solid #ddd;
  text-align: center;
}

tr:nth-child(even){background-color: #f2f2f2;}

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
 </style>  

<script>
/* document.addEventListener("DOMContentLoaded", function() {
	  var td1Elements = document.getElementsByClassName("td_1");

	  for (var i = 0; i < td1Elements.length; i++) {
	    td1Elements[i].addEventListener("click", function() {
	      var rowIndex = this.parentNode.rowIndex;
	      var table = this.parentNode.parentNode;
	      var sibling = table.rows[rowIndex + 1].querySelector(".td_2");
	      if (sibling && sibling.classList.contains("td_2")) {
	        if (sibling.style.visibility === "hidden") {
	          sibling.style.visibility = "visible"; // 숨겨져 있을 경우 표시
	        } else {
	          sibling.style.visibility = "hidden"; // 표시되어 있을 경우 숨김
	        }
	      }
	    });
	  }
	}); */
</script>

</head>

<body>

<!-- top -->	
<div>
<jsp:include page="../top.jsp" flush="false" />	
</div>

<%!
	private int pageSize = 5; 
	private int limit = 5; 	
	private int pageNUM;		
	private int pageCount;		
	private int temp;			
	private int startPage;		
	private int total;	
	
	private String pnum;
	private int rownum;
	
%>
<div>
	
	<table>
		<tr>
			<th width=10% >NO</th>
			<th width=50% >FAQ &nbsp; 자주 묻는 질문</th>
			<!-- <th width=30% >DATE</th> -->
		</tr>
			
		<tr>
			<td rowspan="2">1</td>
			<td class="td_1">Q . &nbsp;아이디와 비밀번호가 기억나지 않아요.</td>
		</tr>
	 	<tr>
			<td colspan="2">A . &nbsp;로그인 화면에서 아이디 찾기/비밀번호 찾기를 통해 확인 가능합니다.</td>
		</tr>
		
		<tr>
			<td rowspan="2">2</td>
			<td class="td_1">Q . &nbsp;회원 정보 수정은 어디서 하나요?</td>
		</tr>
	 	<tr>
			<td colspan="2">A . &nbsp;회원 정보 수정은 마이페이지에서 직접 변경 가능합니다.</td>
		</tr>
		
		<tr>
			<td rowspan="2">3</td>
			<td class="td_1">Q . &nbsp;재고가 없어요. 언제쯤 구입할 수 있을까요?</td>
		</tr>
	 	<tr>
			<td colspan="2">
			A . &nbsp;품절 상품 재입고 여부 및 일정은 상품 문의를 남겨주시면 최대한 정확한 일정을 알려드리도록 노력하겠습니다.
			</td>
		</tr>
		
		<tr>
			<td rowspan="2">4</td>
			<td class="td_1">Q . &nbsp;같은 브랜드 다른 상품으로 교환 가능 한가요?</td>
		</tr>
	 	<tr>
			<td colspan="2">A . &nbsp;같은 브랜드 상품이라도 품번 및 상품이 다르면 교환이 불가능합니다.</td>
		</tr>
		
		<tr>
			<td rowspan="2">5</td>
			<td class="td_1">Q . &nbsp;주문한 상품이 일부만 도착했어요.</td>
		</tr>
	 	<tr>
			<td colspan="2">A . &nbsp;브랜드 및 상품에 따라 출고지가 다르기 때문에 여러 개 상품을 주문한 경우에는 각각 배송됩니다.</td>
		</tr>
		
 
	</table>
</div>

</body>
</html>