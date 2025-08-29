<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!-- 선언문 -->
<%@ page import="moduleTest.*" %>

<%
	/* 문자셋 설정 */
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<%!
	
	public boolean isValid(MemberDto dto){
		
		
		//각 항목 not null (message : '-' 를 입력하세요)
		if(dto.getUserid().isEmpty()){		
			System.out.println("Userid 를 입력하세요.");
			return false;
		}
		//userid 길이 5자 이하(message : Userid는 5자 이상 입력하셔야 합니다.)
		if(dto.getUserid().length()<=5){		
			System.out.println("Userid는 5자 이상 입력하셔야 합니다.");
			return false;
		}
		//패스워드 유효성 검증
		return true;
	}	
%>    


<!--  01 파라미터 받기 -->
<jsp:useBean id="dto" class="moduleTest.MemberDto" scope="request" />
<jsp:setProperty name="dto" property="*" />

<%
	
	try{
		//-----------------------------
		//02 유효성 검증	
		//-----------------------------
		if(!isValid(dto)){
			//유효하지 않는경우에 -> 01Join.html 로 Forwarding
			request.getRequestDispatcher("./join.html").forward(request, response);
			return ;
		}
		//-----------------------------
		//03 서비스 처리(회원가입->DB 저장)
		//-----------------------------
		//03-01 db연결
		DbUtils.conn();
		
		//Tx 시작
		DbUtils.TxStart();
		
		//03-02 동일 계정유무확인
		if(DbUtils.selectMember(dto.getUserid())!=null){
			System.out.println("기존 계정이 존재합니다");
			request.getRequestDispatcher("./join.html").forward(request, response);
			return ;
		}
		
		//03-03 계정정보 저장
		int result = DbUtils.insertMember(dto);
		if(result<=0){
			System.out.println("회원가입에 실패했습니다");
			request.getRequestDispatcher("./join.html").forward(request, response);
			return ;
		}
			
		//Tx 종료
		DbUtils.TxEnd();
		
		//03-04 연결해제
		DbUtils.disConn();
		
		//-----------------------------
		//04 로그인 페이지로 이동
		//-----------------------------
		System.out.println("회원가입을 완료했습니다");
		response.sendRedirect("./join.jsp");
	}
	catch(Exception e){
		System.out.println("문제 발생 ROLLBACK");
		DbUtils.RollBack();
	}
		
%>