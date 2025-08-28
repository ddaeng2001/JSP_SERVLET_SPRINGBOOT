<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@page import="java.io.*" %>
<%
	//response.sendRedirect("./02Request.jsp");


	//response.sendError(HttpServletResponse.SC_REQUEST_TIMEOUT);
	
	//404 Error
	//response.sendError(HttpServletResponse.SC_NOT_FOUND,"해당 페이지를 찾을수가 없습니다");
	
	//403 Error
	//response.sendError(HttpServletResponse.SC_FORBIDDEN,"접근금지됨!");
	
	//5xx 에러 
	//response.sendError(HttpServletResponse.SC_BAD_GATEWAY,"서버 장애 발생!");
	
	
	/* 새로고침 */
	/*response.setIntHeader("Refresh",3);*/ /* 3초마다 새로고침  */
	
	/* OutStream 추출 ★*/					/*JSP는 Servlet으로 바뀜 서버에서 보내줄 브라우저 방향으로 내용을 전달할 stream 제공*/
/* 	ServletOutputStream bout = response.getOutputStream(); /*현재 서버 위치에서 클라이언트 브라우저에서 내용 전달 시 OutputStream사용*/
											//ByteStream
	/*bout.write('a'); //아스키코드 : 97
	bout.write(98); //b
	bout.flush();
	bout.close();*/
	/*★response에서 OutputStream()을 꺼내올 수 있음!★*/
	
/* 	PrintWriter o =  response.getWriter();
	o.write("<h1>HELLO WORLD</h1>"); */
	

	
	
%>
	<%@page import="java.util.*" %>
	<%=new Date() %>


</body>
</html>