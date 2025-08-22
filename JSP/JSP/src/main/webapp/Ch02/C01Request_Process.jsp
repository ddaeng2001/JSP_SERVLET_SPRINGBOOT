<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- html에서 전달하는 내용들을 받을 준비 -->
 	<!-- 백엔드 코드 -->
 <% 	
 	/*  
		request 내장객체 : 요청정보값 저장(Http Request Protocol의 구조 형태) - 따로 정리할 예정
		외부로부터 요청이 들어왔을 때 서버에서는 request라는 이름으로 보관함 : 사용자의 요청에 대한 정보를 담고 있음
 	*/
 					//요청했던 순간에만 request에 저장되고 새로운 요청이 들어오면 초기화됨
 					//request 내장객체를 이용해서 getParameter 요청하는 파라미터를 꺼내올 수 O
 	String username = request.getParameter("username");
 					 //get에서 던지는 파라미터들이 request에 보관되고 getParameter를 통해 필요한 것을 꺼내옴
 	String password = request.getParameter("password");
 	String bgColor = request.getParameter("bgcolor");
 	System.out.printf("%s %s %s \n", username, password, bgColor);
 
 
 %> 
    
    
    
    
<!--  요청했던 Clinet의 브라우저에서 확인할 수 있는 부분-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color : <%=bgColor%>">
	username : <%=username %><br/>
	password : <%=password %><br/>
	bgcolor : <%=bgColor %><br/>

</body>
</html>