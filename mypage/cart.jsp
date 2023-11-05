<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>​
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="mypage.common.DBVO" %>
<%@ page import="mypage.common.DBDAO" %>
<html>
<head>
<link href="css/cart.css" rel="stylesheet" type="text/css">
<link href="../style.css" rel="stylesheet" type="text/css">
<jsp:include page="../top.jsp" flush="false" ></jsp:include>

<style>
* { padding: 0; margin: 0; }

html, body {
  height: 70%;
  background: white;
}
 #cart_tb{
  text-align: center;
  margin-left: 450px;
 }

#container {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  height: 100%;
  

}

#loginBox {
  width: 400px;
  height: 200px;
  text-align: center;
  border: 2px solid black;
  background-color:white;
}

#loginBoxTitle {
  background-color:black;
  color:#ffffff;
  padding: 5px;
}
#inputBox {
  margin: 30px;
}
#loginBox input {
  width: 300px;
  height: 24px;
  margin: 0 0 3px 0;
  padding: 5px 5px;
  background-color: white;
}

#loginBox loginbtn {
  width: 300px;
  height: 24px;
  margin: 0 0 3px 0;
  padding: 5px 5px;	
}

#inputBox submit {
  padding: 5px 5px;
  background-color: black;
}

h2{
	margin-top:200px;
	text-align : center;
}


</style>
<title>Cart</title>
<script>
<%

int num = 0;

String id = (String)session.getAttribute("ID");

DBDAO dbsql=new DBDAO();
List<DBVO> bb = (List<DBVO>)dbsql.Cartlist(id);

%>
var request = null;

function log() {
	request = new XMLHttpRequest();
	var ID = myform.ID.value;
	var PW = myform.PW.value;
	if (ID == "" && PW == "") {
		alert("ID,PW를 입력해주세요");
	}else if (ID == ""){
		alert("ID를 입력해주세요");			
	}else if (PW == ""){
		alert("PW를 입력해주세요")
	}
}

function cntdn(i){
	
      var cnt = document.getElementsByClassName("cnt")[i].innerText;
      var tot = document.getElementsByClassName("price")[i].innerText;
      
      var price = parseInt(tot)/parseInt(cnt);
			
      if(cnt>1){	 
	  cnt = parseInt(cnt)-1;
	  tot = parseInt(tot)-parseInt(price);
	  document.getElementsByClassName("price")[i].innerText = tot;
	  document.getElementsByClassName("cnt")[i].innerText = cnt;
	  }
}

function cntup(i){
	
	  var cnt = document.getElementsByClassName("cnt")[i].innerText;
	  var tot = document.getElementsByClassName("price")[i].innerText;
	  var price = parseInt(tot)/parseInt(cnt);
	  
      cnt = parseInt(cnt)+1;
      tot = parseInt(tot)+parseInt(price);
      document.getElementsByClassName("price")[i].innerText = tot;
	  document.getElementsByClassName("cnt")[i].innerText = cnt;
	}


</script>
</head>
<body>
<%
if( id!=null){
%>
       <h2><%=id%>님 목록</h2>
		<table class = "cart" id="cart_tb">
		<tr class="cart_tb2">
			<td>번호</td>
			<td>상품번호</td>
			<td>수량</td>
			<td>가격</td>
			<td>구매</td>
			<td>삭제</td>
		</tr>
	<%
		for(int i=0 ; i<bb.size(); i++){
			DBVO bean = (DBVO)bb.get(i) ;
			
			int cnum = bean.getCartnum();
			int Prodnum = bean.getProdnum() ;
			int Quantity = bean.getQuantity() ;
			int Price = bean.getPrice();	

	
		session.setAttribute("ID",id);
		session.setAttribute("pnum", bean.getProdnum());
	%>
		<form name = "cart_form " method="post" action="../Cart.do">
		<tr>
			<td><%=(i+1)%></td>
			<td><%=bean.getProdnum()%></td>
			<td>
			<input type='button' name = cnt_dn  value="-"  onclick = "cntdn(<%=i%>);">
		   	<SPAN class="cnt" style= "display:inline-block;width:30px;border:1px solid black;" ><%=bean.getQuantity()%> </SPAN>	   
			<input type='button' name = cnt_up  value="+" onclick = "cntup(<%=i%>);">
			</td>
			<td>
			<SPAN class="price" style= "text-align=center; display:inline-block;width:60px;border:1px solid black;" ><%=bean.getPrice()%> </SPAN>	   
			</td>
			<!-- <td><input type=text name=price value=<%=bean.getPrice()%> size=3 readonly></td> -->
			<td><a href=""><input type="button" name="buy" value="구매"></a></td>
			<td><a href="../Cart.do?idx=<%=id%>"><input type="submit" name="delete" value="삭제"></a></td>
		</tr>
		<%		
		}//for
		%>
		</form>
	</table>
	<% }//if 
	else{ %>
		<h2>로그인 후 이용해주세요.</h2>
<div id="message">
		<form name="myform" action="../login.do">
    <div id="container">
      <div id="loginBox">
        <p id="loginBoxTitle">로그인</p>
        <div id="inputBox">
        <p></p>
          <p style =font-size:15pt;>ID <input placeholder= "id를 입력해주세요" type="text" name="ID" class="form-control"></p>
          <p style =font-size:11pt;>PW <input placeholder= "pw를 입력해주세요" type="password" name="PW" class="form-control"></p>
           <br>
           &nbsp;&nbsp;&nbsp;<a href = "../login/IDFind.jsp">ID 찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href = "../login/PWDFind.jsp">PASSWORD 찾기</a><br>
          <p>&nbsp;&nbsp;&nbsp;&nbsp;<input class="loginbtn" type=submit value="login" onClick="log()"></p>
          
        </div>  
      </div>
    </div>	
		</form>
	</div>	
	<% }%> 
	</body>
</html>