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

@WebServlet("/pCart.do")
public class pCartController extends HttpServlet {
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
		String id=request.getParameter("id");
		int cnt=Integer.parseInt(request.getParameter("cnt"));
		int totsale=Integer.parseInt(request.getParameter("tot_sale"));
		
		DBDAO dao = new DBDAO();
		int cntCheck=dao.cartCnt(pnum, id);
		System.out.println("cntcheck "+cntCheck);
		if(cntCheck!=0) {
			dao.cartUpdate(pnum, id, cnt, totsale);
			System.out.println("update cart set "+pnum+" "+id+" "+cnt+" "+totsale);
		}
		else if(cntCheck==0) {
			dao.cartInsert(pnum, id, cnt, totsale);
			System.out.println("insert into cart "+pnum+" "+id+" "+cnt+" "+totsale);
		}
		response.sendRedirect("listDetail.do?idx="+pnum);
	}
}