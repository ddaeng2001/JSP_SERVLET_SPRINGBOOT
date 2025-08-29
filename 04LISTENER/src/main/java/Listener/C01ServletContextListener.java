package Listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class C01ServletContextListener implements ServletContextListener{ //ServletContext : 전역 설정 가능함

	//ServletContextListener로부터 받는
	
	//처음 동작 시의 초기값
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		//----
		System.out.println("[LISTENER] C01ServletContextListener..start...");
	}
	
	//자원제거
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		//내용이 수정되거나 하면 Servlet 전체가 꺼졌다가(end) 다시 실행됨(start)
		//이 파일뿐만 아니라 다른 파일의 Context 내용이 변경되어도 contextDestroyed가 움직임(Servlet 전역감지0
		System.out.println("[LISTENER] C01ServletContextListener..end...");
	}



	
	
}
