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

@WebServlet("/EditController")
public class EditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditController() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("EditController, mothod=GET");
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReviewController, mothod=POST");
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		try{
			String data1= request.getParameter("email");
			String data2= request.getParameter("tel");
			String data3= request.getParameter("address");
			String data4= request.getParameter("id");
			
			
			System.out.println(data1+"\t"+data2);
			
			DBDAO dbsql=new DBDAO();
			DBVO bean=new DBVO();
			bean.setEmail(data1);
			bean.setPhone(data2);
			bean.setAddress(data3);
			bean.setId(data4);
			
			int ok=dbsql.memberEdit(bean, data4);
			if(ok>0){ System.out.println("OK"); }
			
			DBVO aa=dbsql.memberDetail(data4);
			
			request.setAttribute("detail", aa);
			response.sendRedirect("mypage/mypage.jsp");
					
		}catch(Exception ex){  System.out.println(ex.toString());}  
	}//user END
}//class END
