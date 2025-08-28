<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- html에서 전달하는 내용들을 받을 준비 -->
 	<!-- 백엔드 코드 -->
 <% 	
 	/*  
		request 내장객체 : 요청정보값 저장(Http Request Protocol의 구조 형태) - 따로 정리할 예정
		외부로부터 요청이 들어왔을 때 서버에서는 request라는 이름으로 보관함 : 사용자의 요청에 대한 정보를 담고 있음
 	*/
 	
 	/* 문자셋 설정 : 공식처럼 알기  */ /* 모든 응답요청에 대해서 매번 실행시키기 힘들기에 전역으로 추후에 바꿀 것임  */
 	request.setCharacterEncoding("UTF-8"); /* 들어올 때 */
 	response.setContentType("text/html;charset=UTF-8"); //응답을 보낼 떄 어떤 타입으로 보낼건지에 따라 문서로 해석되냐 아니냐가 결정됨
 	
 	String username = request.getParameter("username");
 	String password = request.getParameter("password");
 	String bgColor = request.getParameter("bgcolor");
 	System.out.printf("%s %s %s \n", username, password, bgColor);
 
 
 %> 
    
    
    
    
<!--  요청했던 Client의 브라우저에서 확인할 수 있는 부분-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color : <%=bgColor%>">
	username : <%=username %><br/>
	password : <%=password %><br/>
	bgcolor : <%=bgColor %><br/>

</body>
</html>