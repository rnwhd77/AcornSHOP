<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
 <!DOCTYPE html>
 <html>
 <head>
 <meta charset="UTF-8">
 <title>Insert title here</title>
 <script>
    //상품을 추가하기위한 정보를 담아 AdminProduct.do 로 보내는 자바스크립트 함수
    function product_write() {
 
        var p_name = document.form1.p_name.value; 
        var p_price = document.form1.p_price.value; 
        var p_con = document.form1.p_con.value; 
        var p_code = document.form1.p_code.value;
        
		 if (p_code == "") { //상품 코드 입력되어 있지 않으면
            alert("상품코드 입력하세요");
            document.form1.p_code.focus(); 
            return;
        }
        if (p_name == "") { //상품 이름이 입력되어 있지 않으면
            alert("상품명을 입력하세요");
            document.form1.p_name.focus(); 
            return;
        }
        if (p_price == "") { //상품가격이 입력되어 있지 않으면
            alert("가격을 입력하세요");
            document.form1.p_price.focus(); 
            return;
        }
        if (p_con == "") { //상품설명이 입력되어 있지 않으면
            alert("상품설명을 입력하세요");
            document.form1.p_con.focus(); 
            return;
        }
        

        document.form1.action = "../AdminProduct.do"; //list.do 페이지로 form1에 저장된 자료를 전송함
        document.form1.submit();
    }
 </script>
 </head>
 <body>
     <!-- 관리자용 메뉴는 일반 회원의 메뉴와 다르기 때문에 일부러 관리자용 메뉴를 만들고 그 메뉴를 출력한다. -->
    <h2>상품 등록</h2>
    <form id="form1" name="form1" method="post"
        enctype="multipart/form-data">
        <!-- 파일업로드를 위해 추가하는 타입 -->
 
        <table>
         	<tr>
                <td>상품코드</td>
                <td><input name="p_code"></td>
            </tr>
            <tr>
                <td>상품명</td>
                <td><input name="p_name"></td>
            </tr>
            <tr>
                <td>가격</td>
                <td><input name="p_price"></td>
            </tr>
             <tr>
                <td>할인가</td>
                <td><input name="p_sale"></td>
            </tr>
            	<tr>
					<th>설 &nbsp;&nbsp;&nbsp; 명</th>
					<td><textarea cols="80" rows="10" name="p_con"></textarea></td>
				</tr>
            <tr>
                <td>상품이미지</td>
                <td><input type="file" name="p_img"></td>
            </tr>
            <tr>
 
                <td colspan="2" align="center"><input type="button" value="등록"
                    onclick="product_write()">
                    <input type="button" value="목록"  onclick="location.href='../list.do'"> 
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
