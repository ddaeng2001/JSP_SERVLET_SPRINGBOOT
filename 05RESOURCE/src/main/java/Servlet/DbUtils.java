package Servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DbUtils { // Servlet과 db연결을 위한 작업

	// 속성(DB 연결관련된 멤버)
	// DB CONN DATA
	private static String id = "root";
	private static String pw = "1234";
	private static String url = "jdbc:mysql://localhost:3306/opendatadb";

	// JDBC참조변수
	private static Connection conn = null; // DBMS 의 특정 DB와 연결되는 객체
	private static PreparedStatement pstmt = null; // SQL Query 전송용 객체
	private static ResultSet rs = null; // Select 결과물 담을 객체

	// 기능
	public static void conn() throws Exception {
//		// 드라이브 클래스 메모리 공간 적재
//		Class.forName("com.mysql.cj.jdbc.Driver");
//		System.out.println("Driver Loading Success...");
//		// Connection conn 멤버에 Connection 객체 연결
//		conn = DriverManager.getConnection(url, id, pw);
//		System.out.println("DB CONNECTED...");
		
		
		//context에 있는 내용들을 꺼내오면 됨 - Servlet에서만 하고 스프링 부트에서는 자동으로 꺼내줌
		//Servlet이나 스프링부트에서는  ★★이름★★을 통해서 접근하기에 이름을 제대로 지정하는 것이 중요 for 제대로 된 연결
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env");
									  //Context 내용들을 꺼내 찾는 함수(전체 환경에 대한 Context꺼내기)
		
		DataSource dataSource = (DataSource)envContext.lookup("java:/comp/env");
		conn = dataSource.getConnection(); //Connection을 하나 꺼내서 위에서 만들어놓은 connection과 연결해주기
		System.out.println("Conn :  " + conn);
	}

	public static void disConn() throws Exception {
		// rs / pstmt / conn close 처리
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}

	public static int insertUser(String username, String password) throws Exception {
		pstmt = conn.prepareStatement("insert into tbl_user values(?,?,?,?,?,?)");
		pstmt.setString(1, username);
		pstmt.setString(2, password);
		pstmt.setString(3, "");
		pstmt.setString(4, "");
		pstmt.setString(5, "");
		pstmt.setString(6, "");
		int result = pstmt.executeUpdate();

		return result;

	}

	public static UserDto selectUser(String username) throws Exception {// username과 일치하는 name을 db로부터 받을 것
		
		pstmt = conn.prepareStatement("select * from tbl_user where userid=?");
		// db에서의 이름
		pstmt.setString(1, username); // userid가 pk이기 때문에 하나의 행만 출력될 예정
		rs = pstmt.executeQuery();
		UserDto dto = null;
		if (rs != null && rs.next()) {
			// rs.next() : 행간이동할 때 씀 즉, true라는 건 단건으로 user가 조회되었다면!
			dto = new UserDto(); //일치하다면 UserDto객체 반환
			dto.setUsername(rs.getString("username"));
										//컬럼명
			dto.setPassword(rs.getString("password"));
		}
		return dto; 
	}

}
