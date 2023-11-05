package login.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.common.DBDAO;

@WebServlet("/loginController.do")
public class loginController extends HttpServlet {
	// private static final long serialVersionUID = 1L;

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
		// login.html 사용자 ID,PW

		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("ID");
		String pw = request.getParameter("PW");

		DBDAO dao = new DBDAO();
		int count = dao.login(id, pw);
		String msg = "";

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		if (count ==0 ) {
			msg = id + " 로그인 성공";
			session.setAttribute("ID", id);
			response.sendRedirect("index.jsp");
		} else if (count == 1) {
			msg = id + " 암호 확인";
			response.sendRedirect("index.jsp");
		} else {
			msg = id + " 존재하지 않는 ID";
			out.println(msg);
			response.sendRedirect("index.jsp");
		}
		response.setContentType("text/html;charset=UTF-8");
		out.println(msg);
		
		 String uri = request.getHeader("Referer");
		    if (uri != null && !uri.contains("/index.jsp")) {
		        request.getSession().setAttribute("prevPage", uri);
		    }
	}
}
