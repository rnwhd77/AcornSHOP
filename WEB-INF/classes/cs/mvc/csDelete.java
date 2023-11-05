package cs.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.common.*;

@WebServlet("/csDelete.do")
public class csDelete extends HttpServlet {
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

        DBDAO dao = new DBDAO();
  
        int qseq = Integer.parseInt(request.getParameter("idx"));
     
        int result = dao.dbDelete(qseq);

        request.setAttribute("result", result);
        // 삭제 완료 시 목록 페이지로 이동
        //response.sendRedirect("/cs/csDelete.jsp");
        request.getRequestDispatcher("cs/csDelete.jsp").forward(request, response);
        // java(getParameter , setAttribute )  ->  jsp (getAttribute) 
	}//end

}//csDetail class end
