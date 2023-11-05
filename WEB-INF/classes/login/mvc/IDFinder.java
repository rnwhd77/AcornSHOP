package login.mvc;

import java.io.IOException;
import java.io.PrintWriter;

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
@WebServlet("/IDFinder.do")
public class IDFinder extends HttpServlet {
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
		System.out.println("[Finder.java]");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String tel = request.getParameter("F_tel");
		String name = request.getParameter("F_name");
		//System.out.println(tel); 전화번호 확인성공
		DBDAO dao = new DBDAO();
		String id=dao.IDFind(name , tel);
		if(id!=null) {
			//System.out.println(id); 아이디값 받기 확인
			session.setAttribute("ID" , id);
			out.print("찾기성공");
			response.sendRedirect("login/IDFind.jsp");
		}else {
			out.print("찾기실패");
		}
		
	}
}
