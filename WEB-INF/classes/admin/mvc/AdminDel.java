package admin.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.common.*;

@WebServlet("/memberDel.do")
public class AdminDel extends HttpServlet {
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
		System.out.println("[AdmineDel.java]");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		System.out.println(id);
		DBDAO dao = new DBDAO();
		dao.admindel(id);
		dao.admindel2(id);
		dao.admindel3(id);
		dao.admindel4(id);
		dao.admindel5(id);
		System.out.println("삭제완료");
		response.sendRedirect("member.do");
	}

}// Adminedit class end
