<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<%
	//Client가 cookie를 계속 던지고 있는 상황(request)
	//5분 지나면 cookie가 사라지기에 setCookie에서 cookie를 얻은 후 getCookie로 가서 확인하기



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	Cookie[] cookies = request.getCookies();
	 
	if(cookies !=null){
		for(Cookie cookie : cookies){
			System.out.println(cookie.getName()+ ": " + cookie.getValue());
			%>
				<!-- 쿠키 삭제를 위해 -->
				<!--  a태그(get 요청) 파라미터와 이름값을 쿠키이름과 value값으로 전달함-->
				<a href="./deleteCookie.jsp?name=<%=cookie.getName()%>">쿠키삭제(<%=cookie.getName() %>)</a><br/>
			<%
		}
	}
%>
</body>
</html>