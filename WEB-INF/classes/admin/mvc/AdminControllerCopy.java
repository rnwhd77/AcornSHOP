package admin.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.common.DBDAO;
import admin.common.DBVO;

@WebServlet("/member.doCopy")
public class AdminControllerCopy extends HttpServlet {
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
		PrintWriter out=response.getWriter();
		
		DBDAO dao = new DBDAO();
		List list = dao.member();
		out.print("<html><body>");
		out.print("<table border=1 align='center'><tr align='center' bgcolor='lightgreen'>");
		out.print("<td>아이디</td><td>비번</td><td>이름</td><td>이메일</td><td>주소</td><td>전화번호</td><td>가입날짜</td>");
		out.print("<td colspan=\"2\">변경하기</td></tr>");
		for(int i=0; i<list.size(); i++) {
			DBVO vo = (DBVO) list.get(i);
			String id =vo.getId();
			String pwd =vo.getPw();
			String name = vo.getName();
			String email= vo.getEmail();
			String addr = vo.getAddr();
			String tel = vo.getTel();
			Date date = vo.getSigndate();
			out.print("</td><td>" + id + "</td><td>" + pwd  + "</td><td>" + name
					+ "</td><td>" + email + "</td><td>" + addr + "</td><td>" + tel + "</td><td>" + date +"</td>");
			//out.print("<td><input a href=\"../admin/admin_edit.jsp\" type=\"button\" value=\"수정\"></td>");
			out.print("<td><input type=\"button\"  value=\"수정\" onclick=\"location.href='admin/admin_edit.jsp'\"></td>");
			out.print("<td><input type=\"button\" value=\"삭제\"></td></tr>");
		}
		out.print("</body><html>");
	}
}
