package Filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

//어디에 필터를 적용할건지 지정 
//@WebFilter("/index.do") //특정엔드포인트 & 모든 곳 설정 가능
//web.xml에 등록해서 Annotation은 주석처리

//프로젝트 기본 경로로 한 것이 아니라 엔드포인트까지 url에 작성해야 정상 작동!!

public class HomeFilter_2 implements Filter{

	//필터 처리에 사용되는 함수
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) 
																	//FilterChain : 필터 생성 시 chain형태로 연결시켜 쓸 수 있음
			throws IOException, ServletException {

		//Request가  Servlet으로 전달되기 전 코드를 chainFilter위에다 작성
		
		System.out.println("[FILTER] HOME FILTER_2 START..");
		chain.doFilter(req, resp); //체인이 연결되어있는동안에 req,resp를 공유해야함
	
		//--------위의 코드를 실행시킨 후 Servlet으로 Request 전달-------------------
		
		//Response가 Client로 전달되기 전
		System.out.println("[FILTER] HOME FILTER_2 END..");
	}

}
