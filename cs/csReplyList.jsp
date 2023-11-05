<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title> csReplyList.jsp  </title>
  <style type="text/css">
    *{font-size: 14pt;}
    a{font-size: 14pt; text-decoration:none; color:black; }
    a:hover{font-size: 13pt; color:black;}
    #span_rcnt{font-size: 10pt; color:red;}
  </style>
  
 <script type="text/javascript">

 </script> 
  
</head>
<body>
<div align="center">
 
<%

DBDAO dao = new DBDAO();
DBVO vo = new DBVO();

int qseq = Integer.parseInt(request.getParameter("qseq"));
dao.dbReplySelect(qseq);
System.out.println(qseq);

msg = "select rownum rn, q.* from qna q where qseq= " + qseq ;
RS = ST.executeQuery(msg);

//int Grn = 0; // Grn 변수 초기화
while(RS.next()==true){
   Grn = RS.getInt("rn"); 
//   Gid = RS.getString("id");
   Greply = RS.getString("reply");
   Gwdate = RS.getDate("indate");

   
%>   
<table border="0" cellspacing="0"  width="800">
	
   <tr>
      <td> <%= Grn %> </td> 
      <td> <%= Greply %> </td> 
      <td> <%= Gwdate %> </td> 
   </tr> 
   
<%
}//for end
 %>
 
</table>  

</div>
 <br><p style="margin-bottom:350px;">  
</body>
</html>








