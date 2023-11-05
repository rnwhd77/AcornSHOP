package login.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.common.*;

@WebServlet("/idCheckController")
public class idCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[idCheckController]");//POST 값 확인
		String id = request.getParameter("id");
		System.out.println("id : " + id);
		boolean result = new DBDAO().IdCheck(id);
		request.setCharacterEncoding("euc-kr");
		PrintWriter out = response.getWriter();
		
		if(result) out.println("0");
		else out.println("1");
	
		out.close();
		
//		out.print(result);
//		memberDAO dao = new memberDAO(); 
//		boolean res2 = dao.idCheck(email); 값을여러번 사용해야될때 변수에 담아줘서 사용
//		response.getWriter().print(result); 위랑 똑같음
	}
}
