package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

//class를 servlet으로 사용한다 -> Tomcat에서 servlet이 웹 처리를 담당하겠다 - request로부터 어떤 요청이 들어왔을때 servlet이 파일이 mapping을
//해서 여러 처리를 하고 그 결과를 반환하겠다는 말!(기본:웹페이지)
//request 요청 - 서블릿 파일 매핑(요청 처리를 할 uri 지정/설정) - 요청 처리 - 결과반환(웹페이지)

//uri지정

				 //도메인 경로 - http://localhost:8090/02_SERVLET_INIT/ - 현재위치
				 //전체 도메인 경로 http://localhost:8090/02_SERVLET_INIT/TEST_01

public class C02Servlet_Test extends HttpServlet{
	
	//Servlet의 웹 처리를 보기 위해 생명주기 함수들을 볼 예정
	@Override
	public void init() throws ServletException {
		//서블릿 최초 실행함수
		System.out.println("C02Servlet_Test INIT() invoke...");
	}
	
	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		//요청시 마다 동작하는 함수
		System.out.println("C02Servlet_Test SERVICE() invoke...");
	}

	@Override
	public void destroy() {
		//내용 변경 시 동작하는 함수
		System.out.println("C02Servlet_Test DESTORY() invoke...");
	}


	
	
}
