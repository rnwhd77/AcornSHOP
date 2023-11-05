package cs.common;

import cs.common.DBVO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DBDAO extends Global{
	Connection CN; 
	Statement ST; 
	PreparedStatement PST; 
	ResultSet RS;
	String msg="";
	 
	public DBDAO(){
	 try {
		CN=DB.getConnection();
		ST=CN.createStatement();
	 }catch(Exception ex) { }
	}//end

	public void dbInsert(DBVO vo){
		try{
			msg="insert into qna values( qna_seq.nextval, ?, ?, ?, ?, ?, sysdate)";
			PST = CN.prepareStatement(msg);
				PST.setString(1, vo.getSubject());
				PST.setString(2, vo.getContent());
				PST.setString(3, vo.getReply());
				PST.setString(4, vo.getId());
				PST.setString(5, vo.getRep());
			OK=PST.executeUpdate();
			if(OK>0){System.out.print("Insert ok");}
		}catch(Exception ex){ex.getStackTrace();}
	} //dbInsert end 
	
	public void dbEdit(DBVO vo){
		try{
			msg="update qna set subject = ?, content = ? where qseq = ? and id = ?";
			PST = CN.prepareStatement(msg);
				//PST.setInt(1, vo.getQseq());
				PST.setString(1, vo.getSubject());
				PST.setString(2, vo.getContent());
				PST.setInt(3, vo.getQseq());
				PST.setString(4, vo.getId());
			OK=PST.executeUpdate();
			if(OK>0){System.out.print("Update ok");}
		}catch(Exception ex){
			ex.getStackTrace();
			}
	} //dbEdit end 
	
	public void dbReplyInsert(DBVO vo) {
		try {
			msg="update qna set reply = ?, rep = ? where qseq = ? and id = ?";
			PST = CN.prepareStatement(msg);
				PST.setString(1, vo.getReply());
				PST.setString(2, vo.getRep());
				PST.setInt(3, vo.getQseq());
				PST.setString(4, vo.getId());
			OK=PST.executeUpdate();
		if(OK>0){System.out.print("Update ok");}
		}catch(Exception ex){}
	}//dbReplyInsert end

	public int dbDelete(int qseq){
		try{
			msg="delete from qna where qseq="+qseq;
			ST=CN.createStatement();
			ST.executeUpdate(msg);	
			System.out.println("\n"+qseq);
			
		}catch(Exception ex){System.out.println(ex.toString());}
		return qseq;		
	} //dbDelete end	
	
	
	 public List<DBVO> SelectAll(){
		  List<DBVO> alist=new ArrayList<DBVO>();
		  try {
		  msg="select rownum rn, q.* from qna q";
		  RS = ST.executeQuery(msg);
		  while(RS.next()==true){
			  DBVO vo=new DBVO();
				  vo.setQseq(RS.getInt("qseq")); 
				  vo.setSubject(RS.getString("subject"));  
				  vo.setContent(RS.getString("content"));  
				  vo.setReply(RS.getString("reply"));  				  
				  vo.setId(RS.getString("id"));
				  vo.setRep(RS.getString("rep"));
				  vo.setWdate(RS.getDate("indate")); 
			  alist.add(vo); 
		  }//while end
		  }catch(Exception ex) { }
		  return alist;
	  }//end
	 
	 public List<DBVO> SelectAll(int start, int end){ //시작행, 끝행
		  List<DBVO> alist=new ArrayList<DBVO>();
		  try {
		  String msg = "select * from ( "
	                + "select rownum rn, q.* from qna q) "
	                + "where rn between ? and ?";
		  PST = CN.prepareStatement(msg);
	        PST.setInt(1, start);
	        PST.setInt(2, end);
          RS = PST.executeQuery();
		  while(RS.next()==true){
		  DBVO vo=new DBVO();
			  vo.setQseq(RS.getInt("qseq")); 
			  vo.setSubject(RS.getString("subject"));  
			  vo.setContent(RS.getString("content"));  
			  vo.setReply(RS.getString("reply"));  				  
			  vo.setId(RS.getString("id"));
			  vo.setRep(RS.getString("rep"));
			  vo.setWdate(RS.getDate("indate")); 
		  alist.add(vo); 
		  }//while end
		  }catch(Exception ex) { }
		  return alist;
	  }//end

	  public List<DBVO> SelectAll(int start, int end, String sqry){ //시작행, 끝행, 검색쿼리
		  List<DBVO> alist=new ArrayList<DBVO>();
		  try {
		  String msg = "select * from (select rownum rn, q.* from qna q " + sqry + ") where rn between ? and ?";
	        PST = CN.prepareStatement(msg);
	        PST.setInt(1, start);
	        PST.setInt(2, end);
	        RS = PST.executeQuery();
	        
		  while(RS.next()==true){
		  DBVO vo=new DBVO();
			  vo.setQseq(RS.getInt("qseq")); 
			  vo.setSubject(RS.getString("subject"));  
			  vo.setContent(RS.getString("content"));  
			  vo.setReply(RS.getString("reply"));  				  
			  vo.setId(RS.getString("id"));
			  vo.setRep(RS.getString("rep"));
			  vo.setWdate(RS.getDate("indate")); 
		  alist.add(vo);
		  }//while end
		  }catch(Exception ex) { }
		  return alist;
	  }//end
	  
	  public List<DBVO> dbReplySelect(int qseq) {
			List<DBVO> list=new ArrayList<>();
			try{
				msg="select rownum, q.* from qna q where qseq = ? order by rownum desc";
				PST=CN.prepareStatement(msg);
				PST.setInt(1, qseq);
				RS=PST.executeQuery();
				
				while(RS.next()==true){
					DBVO vo = new DBVO();				
						vo.setQseq(RS.getInt("qseq"));
						vo.setId(RS.getString("id"));
						vo.setContent(RS.getString("content"));
						vo.setReply(RS.getString("reply"));
						vo.setRep(RS.getString("rep"));
					list.add(vo);
				}
			}catch(Exception ex){ }
			return list;
		}
	  
	  public int CountAll(String sqry) {
			try {
			 msg="select count(*) as cnt from qna "+sqry;  
			 RS=ST.executeQuery(msg);
			 if(RS.next()==true){ Gtotal=RS.getInt("cnt"); }  
			}catch(Exception ex) { }	
			return Gtotal;
		  }//end

	  public DBVO csDetail(String data){
		  DBVO vo=new DBVO();
		  try {
		  msg="select * from qna where qseq = ? ";
		  PST=CN.prepareStatement(msg);
		  	PST.setInt(1, Integer.parseInt(data));
		  RS = PST.executeQuery();
		  if(RS.next()==true){
			  vo.setId(RS.getString("id"));
			  vo.setQseq(RS.getInt("qseq")); 
			  vo.setSubject(RS.getString("subject"));  
			  vo.setContent(RS.getString("content"));  
			  vo.setReply(RS.getString("reply"));  				  
			  vo.setRep(RS.getString("rep"));
			  vo.setWdate(RS.getDate("indate")); 
		  }//if end
		  }catch(Exception ex) { }
		  return vo;
	  }//end

	


	
	
}//class

