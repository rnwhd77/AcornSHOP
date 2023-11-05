package login.mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.common.*;
/**
 * Servlet implementation class Finder
 */
@WebServlet("/PWDFinder.do")
public class PWDFinder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doUser(request, response);
	}// end

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doUser(request, response);
	}// end

	protected void doUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("[PWDFinder.java]");
		HttpSession session = request.getSession();
		
		String u_id = request.getParameter("F_id");
		String u_name=request.getParameter("F_name");
		String u_tel = request.getParameter("F_tel");
		System.out.println(u_id +  u_name +u_tel);
		DBDAO dao = new DBDAO();
		String u_pwd=dao.PWDFind(u_id , u_name , u_tel);
		if(u_pwd!=null) {
			System.out.println(u_pwd);
			session.setAttribute("PWD" , u_pwd);
			response.sendRedirect("login/PWDFind.jsp");
		}else {
			response.sendRedirect("login/join.jsp");
		}
		
	}
}
