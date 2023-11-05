package login.common;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;



public class DBDAO {
	private Connection CN;
	private Statement ST;
	private PreparedStatement PST;
	private ResultSet RS;
	int result = 0;
	public String msg = "";
	
	public DBDAO() {
		try {
			CN=DB.getConnection();
			ST=CN.createStatement();
		 }catch(Exception ex) { }
	   }//DBDAO

	public int join(DBVO vo) {
		
		try {
			msg = "INSERT INTO USERS VALUES(?,?,?,?,?,?,SYSDATE)";
			PST = CN.prepareStatement(msg);
			PST.setString(1, vo.getId());
			PST.setString(2, vo.getPw());
			PST.setString(3, vo.getName());
			PST.setString(4, vo.getEmail());
			PST.setString(5, vo.getAddr());
			PST.setString(6, vo.getTel());
			result = PST.executeUpdate();
			System.out.println("저장성공");
			if(RS.next()==true) {
				result=1;
			}else {
				System.out.println("값이없음");
			}
		} catch (Exception e) {
		} 
		return result;
	}

	public boolean IdCheck(String id) {
	    boolean result = false;
	    try {
	        msg = "SELECT ID FROM USERS WHERE ID = ?";
	        PST = CN.prepareStatement(msg);
	        PST.setString(1, id);
	        RS = PST.executeQuery();
	        if (RS.next()) result =	true;
	    } catch (Exception e) {
	    } finally {
	           DBclose();
	    } 
	    return result; 
	}

	public int login(String ID, String PW) {
		int count = 0;
		try {
			msg = "select * from USERS where ID=?";
			PST = CN.prepareStatement(msg);
			PST.setString(1, ID);
			RS = PST.executeQuery();
			System.out.println(ID + PW);
			if (RS.next() == true) {
				if (RS.getString("ID").equals(ID) && RS.getString("PWD").equals(PW)) {
					count = 0;
				} else {// 비번 틀림
					count = 1;
				}
			} else {
				count = 2;
			}
			System.out.println(count);
			CN.close();
			System.out.println("연결해제");
		} catch (Exception ex) {
			ex.toString();
		}
		return count;
	}// login end
	
	public String IDFind(String name , String tel) {
		String tmp= null;
		System.out.println("IDFind");
		try {
			msg="SELECT ID FROM USERS WHERE NAME ='" + name + "'AND PHONE='"+ tel + "'";
		      PST = CN.prepareStatement(msg);
		      System.out.println(msg);
		      RS = PST.executeQuery();
		      if(RS.next()==true) {
		    	 tmp = RS.getString("ID");
		    	 //System.out.println(tmp); 찾기성공
		      }
		} catch (Exception e) {System.out.println(e);	}
		return tmp;
	}
	
	public String PWDFind(String id , String name ,String tel) {
		String tmp= null;
		System.out.println("IDFind");
		try {
			msg="SELECT PWD FROM USERS WHERE ID='"+ id + "' AND NAME ='" + name+ "'AND PHONE='" + tel + "'" ;
		      PST = CN.prepareStatement(msg);
		      System.out.println(msg);
		      RS = PST.executeQuery();
		      if(RS.next()==true) {
		    	 tmp = RS.getString("PWD");
		    	 System.out.println(tmp);
		      }
		} catch (Exception e) {System.out.println(e);	}
		return tmp;
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
}//DBDAO END
