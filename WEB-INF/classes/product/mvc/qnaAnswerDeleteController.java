package product.mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.common.DBDAO;
import product.common.DBVO;

@WebServlet("/answerDelete.do")
public class qnaAnswerDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		int anum=Integer.parseInt(request.getParameter("idx"));
		int qnum=Integer.parseInt(request.getParameter("qnum"));
		
		DBDAO dao = new DBDAO();
		dao.productAnswerDelete(anum);
		if(dao.productAnscnt(anum)==0) {dao.productQnaAnsNO(qnum);}
		//response.sendRedirect("answerAll.do?idx="+qnum+"&pnum="+pnum);
	}
}