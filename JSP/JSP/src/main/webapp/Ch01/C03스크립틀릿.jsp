<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 서브릿 파일 생성 시 멤버변수/함수가 아닌 서비스라고 하는 함수 안에 들어갈 코드를 지정할 때 스크립틀릿을 사용함 --> <!-- 주석 푸는 방법 : Ctrl+Alt+\ -->
<!-- 
	SCRIPTLET : JSP-> Servlet파일로 변환될 때 Servlet내의 Service함수 안에서 처리되는 로직
	Service 함수 내에서 동작하기 때문에 변수를 선언하는 경우에는 지역변수가 되고, 반복문/분기문 처리가 가능하다 - r : 함수 안이니까!
	하지만 함수를 벗어나면(끝나면) 지역변수는 소멸되기 때문에 요청시(ex 새로고침) 되면 상태값은(지역변수값) 초기화된다
 -->
 <% /* 이게 먼저 처리되고 처리된 서블릿 파일의 결과가   */
 	String str1 = "HELLO1"; //지역변수
 	String str2 = "HELLO2";
 	String str3 = str1 + str2;
 	int a = 0;
/*  	for(int i=0;i<10;i++){
 		a++;
 		System.out.println("i: " + i);
 		 
 	} */ /* 주석 해제 :   */
	a++; //서비스 함수가 매번 새로 호출되는 상태에서 1이 추가 되고 종료되고 다시 생성되기 때문에 a값이 증가하지 않음 
 %>
 <!-- 여기 FN로 출력되는 것  -->
str1 : <%=str1 %><br>
str2 : <%=str2 %><br>
str3 : <%=str3 %><br>
a 	 : <%=a %><br>

</body>
</html>