package cs.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs.common.*;


@WebServlet("/csInsert.do")
public class csInsert extends HttpServlet {
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
		
		  HttpSession session = request.getSession();
	        String ID = (String) session.getAttribute("ID");
	        
	    String did = request.getParameter("id");
	    String dsubject = request.getParameter("subject");
	    String dcontent = request.getParameter("content");
	    String dreply = request.getParameter("reply");
	    String drep = request.getParameter("rep");
	    
	    if (did == null || did.isEmpty()) {
            out.println("<script>alert('로그인 후에 글 작성이 가능합니다.'); location.href='/AcornSHOP_(1)/login/login.jsp';</script>");
            return;
        }//if end

	    DBVO vo=new DBVO();
	    DBDAO dao=new DBDAO();
	    vo.setSubject(dsubject); 
	    vo.setContent(dcontent);
	    vo.setReply(dreply); 
	    vo.setId(did);
	    vo.setRep(drep);
	    dao.dbInsert(vo); 
	      
	    response.sendRedirect("cs/csList.jsp"); //저장성공 후 csList.jsp문서 전체출력
	}//end

}//csInsert class end



