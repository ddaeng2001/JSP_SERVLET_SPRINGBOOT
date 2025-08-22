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
 <jsp:useBean id="dto" class="Ch02.TestDto" scope="request" />
 <!--==>ProfileDto dto = new ProfileDto();를 대신하고 있음  -->
 <!--   id="dto" : JSP 페이지에서 이 객체를 dto라는 이름으로 참조할 수 있음

		class="Ch02.UserDto" : 해당 클래스 타입으로 객체 생성

		scope="request" : 객체의 범위(생명주기)를 지정

		request 범위는 현재 HTTP 요청(request) 동안만 객체가 살아있음

		즉, 다른 요청에서는 새로 만들어짐-->
 
 <jsp:setProperty name="dto" property="stringtoDate" param="date" /> <!-- jsp한정 -->
 <jsp:setProperty name="dto" property="*" /> <!--set함수를 통해 파라미터 값 넣기  -->
 <!--  int/double자료형이 set함수로 들어가있으면 property editor가 String으로 들어와도 중간에 변환을 시켜줌-->
 <!--  age="10"은 String인데 원시타입으로 바뀌어지나 String으로 들어오는 데이터를 editor가 LocalDateTime를 자동으로 변환시켜주진 않음-->
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
	TestDto : <%=dto %><br/>

</body>
</html>