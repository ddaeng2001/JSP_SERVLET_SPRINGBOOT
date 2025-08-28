<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 선언문  -->
<%@ page import="Ch02.*, Ch04.*" %>
<%!
	public boolean isValid(UserDto dto){
		if(dto.getUserid().isEmpty()){ //html은 정적 페이지기 때문에 백엔드 코드를 받을 수가 없는 상태임
			System.out.println("Userid를 입력하세요.");
			return false;
		}
		if(dto.getUserid().length()<=5){
			System.out.println("Userid는 5자 이상 입력하셔야 합니다.");
			return false;
		}
	
		return true; //유효하다면 true
	
	}

%>

<%
	/* 문자셋 설정 */
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<!--01 파라미터 받기  -->
<!--  액션 태그가 아니면 getParameter로 일일히 다 받아와야함 -->
<jsp:useBean id="dto" class="Ch02.UserDto" scope="request" />
<jsp:setProperty name="dto" property="*" />

<%
	// 유효성 검사
	// DB 저장
/* 						//업캐스팅된 상태로 받음
	request.setAttribute("userDto",dto); //request인 상태에서 계속 유지될 수 있도록 함
	//담아놓은 dto를 request에 저장
	
	//DbUtils가 어떤 작업을 할 건지 지시하는 것도 포함시키기
	request.setAttribute("url", "/join");
	//Service no 주기
	request.setAttribute("serviceNo",1); //C:1 R:2 U:3 D:4
	// main.jsp or login.jsp로 이동(포워딩 방식)
	request.getRequestDispatcher("./DbUtils.jsp").forward(request,response); //request, response유지한채로 이동할 준비 */
	
	
	
	//02 유효성 검증
	if(!isValid(dto)){ //유효하다면 true값 반환, 유효하지 않는 경우에 if문 안에 들어와서 처리를 해야함
		//유효하지 않는 경우에 01Join.html으로 이동해야함
		
		response.sendRedirect("./01Join.html"); //정적페이지가 파라미터를 받으려면 JSP에서 처리해야함
	}
	//03 서비스 처리(회원가입->DB 저장)
	
	//03-01 db연결
	DbUtils.conn();
	//03-02 동일 계정 유무 확인
	
	//03-03 계정정보 저장
	
	//03-04 연결해제
	//DbUtils.disConn(); 
	
	//04 로그인 페이지로 이동
	
	
	// Join 처리 : 올바른 데이터가 있는지 검수한 후에 DB에 저장처리를 하고 기본 페이지 or 로그인을 유도하는 페이지로
				//이동하도록 유도
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	UserDto: <%=dto %><br/>
</body>
</html>