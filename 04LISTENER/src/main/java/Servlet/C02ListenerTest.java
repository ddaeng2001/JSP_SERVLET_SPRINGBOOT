package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/app/add","/app/replace","/app/remove"})
public class C02ListenerTest extends HttpServlet{

	@Override		//어떤 요청이든 다 받아냄(3개의 url둘 다 )
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("[SERVLET] C02ListenerTest service");
		String uri = req.getRequestURI();
		
		if(uri.contains("/app/add")) {
					//ServletContext == Application 내장 객체 in JSP
			req.getServletContext().setAttribute("CTX_KEY", "CTX_VALUE");
									//Listener 02가 setAttribute를 감지할 것임
			
		}else if(uri.contains("/app/replace")) {
			req.getServletContext().setAttribute("CTX_KEY", "CTX_VALUE_2");
		}else {
			req.getServletContext().removeAttribute("CTX_KEY");
		}
	}
	

	
}
