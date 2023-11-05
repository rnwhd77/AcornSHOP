package mypage.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypage.common.DBDAO;


@WebServlet("/DeleteController")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
    public DeleteController() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DeleteController, mothod=GET");
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DeleteController, mothod=POST");
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		try{
			
			String id=request.getParameter("id");
			String pwd=request.getParameter("pwd");
			System.out.println(id + pwd +"삭제요청");
			DBDAO dbsql=new DBDAO();
			dbsql.dbDelete(id);
			dbsql.dbDelete2(id);
			dbsql.dbDelete3(id);
			dbsql.dbDelete4(id);
			dbsql.dbDelete5(id,pwd);
			System.out.println(id + pwd +"돌아감");
			HttpSession session = request.getSession();
			session.removeAttribute("ID");
			response.sendRedirect("index.jsp");   
			//RequestDispatcher dis=request.getRequestDispatcher("./member.do"); 관리자페이지 회원목록
			//dis.forward(request, response);
		}catch(Exception ex){  System.out.println(ex.toString());}  
	}//user END
}//class END


