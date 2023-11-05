package mypage.common;

import mypage.common.DBVO;

import java.sql.*;
import java.util.*;//List �������̽�

import java.io.*;

public class DBDAO {
	private Connection CN; 
	private Statement ST;
	private PreparedStatement PST; 
	private ResultSet RS; 
	private String sql; 
	private int total; 
	private String msg; 
	
	public DBDAO(){ 
		try{
			CN= DB.getConnection();
			System.out.println("연결성공");
		}catch(Exception ex){}
	} //end
	
	
	public void dbDelete(String data){//삭제
		try{
			sql="delete from users where id='" + data+"'";
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
				
			System.out.println("\n"+data);
			
		}catch(Exception ex){System.out.println(ex.toString());}
	} //dbDelete() end	
	
	
	public List<DBVO> Cartlist(String id) {
		List<DBVO> list=new ArrayList<>();
		
		try{
			
			msg= "select * from cart where id=?";
			PST=CN.prepareStatement(msg);
			PST.setString(1, id);
			RS=PST.executeQuery();
			System.out.println(msg);
			while(RS.next()==true){
				DBVO vo = new DBVO();
				vo.setCartnum(RS.getInt("Cartnum"));
				vo.setId(RS.getString("id"));
				vo.setProdnum(RS.getInt("Prodnum"));
				vo.setQuantity(RS.getInt("Quantity"));
				vo.setPrice(RS.getInt("Price"));
				list.add(vo);
			}
		}catch(Exception ex){ System.out.println("Cartlist/DBDAO.java ~ : "+ex.toString()); }
		return list;
	}
	
	
	public int memberEdit(DBVO bean, String id){//수정메서드
	      
	      int ok=0;
	      try{
	         sql="update users set email=?, phone=?, address=? where id='"+id+"'";
	         System.out.println(sql + bean.getEmail()+bean.getPhone());
	         PST=CN.prepareStatement(sql);
	         PST.setString(1, bean.getEmail());
	         PST.setString(2, bean.getPhone());
	         PST.setString(3, bean.getAddress());
	         System.out.println(sql);
	      
	         ok=PST.executeUpdate();
	         System.out.println("ok");
	      }catch(Exception ex){ System.out.println(ex.toString());  }
	      return ok;
	   }//edit() END
	public void dbDelete1(String id){//삭제
		try{
			
			sql="delete from p_qna where id='" + id+"'";
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			
			System.out.println("\n"+id);
			
		}catch(Exception ex){System.out.println(ex.toString());}
	} //dbDelete() end	
	
	public void dbDelete2(String id){//삭제
		try{
			sql="delete from cart where id='" + id+"'";
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			
			System.out.println("\n"+id);
			
		}catch(Exception ex){System.out.println(ex.toString());}
	} //dbDelete() end	
	
	
	public void dbDelete3(String id){//삭제
		try{
			
			sql="delete from qna where id='" + id+"'";
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			
			System.out.println("\n"+id);
			
		}catch(Exception ex){System.out.println(ex.toString());}
	} //dbDelete() end	
	
	public void dbDelete4(String id){//삭제
		try{
			sql="delete from p_review where id='" + id+"'";
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			
			System.out.println("\n"+id);
			
		}catch(Exception ex){System.out.println(ex.toString());}
	} //dbDelete() end	
	
	public void dbDelete5(String id, String pwd){//삭제
		try{
			sql="delete from users where id='" + id+"'and pwd='"+ pwd +"'";
			ST=CN.createStatement();
			int OK = ST.executeUpdate(sql);
			System.out.println(sql);
			if (OK>0) {
				System.out.println("success");
			}else {
				System.out.println("\n"+id+" "+pwd);
			}
		}catch(Exception ex){System.out.println(ex.toString());}
	} //dbDelete() end	
	
	
	public void CartDelete(String ID , int pnum){	
	
		try{
			sql="delete from cart where id='" + ID +"' and prodnum ='"+pnum+"'" ;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			
			System.out.println("\n"+ID +"의 " +pnum+ "상품 삭제");				
		}catch(Exception ex){System.out.println("revDelete : "+ex.toString());}
	} 
	
	
	public DBVO memberDetail(String id){ //로그인 정보
		DBVO bean = new DBVO();
		try{
			sql="select * from users where id='"+id+"'";
			
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
				
			while(RS.next()==true){		
				bean.setId(RS.getString("id"));
				bean.setPwd(RS.getString("pwd"));
				bean.setName(RS.getString("name"));
				bean.setEmail(RS.getString("email"));
				bean.setAddress(RS.getString("address"));
				bean.setPhone(RS.getString("Phone"));
				bean.setSigndate(RS.getString("signdate"));
			} //while end
		}catch(Exception ex){}
		return bean;
	} //dbDetail() end
} //class END
