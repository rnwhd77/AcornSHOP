<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>map</title>
<link href="../style.css" rel="stylesheet" type="text/css">

<style>
 body {
  background-color: white;
}

table {
  border-collapse: collapse;
  width: 1000px;
  margin: 1rem auto;
  background-color: white;
}

/* 테이블 행 */
th, td {
  padding: 8px;
  text-align: left;
  border-top: 1px solid #ddd;
  border-bottom: 1px solid #ddd;
  border-left: 1px solid #ddd;
  border-right: 1px solid #ddd;
  text-align: center;
}

th {
  background-color: #1b1b1b;
  color: #ddd;
}

tr:nth-child(even) {background-color: #f2f2f2;}



.map{
 /*  background-color: black; */
  color: black;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

a:hover, a:active {
  opacity: 0.8;
  cursor: pointer;
  font-weight: 1000;
}

.p_1{
  font-weight: 1000;
}

 </style> 

</head>
<body>

<!-- top -->	
<div>
<jsp:include page="../top.jsp" flush="false" />	
</div>
<div>

<table border="1" cellspacing="0"  width="500" cellpadding="10">
<tr>
	<td>
		<div>
			<p class="p_1">WAYLON</p>
			<p>서울특별시 강남구 압구정로46길 32 1층</p>
			<p>운영시간 : 매일 11:00 - 20:00</p>
			<p>대표전화 : 070-8802-1088</p>
			<p class="p_1">
				<a class="map" href="https://map.naver.com/v5/entry/place/38009147?placePath=%2Fhome&c=15,0,0,0,dh">지점정보 →</a>
			</p>
		</div>
	</td>
</tr>
<tr>
	<td>
		<div>
			<p class="p_1">PLANET B 홍대점</p>
			<p>서울특별시 마포구 양화로 188 AK&홍대 2층</p>
			<p>운영시간 : 매일 11:00 - 22:00</p>
			<p>대표전화 : 02-789-9858</p>
			<p class="p_1">
				<a class="map" href="https://map.naver.com/v5/search/PLANET%20B%20%ED%99%8D%EB%8C%80%EC%A0%90/place/1088763547?c=15,0,0,0,dh&placePath=%3Fentry%253Dpll">지점정보 →</a>
			</p>
		</div>
	</td>
</tr>
<tr>
	<td>
		<div>
			<p class="p_1">PLANET B 용산점</p>
			<p>서울특별시 용산구 한강대로 23길 55 패션관 6층</p>
			<p>운영시간 : 매일 10:30 - 20:30</p>
			<p>대표전화 : 02-2012-4560</p>
			<p class="p_1">
				<a class="map" href="https://map.naver.com/v5/search/PLANET%20B%20%EC%9A%A9%EC%82%B0%EC%A0%90/place/1411635724?c=15,0,0,0,dh&isCorrectAnswer=true">지점정보 →</a>
			</p>
		</div>
	</td>
</tr>
<tr>
	<td>	
		<div>
			<p class="p_1">한컬렉션 광화문점</p>
			<p>서울특별시 종로구 세종대로 149 1층/지하1층</p>
			<p>운영시간 : 매일 12:00 - 20:00</p>
			<p>대표전화 : 02-1533-1234</p>
			<p class="p_1">
				<a class="map" href="https://map.naver.com/v5/entry/place/1544908827?placePath=%2Fhome">지점정보 →</a>
			</p>
		</div>
	</td>
</tr>
</table>


</body>
</html>