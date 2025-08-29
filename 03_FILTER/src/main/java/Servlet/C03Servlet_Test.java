package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


//매핑처리
@WebServlet("/main.do")
public class C03Servlet_Test extends HttpServlet {

	@Override
				//doGet : 웹 요청에 대한 응답을 해줌
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("GET /main.do..."); //외부에서 요청이 들어오면 WEB-INF의 main.jsp로 보내줌
											   //main.jsp에서 직접적으로 접근은 불가능
											   //Servlet에서는 forward과 redirect를 사용해서 페이지 이동을 기본적으로 함
		
		//외부 요청이 들어오면 WEB-INF안의 경로로 포워딩이나 리다이렉트해서 페이지 이동함
		
		
        HttpSession session = req.getSession(); //session에 메시지가 담겨져 있는 상태
        if(session.getAttribute("message")!=null) {
        	//session의 내용을 꺼내서 message에 내용이 있다면
        	String message = (String)session.getAttribute("message"); //메시지를 꺼냄
        	//메시지 제거
        	session.removeAttribute("message"); //-> 세션에 계속 남아있지 않음
        	
        	req.setAttribute("message", message);
        }
		req.getRequestDispatcher("/WEB-INF/main.jsp").forward(req, resp); //포워딩 - req와 resp 전달
		
		
	} 
	
}
