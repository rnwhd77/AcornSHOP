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

@WebServlet("/qnaAll.do")
public class qnaSelectAllController extends HttpServlet {
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
		String name=request.getParameter("id");
		if(name==null || name.equals("")) {name="%%";}
		
		DBDAO dao = new DBDAO();
		
		 int qcnt=dao.productQnacnt(num);
		 List ok = (List) dao.productQnaSelectAll(num, name);
		 
		 
		request.setAttribute("qcnt", qcnt);
		request.setAttribute("idx", num);
		request.setAttribute("pnum", num);
		request.setAttribute("list", ok);
		
		RequestDispatcher dis = request.getRequestDispatcher("./product/listQnaAll.jsp?idx="+num);
		dis.forward(request, response);
	}
}