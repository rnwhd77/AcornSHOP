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

@WebServlet("/reviewAll.do")
public class reviewSelectAllController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		int pnum=Integer.parseInt(request.getParameter("idx"));
		int ordern = Integer.parseInt(request.getParameter("order"));
		String name = request.getParameter("user");
		if(name==null) {name="";}
		
		String order="";
		if(ordern==1) {order=" desc";}
		else if(ordern==2) {order=" asc";}

		DBDAO dao = new DBDAO();
		if(name.equals("")) {
			List ok = (List) dao.productReviewSelectAll(pnum, order);
			request.setAttribute("list", ok);
		} else if(!name.equals("")) {
			List ok = (List) dao.productReviewSelectMy(pnum, name);
			request.setAttribute("list", ok);
		}
		
		request.setAttribute("pnum", pnum);
		RequestDispatcher dis = request.getRequestDispatcher("./product/listReviewAll.jsp");
		dis.forward(request, response);
	}
}