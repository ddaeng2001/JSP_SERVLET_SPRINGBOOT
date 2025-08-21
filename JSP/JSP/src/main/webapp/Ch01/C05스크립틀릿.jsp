<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--백엔드 코드  -->
<%@ page import="java.util.*" %>

<%
	System.out.println("단수 입력 : ");
	Scanner sc = new Scanner(System.in);
	int dan = sc.nextInt();
%>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<summary><%=dan %> 단 </summary>
		
		<tbody>
		<%
		for(int i=1;i<10;i++)
		{
		%>
		<tr>
			<td><%=dan %>></td>
			<td>x</td>
			<td><%=i %></td>
			<td>=</td>
			<td><%=dan*i %>></td>
		</tr>
		<%
		}
		%>
		
		</tbody>
	
	</table>
	
	
	
	<!--
		단수 입력받아 해당 구구단을 찍어보세요 (Table로 만드세요 - 스크립틀릿)
	  -->
</body>
</html>