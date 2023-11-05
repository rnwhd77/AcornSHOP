package mypage.mvc;

import mypage.common.DBDAO;
import mypage.common.DBVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/CartUpdate.do")

public class CartUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CartUpdate() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("CartController, mothod=GET");
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("CartController, mothod=POST");
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out=response.getWriter();
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("ID"); 
		int pnum= (int) session.getAttribute("pnum");
		
		DBDAO dao = new DBDAO();
		dao.CartDelete(id,pnum);
		System.out.println("실행");
		
		response.sendRedirect("mypage/cart.jsp");
	}//user END
}//class END
