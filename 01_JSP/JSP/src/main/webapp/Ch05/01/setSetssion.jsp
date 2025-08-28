<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//Request 객체 - 요청했을 때 한 번 살아있음(재요청시, 초기화 됨)
	request.setAttribute("test1","test1_value");

	
	//Session 객체 - 지정된 시간까지 유지, 기본 1800초(30분) / 조건 : 톰캣이 활성화된 상태
	session.setAttribute("test2","test2_value");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="./getSession.jsp"> 속성확인 페이지로 이동</a>
<!--  Session 식별을 위한 cookie형태의 값을 Response로 보내주고 session을 찾기 위해
cookie형태의 값을 request하면 cookie를 통해서 session을 찾아냄-->
</body>
</html>