package cs.common;

import java.util.Date;

public class DBVO {
	
	private int qseq; //문의번호
	private String subject; //문의제목
	private String content; //문의내용
	private String reply; //답변내용
	private String id; //고객
	private String rep; //답변유무
	Date wdate=new Date();
	private int pageNumber; 
	private int rn;
	private int row;
	
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getGnumer() {
		return Gnumer;
	}
	public void setGnumer(int gnumer) {
		Gnumer = gnumer;
	}
	public int getRnumer() {
		return Rnumer;
	}
	public void setRnumer(int rnumer) {
		Rnumer = rnumer;
	}
	public int getRrn() {
		return Rrn;
	}
	public void setRrn(int rrn) {
		Rrn = rrn;
	}
	private int hit;
	int Gnumer, Rnumer , Rrn;
	
	
	public int getPageNumber() {
		return pageNumber;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public int getRow() {
		return row;
	}
	public void setRow(int row) {
		this.row = row;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public int getQseq() {
		return qseq;
	}
	public void setQseq(int qseq) {
		this.qseq = qseq;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getId() {
		return id;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRep() {
		return rep;
	}
	public void setRep(String rep) {
		this.rep = rep;
	}
	

}//class 
