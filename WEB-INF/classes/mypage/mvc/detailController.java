package mypage.mvc;

import mypage.common.DBDAO;
import mypage.common.DBVO;

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

@WebServlet("/detailController")
public class detailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public detailController() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DetailController, mothod=GET");
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DetailController, mothod=POST");
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		try{
			
			String data= request.getParameter("ID");
			System.out.println(data);
			DBDAO dbsql=new DBDAO();
			DBVO aa=dbsql.memberDetail(data);
			
			request.setAttribute("detail", aa);
			response.sendRedirect("mypage/mypage.jsp");
		}catch(Exception ex){  System.out.println(ex.toString());}  
	}//user END
}//class END
