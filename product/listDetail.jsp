<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="product.common.DBDAO" %>
<%@ page import="product.common.DBVO" %>
<% DBDAO dao = new DBDAO();
	DBVO vo = new DBVO(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
 <style>
*{margin-left:auto; margin-right:auto;}
a{text-decoration: none; }
#back_btn{width:90px; height:30px; color:#EFEDED; border:0px;}
</style>
<jsp:include page="../top.jsp"></jsp:include>
<%
double staravg = (Double)request.getAttribute("staravg");
int pnum = (Integer)request.getAttribute("pnum");
String img = (String)request.getAttribute("img");
String name = (String)request.getAttribute("name");
int price = (Integer)request.getAttribute("price");
int sale = (Integer)request.getAttribute("sale");
int rcnt = (Integer)request.getAttribute("rcnt");
int qcnt = (Integer)request.getAttribute("qcnt");
int RUcnt = (Integer)request.getAttribute("RUcnt");
String content = (String)request.getAttribute("content");
Date date = (Date)request.getAttribute("date");
List starlist = (List)request.getAttribute("starlist");
String id = (String)session.getAttribute("ID");
if(id==null)id="";
%>
</head>
<body>
<div>
<table border=0 width=60%>
<tr>
  <td colspan=2><a href="list.do"><button id="back_btn" style="background-color:#535353;">이전으로</button></a></td>
</tr>
   <tr>
    <td width=50%><a href="product/images/<%=img%>" width=200 >
	<img src="product/images/<%=img%>" width=200 ></a></td>
	<td rowspan=5><% if(id!=""){%><jsp:include page="p_cart.jsp" flush="false" /><%} %></td> 
   </tr>
   <tr>
   	<td><b><%= name %></b></td>
   	</tr>
   <tr>
   	<td>가격: <del> <%= price %>원 </del> &nbsp;<font color="red"><%= sale %>원</font></td>
   	</tr>
   <tr>
   	<td>상품설명: <%= content %></td>
   </tr>
   <tr>
   	<td>등록일자: <%= date %></td>
   </tr>
   <tr><td><p></td></tr>
   <tr><td colspan=2><a href="./qnaAll.do?idx=<%=pnum%>">
  	<button id="back_btn" style="background-color:#535353; width:160px;">상품 관련 1:1 문의(<font color="#ffbc00"><%=qcnt %></font>)</button></a></td></tr>
 </table>
 <table border=0 width=60%> 
 <tr><td colspan=2><hr style="border:solid 1pt #eee;"></td></tr> 
 <tr><td colspan=2><p></td></tr><tr><td colspan=2><p></td></tr>
 <tr><td colspan=2><b>별점</b></td></tr>
   <tr>
   	<td rowspan=<%=starlist.size() %> width=50%>
   		<% int starvg = (int)staravg; %>
   		<% int strmod=(int)Math.floor((staravg-starvg)*10); %>
   		<font color="#ffbc00"><b>
   		<% for(int i=1; i<=starvg; i++){%>★<%}%> <%=staravg %>/ 5</b></font>
   		<br><font color="gray">총 <%=rcnt %>건 (리뷰를 남긴 사람 수: <%=RUcnt %>명)</font>
   	</td>
   	<% for(int i=0; i<starlist.size(); i++){
      DBVO dto=(DBVO)starlist.get(i);
      int star = dto.getStar(); int starcnt=dto.getStarcnt();
      int rrcnt = dto.getRcnt(); double staravgg = (double)starcnt/rrcnt;
      double staravgcnt = (double)Math.round(staravgg*10000)/100.0;
      int stt = (int)staravgcnt; int st=100-(int)stt;
   %>
      <td>
         <font color="#ffbc00"><b><% for(int j=1; j<=star; j++){out.print("★");} for(int j=0; j<5-star; j++){out.print("☆");} %></b></font> 
         <img src="product/images/bar3.png" style="height:10px; width:<%=stt%>px;">
         <span style="padding-right:<%=st%>px;"></span> <%=staravgcnt%>% (<%=starcnt %>명)</td>
   </tr>
   <% } %>
   <tr><td colspan=2><p></td></tr>
   <tr><td colspan=2><b>리뷰(<font color="red"><%=rcnt %></font>)</b></td>
   </tr>
   <tr><td colspan=2><hr style="border:solid 1pt #999;"></td></tr>
   <tr><td colspan=2>
	<jsp:include page="listReview.jsp">
		<jsp:param value="<%=pnum %>" name="idx"/>
	</jsp:include>
	</td>
   </tr>
   <tr align="right">
	<td colspan=4>
	  <a href="./reviewAll.do?idx=<%=pnum%>&order=1"><button id="back_btn" style="background-color:#699dc6; width:160px;">리뷰 더보기</button></a>
	</td>
	</tr>
</table>
<p><p><p><p>
<jsp:include page="../bottom.jsp"></jsp:include>
</div>
</body>
</html>