<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="admin.common.DBDAO" %>
<%@ page import="admin.common.DBVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>멤버리스트</h2>
<table border="0" cellspacing="0" width="1000">


<tr>
<td>ID</td>
<td>PWD</td>
<td>NAME</td>
<td>EMAIL</td>
<td>ADDRESS</td>
<td>PHONE</td>
<td>SIGNDATE</td>
<td style=text-align=center colspan="2">관리모드</td>
<td></td>
</tr>
  <% 

	List list = (List)request.getAttribute("list");
	
	for(int i=0; i<list.size(); i++){
		DBVO vo=(DBVO)list.get(i);
 %>
<tr>
 <td><%=vo.getId() %> </td>
 <td><%=vo.getPw() %> </td>
 <td><%=vo.getName() %> </td>
 <td><%=vo.getEmail() %></td>
 <td><%=vo.getAddr() %> </td>
 <td><%=vo.getTel() %></td>
<td><%=vo.getSigndate() %></td> 
<td><input type="button" onclick="location.href='./admin/admin_edit.jsp?id=<%=vo.getId() %>&signdate=<%=vo.getSigndate() %>'" value="수정"></td>
<td><input type="button"onclick="location.href='./memberDel.do?id=<%=vo.getId() %>'" value="삭제"></td>
 </tr>
 <%} %>
</table>
</body>
</html>

