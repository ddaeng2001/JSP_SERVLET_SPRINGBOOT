<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JOIN PAGE</h1>
					<!-- 프로젝트 경로를 가져올 때 사용되는 값으로 프로젝트 이름이 바뀌어도 pageContext가 인식하고 있는 이름을 그대로 받아옴-->
	<form action="${pageContext.request.contextPath}/join.do" method="post"> 
											<!-- /join.do만 삽입 시 -->
											<!-- 경로 문제 발생  : 프로젝트 경로가 빠져있음(02_SERVLET_INIT)-->
											<!-- 직접 삽입도 가능하지만 일일히 다 하기엔 바뀔 때마다 해야해서 번거로움  -->
		<div>
			<label>계정명 : </label><span> ${username_msg}</span><br/>
			<input name="username" /><br/>
		</div>
		
		<div>
			<label>패스워드 : </label><span>${password_msg}</span><br/>
		<input type="password" name="password" />
		</div>
		
		<div>
			<button>회원가입</button>
		</div>
		
	</form>
</body>
</html>