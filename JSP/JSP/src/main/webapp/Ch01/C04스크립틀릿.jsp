<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %> <!-- 페이지 지시자 삽입  -->
<%
	/* java.util.Scanner sc = new java.util.Scanner(System.in); //단축키 안 먹음 */
	
	/* 백엔드 코드가 서블릿 파일로 전달됨  */
	Scanner sc = new Scanner(System.in);
	System.out.print("행 열 입력 : ");
	int row = sc.nextInt();
	int col = sc.nextInt();
	System.out.println("행: " + row + "열 : " + col);
	sc.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
		td{border : 1px solid;margin : 10px;}
	</style>
</head>
<body>
	<table>
		<tbody>
		<!-- row와 column만큼 만들기  -->
		<% //스크립트 형태로 제공하기에 for 문분할이 가능함
		
			//tr 반복 태그(입력받은 row만큼 반복)
			for(int i=0;i<row;i++)
			{
		%>
			<tr>
				<!-- 백엔드에서 처리함  -->
				<!--  개발자 모드로 확인하면 tr이 5개 삽입되어 있음-->
			<%
				for(int j=0;j<col;j++)
		
				
			%>
				<td><%=i+" : " +j %></td>
			<%
				}
			%>
			</tr>
		<%
		
		
		%>
		</tbody>
	
	</table>
</body>
</html>