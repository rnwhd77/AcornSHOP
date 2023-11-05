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

@WebServlet("/listDetail.do")
public class listDetailController extends HttpServlet {
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
		
		DBDAO dao = new DBDAO();
		double staravg = dao.productReviewStarAvg(num);
		DBVO vo=dao.productSelect(num);
		int Rcnt = dao.productReviewcnt(num);
		int Qcnt = dao.productQnacnt(num);
		int RUcnt = dao.productRevUsercnt(num);
		List starlist = dao.starcnt(num);
		
		request.setAttribute("staravg", staravg);
		request.setAttribute("rcnt", Rcnt);
		request.setAttribute("qcnt", Qcnt);
		request.setAttribute("RUcnt", RUcnt);
		request.setAttribute("starlist", starlist);
		
		request.setAttribute("pnum", vo.getPnum());
		request.setAttribute("img", vo.getImage());
		request.setAttribute("name", vo.getName());
		request.setAttribute("price", vo.getPrice());
		request.setAttribute("sale", vo.getSale());
		request.setAttribute("content", vo.getPcontent());
		request.setAttribute("date", vo.getPdate());
		
		RequestDispatcher dis = request.getRequestDispatcher("./product/listDetail.jsp");
		dis.forward(request, response);
	}
}