package cs.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.common.*;


@WebServlet("/csReplyInsert.do")
public class csReplyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}//end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}//end
	
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		int qseq = Integer.parseInt(request.getParameter("qseq"));
	    String id = request.getParameter("id");
	    //String dsubject = request.getParameter("subject");
	    //String dcontent = request.getParameter("content");
	    String reply = request.getParameter("reply");
	    String rep = request.getParameter("rep");
	    
	    System.out.println("문의번호 " + qseq);
	    System.out.println("아이디 " + id);
	    //System.out.println("제목 " + dsubject);
	    //System.out.println("내용 " + dcontent);
	    System.out.println("답변 " + reply);
	    System.out.println("답변유무 " + rep);
	    	    
	    DBVO vo=new DBVO();
	    DBDAO dao=new DBDAO();
	    vo.setQseq(qseq); 
	    vo.setReply(reply); 
	    vo.setId(id);
	    vo.setRep(rep);
	    dao.dbReplyInsert(vo);
        
        System.out.println(qseq);
        System.out.println(rep);
        System.out.println(id); 
 
	    response.sendRedirect("cs/csDetail.jsp?idx="+qseq); 
	}//end

}//csReplyInsert class end



