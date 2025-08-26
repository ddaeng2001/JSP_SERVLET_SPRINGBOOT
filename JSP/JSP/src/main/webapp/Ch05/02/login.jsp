<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--  흐름 파악에 초점을 둘 것!-->
<%
	//처리기(프로세서)에서 해야하는 것
	//01 파라미터 확인
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	//02 유효성 검사(ID)
	if(username.isEmpty()){ //username에 입력하지 않았다면(텅 비어있다면)
		request.setAttribute("username_msg", "username을 입력하세요.");
		request.getRequestDispatcher("./login_form.jsp").forward(request,response);
		//내용이 유지가 되는 상태(request)에서(포워딩)
		return; //->Servelt 파일 내의 특정 함수에서 동작하는 상황
				//->여러번 포워딩을 해야하는(분기처리)경우라면 포워딩 후 return처리를 해야 안전함!
				
	}
	
	//02유효성검사(PW)
	if(password.isEmpty()){ //username에 입력하지 않았다면(텅 비어있다면)
		request.setAttribute("password_msg", "password를 입력하세요.");
		request.getRequestDispatcher("./login_form.jsp").forward(request,response);
		//내용이 유지가 되는 상태(request)에서(포워딩)
		return; //->Servelt 파일 내의 특정 함수에서 동작하는 상황
				//->여러번 포워딩을 해야하는(분기처리)경우라면 포워딩 후 return처리를 해야 안전함!
				
	}
	
	//03 관련 서비스 실행(==처리)[로그인]
	//03-01) username과 동일한 계정이 있는지 확인 후 가져와야함(select를 써야함)
	if(!username.equals("admin")){ //DB로 내용 가져왔다 치고!, 해당 계정이 없다면(일치하지 않는다면)
		request.setAttribute("username_msg", "해당 계정은 존재하지 않습니다.");
		request.getRequestDispatcher("./login_form.jsp").forward(request,response);
		return;
									
	}
	//03-02) (if 있다면) password의 값이 입력한 값이랑 동일한지 확인
	if(!password.equals("1234")){ //DB로 내용 가져왔다 치고!, 해당 계정이 없다면(일치하지 않는다면)
		request.setAttribute("password_msg", "패스워드가 일치하지 않습니다.");
		request.getRequestDispatcher("./login_form.jsp").forward(request,response);
		return;
									
	}
	//★ 신경써야 할 파트 ★
	//03-03) session에 해당 계정의 작업에 필요한 속성 저장 : 로그인 이후 상태정보를 유지하기 위해서
	session.setAttribute("isAuth",true); //scope내의 setAttribute는 EL표현식으로 key값을 통해서 value값을 바로 꺼내올 수 있음
						//인증처리가 되어있는 상태인지
	session.setAttribute("role","ROLE_ADMIN"); //★★★★
						//페이지에 대한 접근 제한
						//해당 계정에 대한 역할을 기간 동안 적절하게 유지시켜줘야 함
						//role : 권한 체크 시 사용, 특정 페이지에 대한 접근 제한을 해야하기에 DB로부터 내용
								//을 가져올 때 사용자에 대한 정보를 담는 테이블 내에 role값도 같이 저장되어
								//야 함
	session.setMaxInactiveInterval(30); //30초만 세션유지
			//session 유지기간 제한
			
	//04 뷰로 이동 or 데이터 전달
	response.sendRedirect("./main.jsp"); //문제가 있으면 login form으로 없으면 session처리 후 view로 이동
	



%>
    