<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!--  04page에서 FN에서의 내용 확인 가능해짐!-->
	<h1>04.JSP PAGE</h1>
	USERNAME : ${param.username }<br/> <!-- 파라미터에서 꺼내 사용하는 것 -->
	PASSWORD : ${param.password }<br/> 
	C02_VALUE : ${C02}<br/> <!-- 02.jsp request 내의 attribute 값를 바로 꺼내서 화면에서 확인 가능 -->
	C03_VALUE : ${C03}<br/> <!-- 03.jsp request 내의 attribute를 바로 꺼내서 화면에서 확인 가능 -->
</body>
</html>