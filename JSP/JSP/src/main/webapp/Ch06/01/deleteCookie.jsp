<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	String cookieName = request.getParameter("name");
	if(cookieName!=null){ //cookieName이 문자열을 제대로 받았다면
		Cookie cookie = new Cookie(cookieName, null);	//빈 value의 쿠키 생성
		cookie.setMaxAge(0); //쿠키 바로 만료 처리 - 유지시간 0 초
		
		//!신경쓰기!
		cookie.setPath("/"); //쿠키 적용 URI 설정(/: 현재 도메인의 모든 영역)
		
		response.addCookie(cookie); //만료를 즉시 시키는 동일한 이름의 쿠키 전달
		
	}
	
	out.println("<script>alert('쿠키가 삭제되었습니다.');location.href='getCookie.jsp'; </script>"); //프론트엔드 코드를 땡겨쓰기
													//현재 위치
	//getCookie로 새로운 쿠키 요청함
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