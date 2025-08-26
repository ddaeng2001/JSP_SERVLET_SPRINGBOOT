<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--

	Cookie
	문자열 데이터만 저장가능
	4Kbyte 이하의 공간을 차지
	여러개의 쿠키 설정가능(최대 300개)
	도메인당 20개까지 저장가능
	저장한도를 초과하면 최근에 사용되지 않는 쿠키부터 자동삭제
	 
 -->

<%
	Cookie cookie1 = new Cookie("cookie1", "value1"); //key-value형태로 데이터를 담을 수 있음
	
	Cookie cookie2 = new Cookie("cookie2", "value2");
	
	//쿠키의 유지기간(-1: 기본값 -> 쿠키파일 생성X, 브라우저 종료 시 쿠키 삭제됨)
	cookie2.setMaxAge(60*5);	//60초 * 5 = 5분
	cookie2.setPath("/"); //모든 페이지에서 쿠키 확인 가능
	
	response.addCookie(cookie1);//jsp에서 작업했던 쿠키 추가
	response.addCookie(cookie2);//jsp에서 작업했던 쿠키 추가
	
	
	
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