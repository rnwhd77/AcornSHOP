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

@WebServlet("/reviewUpdate.do")
public class reviewUpdateController extends HttpServlet {
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
		int num=Integer.parseInt(request.getParameter("revnum"));
		String content = request.getParameter("content");
		int star=Integer.parseInt(request.getParameter("star"));
		//System.out.println(pnum + " " + num + " "+content+" "+star);
		DBDAO dao = new DBDAO();
		dao.productReviewEdit(content, star,num);
		
		response.sendRedirect("reviewAll.do?idx="+pnum+"&order=1");
	}
}