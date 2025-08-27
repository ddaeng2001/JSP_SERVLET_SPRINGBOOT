<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--

	Cookie
	문자열 데이터만 저장가능
	4Kbyte 이하의 공간을 차지
	여러개의 쿠키 설정가능(최대 300개)
	도메인당 20개까지 저장가능
	저장한도를 초과하면 최근에 사용되지 않는 쿠키부터 자동삭제
	서버에서 쿠키를 만들어줘서 그걸 받은 Client가 다음 request시 서버에 던지는 것!
	 
 -->

<!-- http://localhost:8090/JSP/Ch06/01/setCookie.jsp -> 쿠키 생성 확인  -->

<%
	Cookie cookie1 = new Cookie("cookie1", "value1"); //key-value형태로 데이터를 담을 수 있음
	cookie1.setPath("/");
	//유지기간을 설정하지 않으면 브라우저 종료 시 쿠키가 삭제됨
	//쿠키의 유지기간(-1: 기본값 -> 쿠키파일 생성X, 브라우저 종료 시 쿠키 삭제됨)
	
	
	Cookie cookie2 = new Cookie("cookie2", "value2");
	cookie2.setMaxAge(60*5);	//60초 * 5 = 5분
	cookie2.setPath("/"); //모든 페이지에서 쿠키 확인 가능
			//쿠키 적용 범위 : 최상위로 위치시켜놨기 때문에 어느 위치를 가도(5분 정도 유지됨) 쿠키 값이 남아있음
	
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