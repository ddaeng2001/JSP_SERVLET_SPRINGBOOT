<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
					//01에서 request한 값을 username으로 받아서 백엔드에 저장시켜놨다가 실행시킴
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	//Attribute를 추가해서 request이동을 하게되면 request내용이 초기화되지 않고 내용을 그대로 간직하면서 03.jsp로 이동함
	request.setAttribute("C02","C02_value"); //파라미터형이 아닌 내장객체형으로 
	
	//forwarding
	//02.jsp에서 03.jsp로 이동시킴 원래라면 이 코드를 처리 후 FN로 이동시켜야함
	//username과 password를 그대로 이동시킴 == request내용이 유지
	//url의 경로는 기존의 02번으로 요청을 하지만 실제로는 많은 파일을 건너뛸 수 있음
	//내가 지정된 방향으로 바뀜
	request.getRequestDispatcher("./03.jsp").forward(request,response); //forwarding코드임!
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 아래의 코드를 실행하지 않고 점프에서 3번파일로 이동시킴 -->
	<h1>02.JSP PAGE</h1>
	USERNAME : <%=username %><br/>
	PASSWORD : <%=password %><br/> 
	
</body>
</html>