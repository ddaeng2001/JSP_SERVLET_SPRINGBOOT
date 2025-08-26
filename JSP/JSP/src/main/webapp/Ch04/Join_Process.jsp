<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 문자셋 설정 */
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<!--  액션 태그가 아니면 getParameter로 일일히 다 받아와야함 -->
<jsp:useBean id="dto" class="Ch02.UserDto" scope="request" />
<jsp:setProperty name="dto" property="*" />

<%
	// 유효성 검사
	// DB 저장
						//업캐스팅된 상태로 받음
	request.setAttribute("userDto",dto); //request인 상태에서 계속 유지될 수 있도록 함
	//담아놓은 dto를 request에 저장
	
	//DbUtils가 어떤 작업을 할 건지 지시하는 것도 포함시키기
	request.setAttribute("url", "/join");
	//Service no 주기
	request.setAttribute("serviceNo",1); //C:1 R:2 U:3 D:4
	// main.jsp or login.jsp로 이동(포워딩 방식)
	request.getRequestDispatcher("./DbUtils.jsp").forward(request,response); //request, response유지한채로 이동할 준비
	
	
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