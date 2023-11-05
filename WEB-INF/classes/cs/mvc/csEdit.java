package cs.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.common.*;


@WebServlet("/csEdit.do")
public class csEdit extends HttpServlet {
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
	    String subject = request.getParameter("subject");
	    String content = request.getParameter("content");
	    String reply = request.getParameter("reply");
	    String rep = request.getParameter("rep");
	    	    
	    DBVO vo=new DBVO();
	    DBDAO dao=new DBDAO();
	    
	    vo.setQseq(qseq);
        vo.setSubject(subject);
        vo.setContent(content);
        vo.setReply(reply);
        vo.setId(id);
        vo.setRep(rep);
        dao.dbEdit(vo);
		 
		request.getRequestDispatcher("cs/csDetail.jsp?idx="+qseq).forward(request, response);
	    //response.sendRedirect("/AcornSHOP/cs/csList.jsp"); //저장성공 후 csList.jsp문서 전체출력
	}//end

}//csInsert class end



