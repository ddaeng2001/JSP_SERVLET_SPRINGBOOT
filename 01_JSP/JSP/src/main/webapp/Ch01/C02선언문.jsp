<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	int n=0; //멤버 변수
	public int countUP() { //상태값 증가시키는 함수 생성
		n++;
		return n;
	}
%>

<!--Tomcat이 활성화된 상태이기에 브라우저와 상관없이 유지가 됨  -->
<!--  선언문으로 상태값을 만드는 동안에는 일정 시간동안 유지가됨 -->
<!-- Servlet이 활성화되는 동안에는 선언문으로 만들어진 상태값이 유지가 되나 영구적으로 저장하려면 DB에 저장해야함! -->

N : <%=countUP() %> <!-- 위의 결과 값 실행  -->
</body>
</html>
