<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
				
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	request.setAttribute("C02","C02_value"); 
	//redirect
	response.sendRedirect("./03.jsp");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>03.JSP PAGE</h1>

	
</body>
</html>