<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="product.common.DBDAO" %>
<%@ page import="product.common.DBVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>'
<style>
*{text-decoration: none; text-align:center; margin-left:auto; margin-right:auto;}
.ac{color:black;}
.ac:hover{font-weight:bold;}
</style>
<link href="./css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div>
<jsp:include page="../top.jsp"></jsp:include>
<p>
<table border="0" cellspacing="0" width="1000">
<tr>
  <% 
	List list = (List)request.getAttribute("list");
  	DBDAO dao = new DBDAO();
	List<DBVO> ok = (List<DBVO>) dao.productSelectAll();
	for(int i=0; i<list.size(); i++){
		DBVO vo=(DBVO)list.get(i);
		String img = vo.getImage(); String name = vo.getName();
		int pnum= vo.getPnum(); int sale = vo.getSale();
		if(i%3==0){%>
			</tr><tr><td><p></td></tr><tr>
	<%	} %>
	<td><a class="ac" href="listDetail.do?idx=<%=pnum%>"><img src="product/images/<%=img%>" width=200><br><%=name %>&nbsp;<%=sale%>원</a></td> 
 <%	
  }
 %>	</tr>
</table>
<jsp:include page="../bottom.jsp"></jsp:include>
</div>
</body>
</html>