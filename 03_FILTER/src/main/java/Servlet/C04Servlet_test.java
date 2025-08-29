package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//외부 접근 시 사용할 엔드 포인트 
@WebServlet("/join.do")
//get방식 : 페이지 보여주는 용도 - post방식 : 회원가입 처리용도
public class C04Servlet_test extends HttpServlet {

	
	//get 방식 - 페이지 전송용
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//페이지 전송 - 포워딩 처리 필요
		System.out.println("GET /join.do...");
		req.getRequestDispatcher("/WEB-INF/join.jsp").forward(req, resp); //Servlet에서 jsp로 request객체를 던져줬기에 쓸 수 있음
	}

	
	//post 방식 - 회원가입 처리용
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//회원가입 처리
		System.out.println("POST /join.do...");
		
		//01 파라미터 받기(처리)
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		//02 유효성 - Dto가 없이 하는 중!
		if(!isValid(username,password,req)) {
			//유효하지 않다면 로그인 페이지로 back(이동하는 동시에 message 전달)
			req.getRequestDispatcher("/WEB-INF/join.jsp").forward(req, resp);
			return;
		}
		//03 서비스 처리(회원가입처리) - db에 데이터를 넣어야함 (연결 - insert - 제거)
		try {
			DbUtils.conn();
			int result = DbUtils.insertUser(username, password); //정수값 반환을 통해 계정 정보가 잘 삽입됐는지의 여부를 판단 가능
			if(result<=0) { //0보다 크다면 : 행이 추가됨 <-> 문제가 발생했음
				req.getRequestDispatcher("/WEB-INF/join.jsp").forward(req, resp); //줄 수 있는 MESSAGE를 REQUEST에 실어서
				return;
			}
			DbUtils.disConn(); //자원제거
		} 
		
		catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		
		//04 뷰로 이동(뷰로 데이터 전송) - 회원가입처리가 끝났기 때문에 새로운 내용을 리퀘스트 해야함 => 리다이렉트 사용필요
		//세션에 넣어주기(request는 새요청마다 생성되는 거라 메시지를 넣어주기는 어려움)
		HttpSession session = req.getSession(); //JS에서는 session만 치면 됐으나 Servlet에서는 HttpSession까지 삽입
		session.setAttribute("message", "회원가입 성공!"); //톰캣이 계속 켜져있으면 30분동안 session이 유지됨(리다이렉트해서 이동하더라도)
														//그렇기에 EL표현식 사용 가능
		resp.sendRedirect(req.getContextPath()+ "/login.do"); //회원가입이 끝나면 로그인 페이지로 이동하도록
						  //request내장객체에서 꺼내 쓴 프로젝트 경로임 : req.getContextPath()
	}

	//전달되는 파라미털르 받아 유효한지 판단 - 02와 연계				//메시지를 받기 위해 request내장객체 삽입
	public boolean isValid(String username, String password, HttpServletRequest req) 
	{
		boolean flag=true;
		if(username.isEmpty()) {
			req.setAttribute("username_msg", "유저명을 입력하세요"); //스코프 내의 attribute는 EL표현식으로 접근 가능
			flag=false; //유효하지 않으면 false값 반환
		}
		
		if(password.isEmpty()) {
			req.setAttribute("password_msg", "패스워드를 입력하세요");
			flag=false;
		}
		
		return flag; //유효하다면 true값 return(기본값)
	}
}
