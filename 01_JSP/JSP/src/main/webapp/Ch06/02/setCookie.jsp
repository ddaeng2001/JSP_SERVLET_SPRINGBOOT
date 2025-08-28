<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Cookie cookie1 = new Cookie("c1", "v1"); //key-value형태로 데이터를 담을 수 있음
	cookie1.setMaxAge(60 * 10); //10분
	cookie1.setPath("/"); //도메인 내에 모든 URI 접근 가능(http://localhost:8090 내 모든 페이지)
	

	Cookie cookie2 = new Cookie("c2", "v2");
	cookie2.setMaxAge(60 * 10); //60초 * 5 = 10분
	cookie2.setPath("./"); //현재 위치의 폴더 : http://localhost:8090/JSP/Ch06/C02/*
	

	Cookie cookie3 = new Cookie("c3", "v3");
	cookie3.setMaxAge(60 * 10); //10분
	cookie3.setPath("/JSP/Ch01"); //특정 URI경로를 기준으로 쿠키 활성화 가능
	
	response.addCookie(cookie1);//jsp에서 작업했던 쿠키 추가
	response.addCookie(cookie2);
	response.addCookie(cookie3);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>