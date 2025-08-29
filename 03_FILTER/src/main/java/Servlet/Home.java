package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//HOME에 여러 경로 등록 가능(by.urlPatterns)
//@WebServlet(urlPatterns = {"/index.do"}) --web.xml에 등록해서 주석처리!

//요청에 대한 웹처리 작업
public class Home extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("GET /index.do...");
		
		//index.jsp 연결시키기 - 실제 경로로 포워딩
		req.getRequestDispatcher("/WEB-INF/index.jsp").forward(req, resp);
		
		//----외부에서 index.do를 요청하면 /WEB-INF/index.jsp로 포워딩 처리 --------
		
		
	}

}
