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

@WebServlet("/reviewInsert.do")
public class reviewInsertController extends HttpServlet {
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
		String content=request.getParameter("content");
		int star=Integer.parseInt(request.getParameter("star"));
		
		DBDAO dao = new DBDAO();
		dao.productReviewInsert(num, name, content, star);
		System.out.println(num+" "+name+" "+content+" "+star+" sysdate 데이터가 입력되었습니다");
		response.sendRedirect("reviewAll.do?idx="+num+"&order=1");
	}
}