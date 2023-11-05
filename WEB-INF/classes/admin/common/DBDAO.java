package admin.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DBDAO {
	private Connection CN;
	private Statement ST;
	private PreparedStatement PST;
	private ResultSet RS;
	String msg = "";
	int result = 0;
	
	
	public DBDAO() {
		try {
			System.out.println("DBDAO");
			CN = DB.getConnection();
			ST = CN.createStatement();
		} catch (Exception ex) {
		}
	}// end

	public List member() {
		List list = new ArrayList();

		try {
			msg = "select * from users";
			RS = ST.executeQuery(msg);
			while (RS.next()) {
				DBVO vo = new DBVO();
				String id = RS.getString("ID");
				String pwd = RS.getString("PWD");
				String name = RS.getString("NAME");
				String email = RS.getString("EMAIL");
				String addr = RS.getString("ADDRESS");
				String tel = RS.getString("PHONE");
				Date date = RS.getDate("SIGNDATE");
				vo.setId(id);
				vo.setPw(pwd);
				vo.setName(name);
				vo.setEmail(email);
				vo.setAddr(addr);
				vo.setTel(tel);
				vo.setSigndate(date);
				list.add(vo);
			}
		} catch (Exception e) {
		}
		return list;
	}
	public int adminedit(DBVO vo) {
		int cnt = 0;
		try {
			System.out.println("ADMINEDIT");
			msg = "UPDATE USERS SET PWD=? , NAME=?, EMAIL=? WHERE ID = ?";
			PST = CN.prepareStatement(msg);
			PST.setString(4, vo.getId());
			PST.setString(1, vo.getPw());
			PST.setString(2, vo.getName());
			PST.setString(3, vo.getEmail());
			cnt = PST.executeUpdate();
		} catch (Exception e) {
		}
		return cnt;
	}
	
	
	
	//====================================DELETE======================//
	
	public void admindel(String id){//삭제
		try{
			
			msg="delete from p_qna where id='" + id+"'";
			msg="DELETE FROM p_qna WHERE ID = ?"; 
			PST=CN.prepareStatement(msg);
			PST.setString(1, id);
			PST.executeUpdate();
			
			System.out.println("\n"+id);
			
		}catch(Exception ex){System.out.println(ex.toString());}
	} //admindel() end	
	
	public void admindel2(String id){//삭제
		try{
			msg="DELETE FROM cart WHERE ID = ?"; 
			PST=CN.prepareStatement(msg);
			PST.setString(1, id);
			PST.executeUpdate();
			
			
			System.out.println("\n"+id);
			
		}catch(Exception ex){System.out.println(ex.toString());}
	} //admindel() end	
	
	
	public void admindel3(String id){//삭제
		try{
			
			msg="delete from qna where id='" + id+"'";
			msg="DELETE FROM qna WHERE ID = ?"; 
			PST=CN.prepareStatement(msg);
			PST.setString(1, id);
			PST.executeUpdate();
			
			System.out.println("\n"+id);
			
		}catch(Exception ex){System.out.println(ex.toString());}
	} //admindel() end	
	
	public void admindel4(String id){//삭제
		try{
			msg="DELETE FROM p_review WHERE ID = ?"; 
			PST=CN.prepareStatement(msg);
			PST.setString(1, id);
			PST.executeUpdate();
			
			
		}catch(Exception ex){System.out.println(ex.toString());}
	} //admindel() end	
	
	
public String admindel5(String id) {
		
		try {
			System.out.println("DA0.Admindel");
			System.out.println("삭제아이디"+id);
			msg="DELETE FROM USERS WHERE ID = ?"; 
			
			PST=CN.prepareStatement(msg);
			PST.setString(1, id);
			PST.executeUpdate();
			
		}catch (Exception e) {	}
	return id;
	}
	
	
	
	
//====================================DELETE======================//
	
//====================================PRODUCT======================//	

public int insertProduct(DBVO vo) {
	System.out.println("[dao.INSERTPRODUCT]");
	msg = "insert into product values(?,?,?,?,?,?,'Y',SYSDATE)";
	try {
		PST=CN.prepareStatement(msg);
		PST.setInt(1, vo.getPnum());
		PST.setString(2, vo.getPname());
		PST.setInt(3, vo.getPprice());
		PST.setInt(4, vo.getPsale());
		PST.setString(5, vo.getPcon());
		PST.setString(6, vo.getPimg());
		result = PST.executeUpdate();
		System.out.println("저장성공");
	} catch (SQLException e) {	}
	return result;
}





//====================================PRODUCT======================//
	public List findMember(String ID) {
		List list = new ArrayList();
		try {
			CN = DB.getConnection();
			String msg = "select * from users where id=?"; // 전달된 ID로 회원 정보를 조회
			PST.setString(1, ID);
			System.out.println(msg);
			RS = PST.executeQuery();
			if
			(RS.next()==true);
			DBVO vo = new DBVO();
			String id = RS.getString("ID");
			String pwd = RS.getString("PWD");
			String name = RS.getString("NAME");
			String email = RS.getString("EMAIL");
			String addr = RS.getString("ADDRESS");
			String tel = RS.getString("PHONE");
			Date date = RS.getDate("SIGNDATE");
			vo.setId(id);
			vo.setPw(pwd);
			vo.setName(name);
			vo.setEmail(email);
			vo.setAddr(addr);
			vo.setTel(tel);
			vo.setSigndate(date);
			list.add(vo);
			PST.close();
			CN.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	

	public void DBclose() {
		try {
			if (RS != null) {
				RS.close();
			}
			if (PST != null) {
				PST.close();
			}
			if (CN != null) {
				CN.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}// class
