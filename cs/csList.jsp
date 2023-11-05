<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title> csList.jsp  </title>
<link href="../style.css" rel="stylesheet" type="text/css">

<script type="text/javascript"></script> 
<style>
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
  border-bottom: 1px solid #ddd;
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

th, td {
  border-left: none;
  border-right: none;
}

.td_1{
  text-align: right;
  margin-right: 10px;
}
 button {
  background-color: white;
  border-radius: 8px;
  padding: 8px 15px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 15px;
  font-color: white;
}
a:link, a:visited:not(.jo) {
  color: black;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}
a:hover, a:active:not(.jo) {
  opacity: 0.8;
  cursor: pointer;
  font-weight: 700;
}
.span_1{
 color: gray;
 font-size: 11px;
}

 </style>
</head>
<body>

<!-- top -->	
<div>
<jsp:include page="top.jsp" flush="false" />	
</div>

<div>
 
<%
msg="select count(*) as cnt from qna";
RS = ST.executeQuery(msg);
if(RS.next()==true){ Gtotal=RS.getInt("cnt"); }

pnum=request.getParameter("pageNum"); //pnum = 사용자가 요청한 페이지 번호
if(pnum==null || pnum=="" || pnum.equals("")){ pnum="1"; }
pageNUM=Integer.parseInt(pnum); //pageNUM = 숫자로 변환된 요청 페이지 번호를 저장하는 변수

int postsPerPage = 10;
start = (pageNUM-1)*10+1 ; 
end = (pageNUM*10) ; 

if (Gtotal % postsPerPage == 0) { 
    pagecount = Gtotal / postsPerPage;
} else {
    pagecount = (Gtotal / postsPerPage) + 1;
}

temp = (pageNUM-1)%10;  
startpage = pageNUM-temp;  
endpage = startpage+9; 

if(endpage>=pagecount){ endpage=pagecount; } 
%>
 
<table align="center">
 <tr class="tr_1">
      <td class="td_1" colspan="6">
       총 게시물: <%=Gtotal%> &nbsp; 
       <button><a href="/AcornSHOP/cs/csInsert.jsp">글쓰기</a></button>   
      </td> 
  </tr>
  
  <tr>
    <th>No</th> <th>주문번호</th> <th>아이디</th>  <th>제목</th> <th>작성 날짜</th> 
  </tr>    
  
<% 
Integer qseq = (Integer)request.getAttribute("qseq");
String subject = (String)request.getAttribute("subject");
String id = (String)request.getAttribute("id");
String content = (String)request.getAttribute("content");
String reply = (String)request.getAttribute("reply");
String rep = (String)request.getAttribute("rep");

  msg = "select rownum rn, q.* from qna q order by indate desc";
  RS = ST.executeQuery(msg);

  int postCount = 0;
  
  while(RS.next()==true){
   Grn = RS.getInt("rn"); 
   Gqseq = RS.getInt("qseq");  
   Gid = RS.getString("id");
   Gsubject = RS.getString("subject");
   Gcontent = RS.getString("content");
   Greply = RS.getString("reply");
   String Grep = RS.getString("rep");
   Gwdate = RS.getDate("indate");
   
   String reptext = "";

   if(Grep.equals("1")){
   	 reptext="답변완료";
   }else if(Grep.equals("0")){
   	 reptext="답변확인중";
   }
   
   postCount++;
   if (postCount >= start && postCount <= end) {
%>   
   
   <tr>
      <td> <%= Grn %> </td> 
      <td> <%= Gqseq %> </td> 
      <td> <%= Gid %> </td> 
      <td> 
      	<a href="csDetail.jsp?idx=<%= Gqseq %>">
      	<%= Gsubject %>&nbsp;
      	<span class="span_1"><%= reptext %></span>
      	</a>     	
		<form method="post" action="csReplyList.jsp">
	        <input type="hidden" name="qseq" value="<%= Gqseq %>">
	        <input type="submit" style="display: none;">
	    </form>
      </td> 
      <td> <%= Gwdate %> </td> 
   </tr> 
   
 <%
   }//if end
  }//while end
 %>

 <tr class="tr_1">
     <td colspan="6">
       <% 
       if(Gtotal>=10){
       out.println("<a href=csList.jsp?pageNum="+1+">◀|</a>");}
         if(startpage > 10){
        	out.print("<a href=cs/csList.jsp?pageNum="+(startpage-10)+">[이전]</a>"); 
         }
       %>
        
       <%
         for(int i=startpage; i<=endpage; i++){
            if(i==pageNUM){
              out.print("<font style='font-size:16pt;color:red;'>["+i+"]</font>"); 
            }else{
           		out.print("<a href=csList.jsp?pageNum="+i+">["+i+"]</a>");
            }
         }//for end   
       %>

       <% 	 
         if(endpage<pagecount){
        	out.print("<a href=cs/csList.jsp?pageNum="+(startpage+10)+">[다음]</a>"); 
         }
       if(Gtotal>=10){
    	   out.println("<a href=csList.jsp?pageNum="+pagecount+">|▶</a>");}
       %>
      </td> 
  </tr>
  <tr align="center" class="tr_1">
     <td colspan="6">
        <form name="myform" method="post" action='../csSearch.do'>
          <select name="skey" onchange="clearitem();">
            <option value="id"> 아이디검색 </option>
            <option value="subject"> 제목검색 </option>
          </select>
          <input type="text" name="sval" value="<%=sval%>" size="6">
          <input type="submit" value="검색">
          <input type="reset" value="취소">
        </form>
     </td>
  </tr> 
 
</table>  
</div>

 <br><p style="margin-bottom:1070px;">  
</body>
</html>








