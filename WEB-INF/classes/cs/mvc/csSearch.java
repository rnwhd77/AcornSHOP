package cs.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.common.*;

@WebServlet("/csSearch.do")
public class csSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}//end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}//end
	
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		String skey=request.getParameter("skey");
		String sval=request.getParameter("sval");
		//System.out.println("검색필드="+ skey+" 검색키워드="+ sval);

		if(skey==null || skey=="" || sval==null || sval=="" || sval.equals("")){
			skey="subject";
			sval="";
		}
		//String sqry = " where " + skey + " like '%"+ sval + "%'";
   
	    request.setAttribute("skey", skey);
        request.setAttribute("sval", sval);
        //request.setAttribute("sqry", sqry);
        
        System.out.println(skey);
        System.out.println(sval);
        //System.out.println(sqry);
 
        request.getRequestDispatcher("./cs/csSearch.jsp").forward(request, response);
        //response.sendRedirect("/AcornSHOP/cs/csSearch.jsp");
        // java(getParameter , setAttribute )  ->  jsp (getAttribute) 
	}//end

}//csSearch class end
