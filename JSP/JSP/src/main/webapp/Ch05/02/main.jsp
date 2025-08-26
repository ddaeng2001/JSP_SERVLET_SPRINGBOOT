<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- login여부와 role값 확인-->
	<h1>MAIN PAGE</h1>
	ISAUTH : ${isAuth}	<br/>
			<!-- scope내의 setAttribute는 EL표현식으로 key값을 통해서 value값을 바로 꺼내올 수 있음  -->
	ROLE :${role}<br/>
	
</body>
</html>