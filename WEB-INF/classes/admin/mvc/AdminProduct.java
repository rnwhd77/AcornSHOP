package admin.mvc;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import admin.common.DBDAO;
import admin.common.DBVO;

@WebServlet("/AdminProduct.do")
public class AdminProduct extends HttpServlet {
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
		System.out.println("[AdminProduct.java]");
		
		
		ServletContext context = getServletContext();
		String path = context.getRealPath("product/images/");
		
		String encType = "UTF-8";
		int sizeLimit = 20 * 1024 * 1024;
		
		//MultipartRequest객체가 생성되는 순간 파일이 업로드된다.
		MultipartRequest multi = new MultipartRequest(
				request, //MultipartRequest와 연결할 request 객체
				path, //서버 측에 저장될 경로
				sizeLimit, //최대 파일 크기
				encType, //파일 인코딩 방식
				new DefaultFileRenamePolicy() //파일 중복 처리
				);
		
		int pnum=Integer.parseInt(multi.getParameter("p_code"));
		System.out.println(pnum);
		
		String pname=multi.getParameter("p_name");
		System.out.println(pname);
		
		int pprice=Integer.parseInt(multi.getParameter("p_price"));
		System.out.println(pprice);
		
		int psale=Integer.parseInt(multi.getParameter("p_sale"));
		System.out.println(psale);
		
		String pcon=multi.getParameter("p_con");
		System.out.println(pcon);
		
		String pimg=multi.getFilesystemName("p_img");
		System.out.println(pimg);
		
		
		DBVO vo= new DBVO();
		DBDAO dao = new DBDAO();
		
		vo.setPnum(pnum); vo.setPname(pname);
		vo.setPprice(pprice); vo.setPsale(psale);
		vo.setPcon(pcon); vo.setPimg(pimg);
		
		 int cnt = dao.insertProduct(vo);
		 System.out.println(cnt);
		 if( cnt > 0) {
			 System.out.println("상품등록 성공");
				response.sendRedirect("admin/admin_product.jsp");
		 }else {
			 System.out.println("상품등록 실패");
		 }
	}
	
}
