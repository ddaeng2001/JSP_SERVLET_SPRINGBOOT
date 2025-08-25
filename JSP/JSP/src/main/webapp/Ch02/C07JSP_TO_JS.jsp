<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- BN 코드를 FN로 던져주는 것  -->
    
<!--  BN코드 (첫번째로 실행된 후 FN에 결과물이 도출됨) -->

<% /* --> Servlet파일 내로 변환  == 지역변수가 선언되는 것 -> 이것을 JS로 가져올 것임 */
	String msg1 = "HELLO WORLD1";
	String msg2 = "HELLO WORLD2";
	
	//특정스코프(ex>request)안에 속성과 값을 넣어주면 EL표현식으로 접근 가능
	//스코프 : pageContext, request, session, application : 특정한 주기에만 동작하는 객체
	// 	    : 특정한 상황동안에만 값을 유지하는 객체
	request.setAttribute("msg3", "HELLO WORLD3");
	//요청하는 동안(1번) 속성을 꺼내옴
	request.setAttribute("msg4", "HELLO WORLD4");
	//request 내장 객체 내에 속성 추가 가능
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<script>
	
		/* 표현식으로 받기 */
		const m1 = '<%=msg1%>' 
		/* 문자열로 표시시킬려면 ""나 ''로 감싸줘야함 */
		const m2 = '<%=msg2%>'
		
		/* EL 표현식으로 받기 cf)보간법 */
		const m3 = '${msg3}'

		/* JS의 보간법과 EL표현식 헷갈리지 않기 */
		const m4 = `${}` 
		
		console.log(m1);
		console.log(m2);
		console.log(m3);
	</script>

</body>
</html>