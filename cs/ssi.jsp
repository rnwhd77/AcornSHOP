<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*" %>

<%@ page import="cs.common.*" %>
<%@ page import="cs.mvc.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title>   </title>
 
</head>
<body>
 <%!
   Connection CN = null;
   Statement ST = null;
   PreparedStatement PST = null;
   ResultSet RS = null ;
   String msg = "";
   int OK = 0;
   
   int Gqseq=0, Ghit=0,  Grn=0, Grow=0, Grep=0, Gtotal = 0, Gtotal2 = 0;
   String Gsubject="",  Gcontent="", Greply="", Gid="", Gdata="";
   java.util.Date Gwdate=null;
   
   //페이징및 검색
   String pnum ;             //pnum = request.getParameter("pageNum=idx역할");
   int pageNUM, pagecount;   //pageNUM=Integer.parseInt(pnum);
   					      
	
   int start, end;          
   int startpage, endpage; 
   int temp; //[이전] [숫자]~~[숫자] [다음] 
  
   String sqry="", skey="", sval="" ;  //검색 제목/아이디
   String returnpage="";               //Web0712.jsp?pageNum=7
   
   //시작행번호 Gtotal이용 역순
   int Gnumber, Rnumber ; 
   
   //댓글관련 Rdata
   String Rdata="";
   int  Rrn,  Rnum, Rcode ;
   String  Rwriter,  Rcontent ;
   int Rcnt; //댓글갯수
 %>

 <%
  try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	CN=DriverManager.getConnection(url,"system", "1234");
	//System.out.println("------ db연결 성공했습니다 23-07-13 ------ ");
	//out.println("<h2> ------ db연결 성공했습니다 23-07-13 ------ </h2> ");
	ST = CN.createStatement();
  }catch(Exception ex){System.out.println("db에러:"+ex);}
 %>

<%!
  DBDAO dao = new DBDAO();
  DBVO vo = new DBVO();
%>
</body>
</html>









