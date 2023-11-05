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

@WebServlet("/qnaInsert.do")
public class qnaInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		int num=Integer.parseInt(request.getParameter("pnum"));
		String name=request.getParameter("user");
		String rls=request.getParameter("rls");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		if(rls==null) rls="y";
		
		DBDAO dao = new DBDAO();
		dao.productQnaInsert(num, name, title, content, rls);
		
		response.sendRedirect("qnaAll.do?idx="+num);
	}
}