package hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 */
/*
 1. Servlet Annotation을 자동으로 추가해준다.
 2. 만약 Servlet Annotation을 사용하지 않고 서블릿을 호출하려면 web.xml파일(dd파일)에 서블릿 정보를 추가해야 한다.
 3. url-pattern을 지정하는 방법 3가지
    1) *.do    - localhost/abc/def/test.do => 앞에 뭐가 오든 간에 .do있으면 호출
                                      주의사항은 앞에 /를 붙이면 안된다. (extension matching)
    2) /test   - 정확하게 맞아야 호출 (exact matching)
    3) /test/* - (wildcard matching)
*/
//@WebServlet("/hey")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   	    //응답  MIME 타입과 문자 인코딩을 지정한다.
		response.setContentType("text/html;charset=utf-8");
		//클라이언트에게 응답한 출력객체를 생성한다.
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html lang=\"en\">");
		out.println("<body>");
		out.println("<h1>Hello 하은!!!</h1>");
		out.println("</body>");
		out.println("</html>");
	
	}
	

}
