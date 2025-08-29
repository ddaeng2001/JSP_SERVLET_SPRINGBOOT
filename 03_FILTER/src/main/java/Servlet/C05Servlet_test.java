package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// 외부 접근 시 사용할 엔드 포인트
@WebServlet("/login.do")
// get 방식 : 페이지 보여주는 용도 - post 방식 : 로그인 처리 용도
public class C05Servlet_test extends HttpServlet {

    // get 방식 - 페이지 전송용
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 페이지 전송 - 포워딩 처리 필요
        System.out.println("GET /login.do...");
        
        HttpSession session = req.getSession(); //session에 메시지가 담겨져 있는 상태
        
        //session을 request에 담아서 요청 시 초기화되도록 만듦
        if(session.getAttribute("message")!=null) {
        	//session의 내용을 꺼내서 message에 내용이 있다면
        	String message = (String)session.getAttribute("message"); //메시지를 꺼냄
        	//메시지 제거
        	session.removeAttribute("message"); //-> 세션에 계속 남아있지 않음
        	
        	req.setAttribute("message", message);
        }
        

        req.getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp); // Servlet에서 jsp로 request 객체를 던져줬기에 쓸 수 있음
    }

    // post 방식 - 로그인 처리용
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 로그인 처리
        System.out.println("POST /login.do...");

        // 01 파라미터 받기(처리)
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // 02 유효성 검사
        if (!isValid(username, password, req)) {
            // 유효하지 않다면 로그인 페이지로 back (이동하는 동시에 message 전달)
            req.getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp);
            return;
        }

        // 03 서비스 처리 (로그인 처리) - db에 데이터를 넣거나 확인해야 함 (연결 - select - 제거)

        try {
            DbUtils.conn();
            UserDto dto = DbUtils.selectUser(username); // 사용자 ID 확인

            if (dto == null) { // 동일한 계정이 존재하지 않음
                req.setAttribute("message", "동일한 계정이 존재하지 않습니다.");
                req.getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp);
                return;
            }

            // 입력한 PW 대조
            if (!password.equals(dto.getPassword())) {
                req.setAttribute("message", "비밀번호가 틀립니다.");
                req.getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp);
                return;
            }

            DbUtils.disConn(); // 자원 제거

            // 인증 완료 정보 + ROLE 저장 - SESSION 기반으로 데이터 담아놓은 상태
            HttpSession session = req.getSession();
            session.setAttribute("username", username); // 비밀번호는 노출되면 안 되므로 저장하지 않음
            session.setAttribute("isAuth", true);
            session.setAttribute("role", "ROLE_USER"); // ROLE_USER : 권한 체킹

            // 뷰로 이동
            session.setAttribute("message", "로그인 성공!"); // 메시지 추가
            resp.sendRedirect(req.getContextPath() + "/main.do"); // req.getContextPath(): 프로젝트 경로

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 필요 시 정리 코드
        }

        // 04 뷰로 이동 (뷰로 데이터 전송)
        // 로그인 처리가 끝났기 때문에 새로운 내용을 요청해야 하므로 => 리다이렉트 사용 필요
    }

    // 전달되는 파라미터를 받아 유효한지 판단 - 02와 연계 // 메시지를 전달하기 위해 request 내장객체 삽입
    public boolean isValid(String username, String password, HttpServletRequest req) {
        boolean flag = true;

        if (username.isEmpty()) {
            req.setAttribute("username_msg", "유저명을 입력하세요"); // 스코프 내의 attribute는 EL 표현식으로 접근 가능
            flag = false; // 유효하지 않으면 false 반환
        }

        if (password.isEmpty()) {
            req.setAttribute("password_msg", "패스워드를 입력하세요");
            flag = false;
        }

        return flag; // 유효하다면 true 반환 (기본값)
    }
}
