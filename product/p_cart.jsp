<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page session="true"%>
<%@ page import="product.common.DBDAO" %>
<%@ page import="product.common.DBVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review</title>
<%
DBDAO dao = new DBDAO();
DBVO vo = new DBVO();

int pnum=Integer.parseInt(request.getParameter("idx"));
int sale = (Integer)request.getAttribute("sale");
String id = (String)session.getAttribute("ID");
%>
<script>
function tocart(){
 var cid = <%=vo.getId()%>
 var cpnum = <%=pnum%>
 var cquan = <%=vo.getCquan()%>
 var input = confirm("장바구니에 넣으시겠습니까?");
 if(input==true){
	 document.cnt_form.submit();
 } else {return false;}
}

function cntdn(){
  var cnt = document.cnt_form.cnt.value;
  var sale = document.cnt_form.sale.value;
  
  if(cnt>1){
	  document.cnt_form.cnt.value= parseInt(cnt)-1;
	  document.cnt_form.p_cnt.value= parseInt(cnt)-1;
	  document.cnt_form.tot_sale.value= (parseInt(cnt)-1)*sale;
  }
}

function cntup(){
  var cnt = document.cnt_form.cnt.value;
  var sale = document.cnt_form.sale.value;
  
  document.cnt_form.cnt.value= parseInt(cnt)+1;
  document.cnt_form.p_cnt.value= parseInt(cnt)+1;
  document.cnt_form.tot_sale.value= (parseInt(cnt)+1)*sale;
}

</script>
</head>
<body>
<div align=center>
	<p><p><p><p>
	<table border=0 width=100%>
		<tr><td>
		<b>수량 카운트</b>
		<form name=cnt_form action="./pCart.do">
		 <input type=hidden name=id value="<%=id%>">
		 <input type=hidden name=pnum value="<%=pnum%>">
		 <input type=button name=dn_btn value="-" onclick="cntdn();" id="back_btn" style="background-color:#535353; width:20px; height:20px">
		 <input type=text name=cnt value=1 size=1 readonly>
		 <input type=button name=up_btn value="+" onclick="cntup();" id="back_btn" style="background-color:#535353; width:20px; height:20px">
		 <input type=hidden name=sale value="<%=sale%>">
		<p><b>가격 총합</b><br>
		<input type="text" name=sale_2 size= 2 value="<%=sale %> ×" style="border:0; text-align:right" readonly>
		<input type="text" name=p_cnt value="1" size=1 style="border:0;" readonly><p>
		<input type="text" name=tot_sale size= 10 value="<%=sale %>" style="border:0;" readonly>
		</form></td></tr>
		<tr><td><button onclick="tocart()" id="back_btn" style="background-color:#9f3c3c;">장바구니</button></td></tr>
		<tr><td></td></tr>
		<tr><td><a href="mypage/cart.jsp"><button id="back_btn" style="background-color:#535353;">내 장바구니</button></a></td></tr>
	</table>
</div>
</body>
</html>