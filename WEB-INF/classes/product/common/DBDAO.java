package product.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DBDAO {
	Connection CN; 
	Statement ST; 
	PreparedStatement PST; 
	ResultSet RS;
	String msg="";
	
	public DBDAO() {
		CN=DB.getConnection();
	}
	
	public List<DBVO> productSelectAll() {
		List<DBVO> alist = new ArrayList<>();
		try {
			ST = CN.createStatement();
			msg="select prodnum, name, sale, image from product order by prodnum";
			RS = ST.executeQuery(msg);
			
			while(RS.next()==true){
			  DBVO vo = new DBVO();
			  vo.setPnum(RS.getInt("prodnum"));
			  vo.setName(RS.getString("name"));
			  vo.setSale(RS.getInt("sale"));
			  vo.setImage(RS.getString("image"));
			  alist.add(vo);
			}
		} catch(Exception ex) {} 
		return alist;
	}
	
	public DBVO productSelect(int num) {
		DBVO vo = new DBVO();
		try {
			msg="select * from product where prodnum = ?";
			PST=CN.prepareStatement(msg);
			PST.setInt(1, num);
			RS=PST.executeQuery();
			  
			if(RS.next()==true){
			  vo.setPnum(RS.getInt("prodnum"));
			  vo.setName(RS.getString("name"));
			  vo.setPrice(RS.getInt("price"));
			  vo.setSale(RS.getInt("sale"));
			  vo.setPcontent(RS.getString("content"));
			  vo.setImage(RS.getString("image"));
			  vo.setPdate(RS.getDate("regdate"));
			}
		} catch(Exception ex) {} 
		return vo;
	}
	
	public List<DBVO> productReviewSelectMy(int num, String name) {
		List<DBVO> list=new ArrayList<>();
		try{
			msg="select rownum, pr.* from p_review pr where prodnum = ? and id = ? order by rownum desc";
			PST=CN.prepareStatement(msg);
			PST.setInt(1, num);
			PST.setString(2, name);
			RS=PST.executeQuery();
			
			while(RS.next()==true){
				DBVO vo = new DBVO();
				vo.setRnum(RS.getInt("rownum"));
				vo.setPrnum(RS.getInt("revnum"));
				vo.setId(RS.getString("id"));
				vo.setRcontent(RS.getString("content"));
				vo.setStar(RS.getInt("star"));
				vo.setRdate(RS.getDate("revdate"));
				list.add(vo);
			}
		}catch(Exception ex){ System.out.println("product.common/DBDAO.java ~ : "+ex.toString()); }
		return list;
	}
	
	public List<DBVO> productReviewSelectAll(int num, String order) {
		List<DBVO> list=new ArrayList<>();
		try{
			msg="select * from (select rownum, pr.* from p_review pr where prodnum = "+num+" order by revnum asc ) order by rownum "+order;
			ST=CN.createStatement( );
			RS=ST.executeQuery(msg);
			
			while(RS.next()==true){
				DBVO vo = new DBVO();
				vo.setRnum(RS.getInt("rownum"));
				vo.setPrnum(RS.getInt("revnum"));
				vo.setId(RS.getString("id"));
				vo.setRcontent(RS.getString("content"));
				vo.setStar(RS.getInt("star"));
				vo.setRdate(RS.getDate("revdate"));
				list.add(vo);
			}
		}catch(Exception ex){ System.out.println("product.common/DBDAO.java ~ : "+ex.toString()); }
		return list;
	}
	
	public List<DBVO> productReviewSelect(int num) {
		List<DBVO> list=new ArrayList<>();
		try{
			msg="select * from (select rownum, pr.* from p_review pr where prodnum = ? order by revnum desc) where rownum<=4";
			PST=CN.prepareStatement(msg);
			PST.setInt(1, num);
			RS=PST.executeQuery();
			
			while(RS.next()==true){
				DBVO vo = new DBVO();
				
				vo.setPrnum(RS.getInt("revnum"));
				vo.setId(RS.getString("id"));
				vo.setRcontent(RS.getString("content"));
				vo.setStar(RS.getInt("star"));
				vo.setRdate(RS.getDate("revdate"));
				list.add(vo);
			}
		}catch(Exception ex){ System.out.println("product.common/DBDAO.java ~ : "+ex.toString()); }
		return list;
	}
	
	public int productReviewInsert(DBVO vo) {
		int a=0;
		try {
			msg="insert into p_review values(?, ?, ?, sysdate)";
			PST = CN.prepareStatement(msg);
			PST.setInt(1, vo.getPnum());
			PST.setString(2, vo.getName());
			PST.setString(3, vo.getRcontent());
			PST.setInt(4, vo.getStar());
   			a=PST.executeUpdate();
		} catch(Exception ex) {}
		return a; 
	}
	
	public int productReviewInsert(int pnum, String name, String content, int star) {
		int a=0;
		try {
			msg="insert into p_review values(preview_seq.nextval,?, ?, ?, ?, sysdate)";
			PST = CN.prepareStatement(msg);
			PST.setInt(1, pnum);
			PST.setString(2, name);
			PST.setString(3, content);
			PST.setInt(4, star);
   			a=PST.executeUpdate();
		} catch(Exception ex) {}
		return a; 
	}
	
	public int productReviewEdit(String content, int star, int num) {
		int a=0;
		try {
			msg="update p_review set content = ?, star = ? where revnum = ?";
			PST = CN.prepareStatement(msg);
			PST.setString(1, content);
			PST.setInt(2, star);
			PST.setInt(3, num);
   			a=PST.executeUpdate();
		} catch(Exception ex) {}
		return a; 
	}
	
	public void productReviewDelete(int num) {
		try {
			msg="delete from p_review where revnum ="+ num;
			  ST=CN.createStatement( );
			  RS=ST.executeQuery(msg);
			  RS.next();
		} catch(Exception ex) {} 
	}
	
	public int productReviewcnt(int num) {
		int Rcnt=0;
		try {
			msg="select count(*) cnt from p_review where prodnum = "+num;
			ST=CN.createStatement( );
			  RS=ST.executeQuery(msg);
			  RS.next(); Rcnt=RS.getInt("cnt");
		} catch(Exception ex) {}
		return Rcnt;
	}
	
	public int productRevUsercnt(int num) {
		int Rcnt=0;
		try {
			msg="select count(*) cnt from (select count(*) from p_review where prodnum = "+num+" group by id)";
			ST=CN.createStatement( );
			  RS=ST.executeQuery(msg);
			  RS.next(); Rcnt=RS.getInt("cnt");
		} catch(Exception ex) {}
		return Rcnt;
	}
	
	public List<DBVO> productQnaSelectAll(int num, String name) {
		List<DBVO> list=new ArrayList<>();
		try{
			msg="select * from (select rownum rn, pq.* from p_qna pq where prodnum = ? and id like ? order by qnanum) order by rn desc";
			PST=CN.prepareStatement(msg);
			PST.setInt(1, num);
			PST.setString(2, name);
			RS=PST.executeQuery();
			
			while(RS.next()==true){
				DBVO vo = new DBVO();
				vo.setRnum(RS.getInt("rn"));
				vo.setPqnum(RS.getInt("qnanum"));
				vo.setId(RS.getString("id"));
				vo.setTitle(RS.getString("title"));
				vo.setQcontent(RS.getString("content"));
				vo.setQdate(RS.getDate("revdate"));
				vo.setRls(RS.getString("rls_yn"));
				vo.setAns(RS.getString("ans_yn"));
				list.add(vo);
			}
		}catch(Exception ex){ System.out.println("product.common/DBDAO.java ~ : "+ex.toString()); }
		return list;
	}
	
	public List<DBVO> productQnaSelect(int num) {
		List<DBVO> list=new ArrayList<>();
		try{
			msg="select * from (select pq.*, rownum from p_qna pq where prodnum = ? order by qnanum desc) where rownum<=4";
			PST=CN.prepareStatement(msg);
			PST.setInt(1, num);
			RS=PST.executeQuery();
			
			while(RS.next()==true){
				DBVO vo = new DBVO();
				vo.setPqnum(RS.getInt("qnanum"));
				vo.setId(RS.getString("id"));
				vo.setTitle(RS.getString("title"));
				vo.setQcontent(RS.getString("content"));
				vo.setQdate(RS.getDate("revdate"));
				list.add(vo);
			}
		}catch(Exception ex){ System.out.println("product.common/DBDAO.java ~ : "+ex.toString()); }
		return list;
	}
	
	public DBVO productQnaSelectOne(int num, int pnum) {
		DBVO vo = new DBVO();
		try {
			msg="select * from p_qna where prodnum = ? and qnanum = ?";
			PST=CN.prepareStatement(msg);
			PST.setInt(1, pnum);
			PST.setInt(2, num);
			RS=PST.executeQuery();
			  
			if(RS.next()==true){
			  vo.setPqnum(RS.getInt("qnanum"));
			  vo.setId(RS.getString("id"));
			  vo.setTitle(RS.getString("title"));
			  vo.setQcontent(RS.getString("content"));
			  vo.setQdate(RS.getDate("revdate"));
			  vo.setRls(RS.getString("rls_yn"));
			  vo.setAnsyn(RS.getString("ans_yn"));
			}
		} catch(Exception ex) {} 
		return vo;
	}
	
	public int productQnaInsert(int pnum, String name, String title, String content, String rls) {
		int a=0;
		try {
			msg="insert into p_qna values(pqna_seq.nextval, ?, ?, ?, ?, sysdate, ?, 'n')";
			PST = CN.prepareStatement(msg);
			PST.setInt(1, pnum);
			PST.setString(2, name);
			PST.setString(3, title);
			PST.setString(4,content);
			PST.setString(5, rls);
   			a=PST.executeUpdate();
		} catch(Exception ex) {}
		return a; 
	}
	
	public int productQnaEdit(String title, String content, int num) {
		int a=0;
		try {
			msg="update p_qna set title = ?, content = ? where qnanum = ?";
			PST = CN.prepareStatement(msg);
			PST.setString(1, title);
			PST.setString(2, content);
			PST.setInt(3, num);
   			a=PST.executeUpdate();
		} catch(Exception ex) {}
		return a; 
	}
	
	public void productQnaDelete(int num) {
		try {
			msg="delete from p_qna where qnanum ="+ num;
			  ST=CN.createStatement( );
			  RS=ST.executeQuery(msg);
			  RS.next();
		} catch(Exception ex) {} 
	}
	
	public int productQnacnt(int num) {
		int Qcnt=0;
		try {
			msg="select count(*) cnt from p_qna where prodnum = "+num;
			ST=CN.createStatement( );
			  RS=ST.executeQuery(msg);
			  RS.next(); Qcnt=RS.getInt("cnt");
		} catch(Exception ex) {}
		return Qcnt;
	}
	
	public int productQnaAnsCK(int num) {
		int a=0;
		try {
			msg="update p_qna set ans_yn = 'y' where qnanum = ?";
			PST = CN.prepareStatement(msg);
			PST.setInt(1, num);
   			a=PST.executeUpdate();
		} catch(Exception ex) {}
		return a; 
	}
	
	public int productQnaAnsNO(int num) {
		int a=0;
		try {
			msg="update p_qna set ans_yn = 'n' where qnanum = ?";
			PST = CN.prepareStatement(msg);
			PST.setInt(1, num);
   			a=PST.executeUpdate();
		} catch(Exception ex) {}
		return a; 
	}
	
	public List<DBVO> productAnswerSelect(int num) {
		List<DBVO> list=new ArrayList<>();
		try{
			msg="select rownum rn, p.* from (select * from p_ans order by ansnum) p where qnanum="+num+" order by rownum desc";
			ST=CN.createStatement( );
			RS=ST.executeQuery(msg);
			
			while(RS.next()==true){
				DBVO vo = new DBVO();
				vo.setRnum(RS.getInt("rn"));
				vo.setAnum(RS.getInt("ansnum"));
				vo.setPqnum(RS.getInt("qnanum"));
				vo.setQcontent(RS.getString("content"));
				vo.setQdate(RS.getDate("revdate"));
				list.add(vo);
			}
		}catch(Exception ex){ System.out.println("product.common/DBDAO.java ~ : "+ex.toString()); }
		return list;
	}
	
	public int productAnswerInsert(int num, String content) {
		int a=0;
		try {
			msg="insert into p_ans values(pans_seq.nextval, ?, ?, sysdate)";
			PST = CN.prepareStatement(msg);
			PST.setInt(1, num);
			PST.setString(2,content);
   			a=PST.executeUpdate();
		} catch(Exception ex) {}
		return a; 
	}
	
	public void productAnswerDelete(int num) {
		try {
			msg="delete from p_ans where qnanum ="+ num;
			  ST=CN.createStatement( );
			  RS=ST.executeQuery(msg);
			  RS.next();
		} catch(Exception ex) {} 
	}
	
	public int productAnscnt(int num) {
		int Acnt=0;
		try {
			msg="select count(*) from p_ans where qnanum="+num;
			ST=CN.createStatement( );
			  RS=ST.executeQuery(msg);
			  RS.next(); Acnt=RS.getInt("cnt");
		} catch(Exception ex) {}
		return Acnt;
	}
	
	public double productReviewStarAvg(int num) {
		double sAvg=0;
		try {
			msg="select round(sum(star)/count(*),2) avg from p_review where prodnum = "+num;
			ST=CN.createStatement( );
			  RS=ST.executeQuery(msg);
			  RS.next(); sAvg=RS.getDouble("avg");
		} catch(Exception ex) {}
		return sAvg;
	}
	
	public List<DBVO> starcnt (int pnum) {
		List<DBVO> list = new ArrayList<>();
		try {
			msg="select distinct star, count(*) over(partition by star order by star) cnt, (select count(*) from p_review where prodnum=?) rcnt from p_review where prodnum=?";
			PST=CN.prepareStatement(msg);
			PST.setInt(1, pnum);
			PST.setInt(2, pnum);
			RS=PST.executeQuery();
			  
			while(RS.next()==true){
				DBVO vo = new DBVO();
				vo.setStarcnt(RS.getInt("cnt"));
				vo.setStar(RS.getInt("star"));
				vo.setRcnt(RS.getInt("rcnt"));
				list.add(vo);
			}
		} catch(Exception ex) {}
		return list;
	}
	
	public int cartCnt(int num, String id) {
		int Ccnt=0;
		try {
			msg="select count(*) as cnt from cart where prodnum = "+num+" and id = '"+id+"'";
			ST=CN.createStatement( );
			  RS=ST.executeQuery(msg);
			  RS.next(); Ccnt=RS.getInt("cnt");
		} catch(Exception ex) {}
		return Ccnt;
	}
	
	public int cartInsert(int pnum, String id, int cquan, int price) {
		int a=0;
		try {
			msg="insert into cart values(cart_seq.nextval, ?, ?, ?, ?)";
			PST = CN.prepareStatement(msg);
			PST.setString(1, id);
			PST.setInt(2, pnum);
			PST.setInt(3, cquan);
			PST.setInt(4, price);
   			a=PST.executeUpdate();
		} catch(Exception ex) {}
		return a; 
	}
	
	public int cartUpdate(int pnum, String id, int cquan, int totsale) {
		int a=0;
		try {
			msg="update cart set quantity = quantity + ?, price = price + ? where prodnum=? and id=?";
			PST = CN.prepareStatement(msg);
			PST.setInt(1, cquan);
			PST.setInt(2, totsale);
			PST.setInt(3, pnum);
			PST.setString(4, id);
   			a=PST.executeUpdate();
		} catch(Exception ex) {}
		return a; 
	}
}
