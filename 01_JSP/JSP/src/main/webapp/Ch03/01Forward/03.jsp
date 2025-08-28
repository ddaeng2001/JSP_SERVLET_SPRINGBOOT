<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	String username = request.getParameter("username");
	String password = request.getParameter("password");

	//Attribute를 추가해서 request이동을 하게되면 request내용이 초기화되지 않고 내용을 그대로 간직하면서 04.jsp로 이동함
	request.setAttribute("C03","C03_value");
	
	//forwarding
	//02.jsp에서 03.jsp로 이동시킴 원래라면 이 코드를 처리 후 FN로 이동시켜야함
	//username과 password를 그대로 이동시킴 == request내용이 유지
	//url의 경로는 기존의 02번으로 요청을 하지만 실제로는 많은 파일을 건너뛸 수 있음
	//내가 지정된 방향으로 바뀜
	request.getRequestDispatcher("./04.jsp").forward(request,response);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- FN에 보여주지 않고 3번에서 4번으로 -->
	<h1>03.JSP PAGE</h1>
	USERNAME : <%=username %><br/>
	PASSWORD : <%=password %><br/> 
	C02_VALUE : ${C02}<br/> <!-- 02.jsp request 내의 attribute를 바로 꺼내서 확인 가능 -->
	
</body>
</html>