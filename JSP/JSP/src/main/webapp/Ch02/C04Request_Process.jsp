<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- html에서 전달하는 내용들을 받을 준비 -->
 	<!-- 백엔드 코드 -->
    
 <%
	/* 문자셋 설정 : 공식처럼 알기  */ /* 모든 응답요청에 대해서 매번 실행시키기 힘들기에 전역으로 추후에 바꿀 것임  */
	request.setCharacterEncoding("UTF-8"); 
	response.setContentType("text/html;charset=UTF-8");
 %>

 													<!--  요청이 들어오니까 request기준-->
 <jsp:useBean id="dto" class="Ch02.ProfileDto" scope="request" />
 <!--==>ProfileDto dto = new ProfileDto();를 대신하고 있음  -->
 <!--   id="dto" : JSP 페이지에서 이 객체를 dto라는 이름으로 참조할 수 있음

		class="Ch02.UserDto" : 해당 클래스 타입으로 객체 생성

		scope="request" : 객체의 범위(생명주기)를 지정

		request 범위는 현재 HTTP 요청(request) 동안만 객체가 살아있음

		즉, 다른 요청에서는 새로 만들어짐-->
 
 <jsp:setProperty name="dto" property="*" /> 
 
 <!-- 역할:
JSP 내에서 dto 객체의 프로퍼티(필드) 값을 요청 파라미터(request.getParameter())에서 자동으로 찾아서 세팅해준다는 의미

세부 내용:

name="dto" : 위에서 선언한 빈 이름

property="*" : 와일드카드(*)로 모든 프로퍼티를 자동 매핑

예를 들어 dto 객체에 setUsername(String) 메서드가 있으면,
HTTP 요청 파라미터 중 username이라는 이름이 있으면 그 값을 자동으로 넣어줌

즉, 요청 파라미터 이름과 빈의 프로퍼티 이름이 같으면 자동으로 값을 세팅  -->
 
 
 <% 	
 	/*  
		request 내장객체 : 요청정보값 저장(Http Request Protocol의 구조 형태) - 따로 정리할 예정
		외부로부터 요청이 들어왔을 때 서버에서는 request라는 이름으로 보관함 : 사용자의 요청에 대한 정보를 담고 있음
 	*/
 	


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