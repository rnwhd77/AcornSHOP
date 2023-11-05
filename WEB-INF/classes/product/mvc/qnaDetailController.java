package product.mvc;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.common.DBDAO;
import product.common.DBVO;

@WebServlet("/qnaDetail.do")
public class qnaDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		int num=Integer.parseInt(request.getParameter("idx"));
		int pnum=Integer.parseInt(request.getParameter("pnum"));
		DBDAO dao = new DBDAO();
		DBVO vo = dao.productQnaSelectOne(num, pnum);
		
		request.setAttribute("pnum", num);
		request.setAttribute("qnanum", pnum);
		request.setAttribute("id", vo.getId());
		request.setAttribute("title", vo.getTitle());
		request.setAttribute("content", vo.getQcontent());
		request.setAttribute("date", vo.getQdate());
		request.setAttribute("rls", vo.getRls());
		request.setAttribute("ans", vo.getAnsyn());
		
		RequestDispatcher dis = request.getRequestDispatcher("./product/listQnaDetail.jsp");
		dis.forward(request, response);
	}
}