<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- html에서 전달하는 내용들을 받을 준비 -->
 	<!-- 백엔드 코드 -->
 <%@ page import="Ch02.ProfileDto" %> <!-- 이렇게하면 이 클래스를 스크립스틀릿에서 사용가능함 -->
 <% 	
 	/*  
		request 내장객체 : 요청정보값 저장(Http Request Protocol의 구조 형태) - 따로 정리할 예정
		외부로부터 요청이 들어왔을 때 서버에서는 request라는 이름으로 보관함 : 사용자의 요청에 대한 정보를 담고 있음
 	*/
 	
 	/* 문자셋 설정 : 공식처럼 알기  */ /* 모든 응답요청에 대해서 매번 실행시키기 힘들기에 전역으로 추후에 바꿀 것임  */
 	request.setCharacterEncoding("UTF-8"); 
 	response.setContentType("text/html;charset=UTF-8");
 	
 	/* DTO로 묶어서 할거예용~ 굳이 파라미터를 일일히 치지 않아도 알아서 처리해줌  */
 	String username = request.getParameter("username");
 	String age = request.getParameter("age");
 	String addr = request.getParameter("addr");

 	
 	//DTO로 묶어서
 	ProfileDto dto = new ProfileDto(username,age,addr);
 	System.out.println("dto: " + dto);
 
 %> 
    
    
    
    
<!--  요청했던 Client의 브라우저에서 확인할 수 있는 부분-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	ProfileDto : <%=dto %><br/>

</body>
</html>