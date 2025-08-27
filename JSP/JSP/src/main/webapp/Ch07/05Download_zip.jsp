<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.io.*,java.util.zip.*" %>
<%

	//Dir경로 생성
	String dirPath = pageContext.getServletContext().getRealPath("/")+"Ch07\\files\\";
	System.out.println("dirPath : " + dirPath);
	
	File dir = new File(dirPath);
	File fileList[] = dir.listFiles(); //폴더 내에 있는 모든 파일들 내려받기
	
	//폴더 내에 있는 파일 확인
	for(File f : fileList)
		System.out.println(f);

	try{
		
		FileInputStream in = null;
		ZipEntry zipEntry = null;

		//내장객체(Out)정리
		out.clear();					//response outStream을 닫고 버퍼를 비움
		out = pageContext.pushBody(); 	//현재페이지에 Body 연결
		
		//OutStream 가져오기(browser방향으로 response에서 꺼내주기)
		ServletOutputStream bout = response.getOutputStream();
		
		//보조 스트림 추가(여러 파일들을 zip파일로 묶기위한)
		ZipOutputStream zout = new ZipOutputStream(bout);
		
		//response의 Header변경(중요!)
		response.setHeader("Content-Type","application/octet-stream;charset-utf-8");
		response.setHeader("Content-Disposition","attachment; filename=ALLFILES.zip"); 
		
		for(File file : fileList){
			
			in = new FileInputStream(file);	//기본 InputStream 연결 - 개별파일에 대한
			zipEntry = new ZipEntry(file.getName().toString());// ZipEntry객체 생성
			
			zout.putNextEntry(zipEntry);
			
			//바이너리 데이터 단위로 전달
			while(true){
				int data = in.read();
				if(data==-1)
					break;
				zout.write((byte)data);
			}
			zout.closeEntry();
			in.close();
		}
		zout.flush();
		zout.close();
		bout.close();

		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
%>
