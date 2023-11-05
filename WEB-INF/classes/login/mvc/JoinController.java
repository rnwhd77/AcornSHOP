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
import login.common.DBVO;

@WebServlet("/JoinController")
public class JoinController extends HttpServlet {
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
		System.out.println("[JoinController]");
		request.setCharacterEncoding("euc-kr");
		String userid = request.getParameter("userid");
		String pwd =request.getParameter("pwd"); 
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");
		String tel = request.getParameter("tel");
		
		System.out.println("ID = " + userid);
		System.out.println("PW = " + pwd);
		System.out.println("name = " + name);
		System.out.println("email = " + email);
		System.out.println("addr = " + addr);
		System.out.println("tel = " + tel);

		DBVO vo = new DBVO();
		DBDAO dao = new DBDAO();
		
		vo.setId(userid); vo.setPw(pwd); 
		vo.setName(name); vo.setEmail(email);
		vo.setAddr(addr); vo.setTel(tel);
		
		int cnt = dao.join(vo);
		System.out.println(cnt);
		System.out.println("확인 " );
		HttpSession session = request.getSession();
		
		if (cnt > 0) {
			System.out.println("회원가입 성공");
			//ID session
			session.setAttribute("ID", userid);
			
			response.sendRedirect("login/Join_Success.jsp");
		}else {
			System.out.println("회원가입실패");
			response.sendRedirect("index.jsp");
		}
	}
}
