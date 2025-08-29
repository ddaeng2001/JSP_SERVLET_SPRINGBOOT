package Filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class UTF8_EncodingFilter implements Filter { //확장자가 do인 모든 경로에 한해서 유니코드 필터가 동작하게 됨

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		
		//웹처리를 위한 클래스(HttpsSservletRequest에서 downcasting을 해야 웹 처리 요청을 받을 수 있으나 지금은 아님) 아님
		req.setCharacterEncoding("UTF-8");
		System.out.println("[FILTER]  UTF8_EncodingFilter START..");
		chain.doFilter(req, resp);
		
		//response를 보낼때도 유니코드 문자 문서로 보내기 
		resp.setContentType("text/html; charset=UTF-8");
		System.out.println("[FILTER]  UTF8_EncodingFilter END..");
		
		//----------xml 파일 생성 : xml을 통해 전 범위로 적용하기 위해----------------------
	}

}
