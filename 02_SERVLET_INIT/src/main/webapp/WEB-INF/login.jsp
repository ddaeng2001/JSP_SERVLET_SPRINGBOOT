<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>LOGIN PAGE</h1>
					<!-- 프로젝트 경로를 가져올 때 사용되는 값으로 프로젝트 이름이 바뀌어도 pageContext가 인식하고 있는 이름을 그대로 받아옴-->
	<form action="${pageContext.request.contextPath}/login.do" method="post"> 
											<!-- /join.do만 삽입 시 -->
											<!-- 경로 문제 발생  : 프로젝트 경로가 빠져있음(02_SERVLET_INIT)-->
											<!-- 직접 삽입도 가능하지만 일일히 다 하기엔 바뀔 때마다 해야해서 번거로움  -->
		<input name="username" /><br/>
		<input type="password" name="password" /><br/>
		<button>로그인</button>
	</form>
	<div>
		${ message }
	</div>
</body>
</html>