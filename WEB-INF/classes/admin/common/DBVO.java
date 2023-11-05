package admin.common;

import java.util.Date;

public class DBVO {
	private String Id;
	private String Pw;
	private String Name;
	private String Email;
	private String Addr;
	private String Tel;
	public String getTel() {
		return Tel;
	}
	// 고객정보 //
	
	//상품등록//
	private  int pnum;
	private String pname;
	private int pprice;
	private int psale;
	private String pcon;
	private String pimg;
	//상품등록//
	
	
	//상품등록//
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public int getPsale() {
		return psale;
	}
	public void setPsale(int psale) {
		this.psale = psale;
	}
	public String getPcon() {
		return pcon;
	}
	public void setPcon(String pcon) {
		this.pcon = pcon;
	}
	public String getPimg() {
		return pimg;
	}
	public void setPimg(String pimg) {
		this.pimg = pimg;
	}
	//상품등록//
	
	
	public void setTel(String tel) {
		Tel = tel;
	}
	private Date signdate;
	
	
	public Date getSigndate() {
		return signdate;
	}
	public void setSigndate(Date signdate) {
		this.signdate = signdate;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getPw() {
		return Pw;
	}
	public void setPw(String pw) {
		Pw = pw;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getAddr() {
		return Addr;
	}
	public void setAddr(String addr) {
		Addr = addr;
	}
	
	

}//class 
