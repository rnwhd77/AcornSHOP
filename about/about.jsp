<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>about</title>
<link href="../style.css" rel="stylesheet" type="text/css">

<style>
 body {
 background-color: white;
}

table {
  border-collapse: collapse;
  width: 1500px;
  margin: 1rem auto;
  background-color: white;
}

/* 테이블 행 */
th, td {
  padding: 8px;
  text-align: left;
  border-top: 1px solid #ddd;
  border-bottom: 1px solid #ddd;
  text-align: center;
}

th {
 /*  background-image: url("HomeTest.png");
  width: 100px;
  height: 100px; */
  background-color: rgb(27, 27, 27);
  opacity: 0.6;
  color: white;
  font-size: 20px;
}

/* 테이블 비율 */
th:nth-child(1),
td:nth-child(1) {
  width: 15%;
}

th:nth-child(2),
td:nth-child(2) {
  width: 15%;
}

th:nth-child(3),
td:nth-child(3) {
  width: 20%;
}

th:nth-child(4),
td:nth-child(4) {
  width: 20%;
}

th:nth-child(5),
td:nth-child(5) {
  width: 20%;
}

th, td {
  border-left: none;
  border-right: none;
}


a:link, a:visited:not(.jo) {
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

<script>
function shuffleImages() {
    var imageRow = document.getElementById("imageRow");
    var imageCells = Array.from(imageRow.getElementsByTagName("td"));

    // 이미지와 해당 링크들을 배열로 추출
    var images = [];
    var links = [];
    imageCells.forEach(function(cell) {
        var image = cell.querySelector("img");
        var link = cell.querySelector("a");
        images.push(image);
        links.push(link);
    });

    // 이미지와 해당 링크들을 랜덤하게 섞음
    for (var i = images.length - 1; i > 0; i--) {
        var j = Math.floor(Math.random() * (i + 1));

        // 이미지와 링크를 함께 섞음
        imageRow.removeChild(imageCells[i]);
        imageRow.insertBefore(imageCells[i], imageCells[j]);

        imageRow.removeChild(imageCells[j]);
        imageRow.insertBefore(imageCells[j], imageCells[i]);
    }
}
// 페이지가 로드될 때 shuffleImages 함수 호출
window.addEventListener("load", shuffleImages);
</script>

</head>
<body>

<!-- top -->	
<div>
<jsp:include page="../top.jsp" flush="false" />	
</div>

<table>

	<tr>
		<th colspan="2">The Beginning</th>
		<td colspan="3">
		<p>1967년, 워싱턴 주에는 아웃도어 마니아 스킵, 엔지니어 머레이, 그리고 뛰어난 재봉사인 잔, 이렇게 세 명의 친구가 살고 있었습니다.
		<br>머레이가 조절 가능한 배낭용 알루미늄 프레임을 최초로 만들어 Alcoa Company로부터 디자인 상을 받았을 때, <br>그에게 순간적인 영감이 떠올랐습니다. 
		<br>머레이는 그의 여자친구 잔에게 새로운 알루미늄 프레임을 위한 백팩 패턴을 만들어 달라고 부탁했고, <br>사업이 성공한다면 그녀의 이름을 따서 회사 이름을 짓겠다고 약속했습니다. 
		<br>그것은 성공적이었고 그렇게 AcornSHOP이 탄생했습니다.
		<br>
		<br>AcornSHOP is with you for Life.
		<br>우리의 모든 가방은 평생 보증이 됩니다. <br>좋은 것은 지속적이어야 하기 때문에, 가방 중 하나가 고장 나면 아무런 질문을 하지 않고 교체나 수리를 해드립니다.
		<br>We’re in this together.
		<p>
		<br>AcornSHOP은 언제나 대자연과 일상 속의 모험을 추구하며 큰 영감을 받습니다. <br>그리고 우리의 정신을 공유하는 커뮤니티를 자랑스럽게 생각하며 지지합니다.
		</p>
		</td>
	</tr>
	<tr>
		<td colspan="2">The Journey Continues</td>
		<td colspan="3">
		 여러분이 세상을 발견하도록 돕는 것이 여전히 우리가 하는 모든 일의 원동력입니다. 
		 <br><br>
		 당신이 계속해서 탐구하는 한, 우리는 끊임없이 새롭고 기능적인 장비를 혁신하고 엔지니어링 할 것입니다.
		</td>
	</tr>	

	<tr id="imageRow">
		<td>Find your Fit</td>
		<td><a href="/AcornSHOP/listDetail.do?idx=1100"><img src="/AcornSHOP/about/images/bag1.png" width=200></a></td> 
		<td><a href="/AcornSHOP/listDetail.do?idx=1200"><img src="/AcornSHOP/about/images/bag2.png" width=200></a></td> 
		<td><a href="/AcornSHOP/listDetail.do?idx=1300"><img src="/AcornSHOP/about/images/bag3.png" width=200></a></td> 
		<td><a href="/AcornSHOP/listDetail.do?idx=1400"><img src="/AcornSHOP/about/images/bag4.png" width=200></a></td> 
	</tr>

</table>
</body>
</html>