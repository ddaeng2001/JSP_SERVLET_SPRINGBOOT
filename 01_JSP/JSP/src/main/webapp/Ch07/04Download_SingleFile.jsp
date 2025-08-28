<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.*" %>
		<!-- in/out Stream사용을 위해서  : 예외처리 필요함-->
		
<%													//C드라이버 기준 실제경로받기
	String dirPath = pageContext.getServletContext().getRealPath("/")+"Ch07\\files\\";
																		//실제 디렉토리 경로
	System.out.println("dirPath: " +dirPath); //Servlet의 실제 경로를 /(최상위 폴더인 C드라이버) 기준으로 받기
	
	//servlet이라 예외처리 필요
	try{
		//INPUTSTREAM
		InputStream fin = new FileInputStream(dirPath+"test1.ppt"); //파일을 byte로 JAVA로 받아와서
												//디렉토리 경로에서 파일의 경로를 그대로
												
		//OUTSTREAM
		out.clear(); //기존의 out내장객체를 쓰지 않도록 함 - response outStream을 닫고 버퍼 초기화
		out=pageContext.pushBody(); //현재 위치에서 제공할 body부분을 out에 연결
									//현재 페이지의 Body에 out 연결
		ServletOutputStream bout = response.getOutputStream();
		
		//★★★Response Header Setting★★★ : 응답 시 browser에 어떤 식으로 하라 지시할 때 사용
									//: 응답헤더를 어떻게 처리할거냐에 따라서 문서로 처리할거냐 파일로 처리할거냐가 결정됨
													//octet설정 시 실행파일(binary 파일)이라 판단해서 다운로드 처리를 하려고 함
		response.setHeader("Content-Type","application/octet-stream;charset-utf-8"); //계속 다운로드하려고 시도
							//Content-Type : 마인타입 지정할 때 사용
							
		//다운로드 시 파일명 지정
		response.setHeader("Content-Disposition","attachment; filename=test1.ppt");
		
		//버퍼 형성
		byte [] buff = new byte[4096];
		
		while(true){
			int data = fin.read(buff);
							//read()를 그냥 쓰면 byte->binary형태로
			if(data==-1)
				break;
			bout.write(buff,0,data); //Integer형으로 받았기 때문에 byte로 형변환
			bout.flush();
		}
		bout.close();
		fin.close();
		
		
	}catch(Exception e){
		
	}
		








%>
				
