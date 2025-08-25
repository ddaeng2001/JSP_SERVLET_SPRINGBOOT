<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
				
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	request.setAttribute("C02","C02_value"); 
	//redirect
	//파라미터 전달 방법 : queryString으로 전송
	//스코프를 이용한 (Session / Application)
	response.sendRedirect("./03.jsp?username="+username+"&password="+password); 
						//새롭게 3번에 request하기에 기존 request내용인 username과 password 확인 X
	
						//외부에 노출해도 상관이 없는 문자라면 Query안의 문자도 상관없음

%>
<!--
	Redirect : 브라우저에서 request를 새로 하도록 만듦 -> request 내용 초기화
	ex> 회원가입이 끝나면 메인 페이지로 이동시킬 때 주로 사용됨
	FORWARD :
	자체적으로 새로운 요청을 해나갈 수 있음.
	
	
	Redirect : 서버가 클라이언트에게 새롭게 요청한 경로 URI를 전달
	클라이언트는 서버가 제시한 URL 경로로 새롭게 페이지 요청
	Request객쳉체와  Response 객체는 redirect 횟수 만큼 새로운 값으로 기대
  -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>02.JSP PAGE</h1>
	USERNAME : <%=username %><br/>
	PASSWORD : <%=password %><br/> 
	
</body>
</html>