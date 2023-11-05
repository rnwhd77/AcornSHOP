package admin.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.common.DBDAO;
import admin.common.DBVO;

@WebServlet("/member.do")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doUser(request, response);
	}// END

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doUser(request, response);
	}// END

	protected void doUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		System.out.println("[AdminController]");
		PrintWriter out = response.getWriter();
		
		String nextpage = null;
		String action = request.getRequestURI();
		int index = action.lastIndexOf("/member.do");
		String path = action.substring(index);
		System.out.println("path" + path); //admin.jsp action 받아오기 
		DBDAO dao = new DBDAO();
		
		
		if (action == null || path.equals("/member.do")) {
			System.out.println("회원정보");
			List list = dao.member();
			request.setAttribute("list", list);
			//System.out.println(list+" k");
			//nextpage ="../admin/admin.jsp";
			RequestDispatcher dis = request.getRequestDispatcher("./admin/memlist.jsp");
			dis.forward(request, response);
		//	response.sendRedirect("admin/memlist.jsp"); 포워드를 사용하자. 값을 못받앗다
		}

	}
}
