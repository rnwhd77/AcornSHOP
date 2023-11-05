<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title> csDetail.jsp  </title>
<link href="../style.css" rel="stylesheet" type="text/css">
</head>

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
  border-bottom: 1px solid #ddd;
  text-align: center;
}

th {
  background-color: #1b1b1b;
  color: #ddd;
}

th, td {
  border-top: 1px solid #ddd;;
  border-left: 1px solid #ddd;;
  border-right: 1px solid #ddd;;
}
 
/*  답변 부분 */
.table_1{
  margin-top: 50px;
}

.th_1{
  background-color: rgb(229, 229, 229);
  color: rgb(50, 50, 50);
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

 </style>  

<body>

<!-- top -->	
<div>
<jsp:include page="../top.jsp" flush="false" />	
</div>

 <div align="center">
 <%  
 Gdata = request.getParameter("idx") ; 
 DBVO vo = dao.csDetail(Gdata);
 String reply = vo.getReply();
 if(reply==null){
	 reply="";
 }
 
 String loggedUserId = (String)session.getAttribute("ID");
 System.out.println(loggedUserId);
 %>	
	
 <table border="1" cellspacing="0"  width="900" cellpadding="10">
  <tr height="40">
      <th colspan="2" align="center" > 
       <%= vo.getId() %>님의 문의사항입니다.
      </th>  
  </tr> 
  
  	<tr>
  	<td > 
  	<span>제목: <%= vo.getSubject() %> </span>
  	<span>&nbsp; 작성 날짜: <%= vo.getWdate() %></span>
  	</td> 
	</tr>
  
  <tr> <td align="center" height="100" > <%= vo.getContent() %> </td> </tr>
   
  <tr>
     <td colspan="2" align="center"> 
	     <% if(loggedUserId != null && loggedUserId.equals("TEST")) { // 관리자 계정으로 로그인된 경우 %>
	     	<button><a href="/AcornSHOP/cs/csReplyInsert.jsp?idx=<%=Gdata%>">답변 작성</a></button>
	     <% } %>
  		
  			<button><a href="/AcornSHOP/cs/csList.jsp">목록</a></button>	
  		
  		<% if(loggedUserId != null && loggedUserId.equals(vo.getId())) { // 로그인된 사용자가 글쓴이인 경우 %>
		  	<button><a href="/AcornSHOP/cs/csEdit.jsp?idx=<%=Gdata%>">수정</a></button>
	  		<button><a href="../csDelete.do?idx=<%=Gdata%>">삭제</a></button>
  		<% } %>
     </td>
  </tr>
 
</table>
    <p>
    
    <table class="table_1">
    <tr>
     <th class="th_1" colspan="2" align="center" width="500"> 
     <span> 답변 </span>
     </th> 
     </tr>
     <tr>
     <td align="center" width="500" height="80" > <%=reply%> </td>
    </tr>
    </table>
 </div>
</body>
</html>









