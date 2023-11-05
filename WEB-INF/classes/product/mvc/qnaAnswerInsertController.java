package product.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.common.DBDAO;
import product.common.DBVO;

@WebServlet("/answerInsert.do")
public class qnaAnswerInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		int pnum=Integer.parseInt(request.getParameter("pnum"));
		int qnum=Integer.parseInt(request.getParameter("qnum"));
		String content=request.getParameter("content");
		System.out.println(" "+qnum+" "+content+" ");
		DBDAO dao = new DBDAO();
		dao.productAnswerInsert(qnum, content);
		
		int a= dao.productAnscnt(qnum);
		if(a==0) { dao.productQnaAnsCK(qnum); }
		
		response.sendRedirect("qnaDetail.do?idx="+qnum+"&pnum="+pnum);
//		RequestDispatcher dis = request.getRequestDispatcher("answerAll.do?idx="+qnum+"&pnum="+pnum);
//		dis.forward(request, response);
	}
}