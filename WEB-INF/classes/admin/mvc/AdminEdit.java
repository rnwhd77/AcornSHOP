package admin.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.common.*;

@WebServlet("/memberEdit.do")
public class AdminEdit extends HttpServlet {
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
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		System.out.println("[Adminedit.java]");
		PrintWriter out = response.getWriter();
		
		
		String id = request.getParameter("ID");
		String pw = request.getParameter("PWD");
		String name = request.getParameter("NAME");
		String email = request.getParameter("EMAIL");
		System.out.println(id);
		System.out.println(pw);
		System.out.println(name);
		System.out.println(email);

		
		DBDAO dao = new DBDAO();
		DBVO vo = new DBVO();
		vo.setId(id);
		vo.setPw(pw);
		vo.setName(name);
		vo.setEmail(email);
		dao.adminedit(vo);
		System.out.println(vo.getId());
		System.out.println("업데이트 완료");
		response.sendRedirect("member.do");
	}// end

}// Adminedit class end
