<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!--  백엔드로 지시할 때 쓰는 것 --> 
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 
선언문(서블릿으로 변환되는 자바파일의 속성/기능을 추가) : 자바파일(서블릿)이 만들어졌을 때 자바 파일 내 클래스 안의 속성이나 멤버변수/함수를 지정할 때 사용하는 것
 -->
<%! //만들어진 자바 파일에 속성이나 기능을 추가할 때 선언문 사용 - 서블릿 파일이 만들어진 후에는 이 내용/기능들이 유지가 됨!

	String name = "HONG GIL DONG";
	public String testFunc(){
		System.out.println("선언문 함수 테스트!");
		return "name: " + name;
	} /* 백엔드로 파일이 먼저 처리 후 프론트로 전달됨 */
	  /* 백엔드 코드는 FN에서 볼 수 없음 결과만 확인 가능 */

%>
<!-- 
	표현식(서블릿 파일(JAVA 파일) 안의 값을 FN로 전달할 때 사용) : 멤버 값을 가져올 때 사용함
 --> <!--섭즐릿에 저장된 여러가지 함수, 기능, 값들을 가져올 때 사용  -->
 
 NAME : <%=name %> <br>
 testFunc : <%=testFunc() %><br>

</body>
</html>