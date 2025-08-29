package Test;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import Servlet.DbUtils;

class DataSourceTests { //단위 테스트에서 context나 web을 감지를 하지 못해서 오류가 나옴 -> xml을 테스트에다 추가해줘야 resource탐지가능

	@Test
	void t1() throws Exception {
		DbUtils.conn(); //conn이 문제 없이 동작을 했다면 
	}
	
//	@Test
//	void t2() {
//	}
//	
//	@Test
//	void t3() {
//	}

}
