package product.mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.common.DBDAO;
import product.common.DBVO;

@WebServlet("/qnaUpdate.do")
public class qnaUpdateController extends HttpServlet {
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
		int num=Integer.parseInt(request.getParameter("qnanum"));
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		
		DBDAO dao = new DBDAO();
		dao.productQnaEdit(title, content, num);
		response.sendRedirect("qnaAll.do?idx="+pnum);
	}
}