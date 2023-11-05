<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title> csSearch.jsp  </title>
<link href="style.css" rel="stylesheet" type="text/css">

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

/* 테이블 올렸을 때 */
tbody tr:hover {
  color: #1b1b1b;
  background-color: #ddd;
  /* opacity: 0.8; */
  cursor: pointer;
  font-weight: 700;
}
.tr_1:hover{
 background-color: white;
}

/* 테이블 비율 */
th:nth-child(1),
td:nth-child(1) {
  width: 10%;
}

th:nth-child(2),
td:nth-child(2) {
  width: 10%;
}

th:nth-child(3),
td:nth-child(3) {
  width: 15%;
}

th:nth-child(4),
td:nth-child(4) {
  width: 30%;
}

th:nth-child(5),
td:nth-child(5) {
  width: 20%;
}

.td_1{
  text-align: right;
  margin-right: 10px;
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

span {
  font-size: 12px;
  color: gray;
  margin-left: 10px;
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
  
 <script type="text/javascript">

 </script> 
  
</head>
<body>

<!-- top -->	
<div>
<jsp:include page="../top.jsp" flush="false" />	
</div>

<div align="center">
 
 <%
 
 String skey = (String)request.getAttribute("skey");
 String sval = (String)request.getAttribute("sval");
 
 System.out.println(skey);
 System.out.println(sval);
 
 // 검색 결과 총 게시물 수
 msg = "select count(*) as cnt from qna q where " + skey + " like '%" + sval + "%'";
 RS = ST.executeQuery(msg);
 if (RS.next()) {Gtotal = RS.getInt("cnt");}
  
 pnum=request.getParameter("pageNum");
 if(pnum==null || pnum=="" || pnum.equals("")){ pnum="1"; }
 pageNUM=Integer.parseInt(pnum); 

 int postsPerPage = 10;
 start = (pageNUM-1) * postsPerPage +1; 
 end = (pageNUM * postsPerPage); 

 if (Gtotal % postsPerPage == 0) { 
     pagecount = Gtotal / postsPerPage;
 } else {
     pagecount = (Gtotal / postsPerPage) + 1;
 }

 temp = (pageNUM-1)%10;  
 startpage = pageNUM-temp;  
 endpage = startpage+9; 

 if(endpage>=pagecount){ endpage=pagecount; }
   
 // 검색된 게시물을 가져오는 쿼리 실행
 msg = "select q.* from qna q where " + skey + " like '%" + sval + "%' order by indate desc";
 RS = ST.executeQuery(msg);

 %>
 
<table border="1" cellspacing="0"  width="800">
  <tr class="tr_1" align="right">
      <td class="td_1" colspan="6">
       검색된 게시물 수 : <%=Gtotal%>
        <button><a href="/AcornSHOP/cs/csInsert.jsp">글쓰기</a></button>
        <button><a href="/AcornSHOP/cs/csList.jsp">목록</a></button> 
      </td> 
  </tr>  
  
  <tr>
    <th>No</th> <th>주문번호</th> <th>아이디</th>  <th>제목</th> <th>날짜</th> 
  </tr>   
   
<% 
int postCount = 0;

while(RS.next() == true) {
    Grn = postCount + 1;  // postCount 변수를 사용하여 순차적인 번호 부여
    Gqseq = RS.getInt("qseq");  
    Gid = RS.getString("id");
    Gsubject = RS.getString("subject");
    Gcontent = RS.getString("content");
    Greply = RS.getString("reply");
    Gwdate = RS.getDate("indate");

    postCount++;
    if (postCount >= start  && postCount <= end) {
%>   
   
   <tr>
      <td> <%= Grn %> </td> 
      <td> <%= Gqseq %> </td> 
      <td> <%= Gid %> </td> 
      <td> 
      	<a href="cs/csDetail.jsp?idx=<%= Gqseq %>"><%= Gsubject %></a>      	
		<form method="post" action="csReplyList.jsp">
	        <input type="hidden" name="qseq" value="<%= Gqseq %>">
	        <input type="submit" style="display: none;">
	    </form>
      </td> 
      <td> <%= Gwdate %> </td>     
   </tr> 

<%   
   }
}

// 페이지네이션 부분
%>
<tr class="tr_1" align="center">
     <td colspan="6">
       <% 
       if(Gtotal >= postsPerPage){
           out.println("<a href=csSearch.do?pageNum=1&skey="+skey+"&sval="+sval+">◀|</a>");
       }
       if(startpage > 10){
           out.print("<a href=csSearch.do?pageNum="+(startpage-10)+"&skey="+skey+"&sval="+sval+">[이전]</a>"); 	
       }
       
       for(int i=startpage; i<=endpage; i++){
           if(i==pageNUM){
               out.print("<font style='font-size:16pt;color:red;'>["+i+"]</font>"); 
           } else {
               out.print("<a href=csSearch.do?pageNum="+i+"&skey="+skey+"&sval="+sval+">["+i+"]</a>");
           }
       }
       
       if(endpage<pagecount){
           out.print("<a href=csSearch.do?pageNum="+(startpage+10)+"&skey="+skey+"&sval="+sval+">[다음]</a>"); 
       }
       if(Gtotal >= postsPerPage){
           out.println("<a href=csSearch.do?pageNum="+pagecount+"&skey="+skey+"&sval="+sval+">|▶</a>");
       }
       %>
</td> 
</tr>
   
</table>  

</div>
 <br><p style="margin-bottom:350px;">  
</body>
</html>








