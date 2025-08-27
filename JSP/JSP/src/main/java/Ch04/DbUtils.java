package Ch04;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Ch02.UserDto;

public class DbUtils {
	//속성(DB 연결관련된 멤버)
	//DB CONN DATA
	private static String id = "root";
	private static String pw = "1234";
	private static String url = "jdbc:mysql://localhost:3306/opendatadb";
	
	//JDBC참조변수
	private static Connection conn = null; // DBMS 의 특정 DB와 연결되는 객체
	private static PreparedStatement pstmt = null; // SQL Query 전송용 객체
	private static ResultSet rs = null; // Select 결과물 담을 객체
	
	//기능
	public static void conn() throws Exception
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Driver Loading Success...");
		conn = DriverManager.getConnection(url,id,pw);
		System.out.println("DB CONNECTED...");
	}
	public static void disConn(Connection conn) throws Exception {
		conn.close();
	}
	public static void disConn(Connection conn,PreparedStatement pstmt) throws Exception {
		pstmt.close();
		conn.close();
	}
	public static void disConn(Connection conn,PreparedStatement pstmt,ResultSet rs) throws Exception {
		rs.close();
		pstmt.close();
		conn.close();
	}
	
	
	public static int insertUser(UserDto userDto) throws Exception 
	{
		pstmt = conn.prepareStatement("insert into tbl_user values(?,?,?,?,?,?)");
		pstmt.setString(1,userDto.getUserid());
		pstmt.setString(2,userDto.getPassword());
		pstmt.setString(3,userDto.getUsername());
		pstmt.setString(4,userDto.getZipcode());
		pstmt.setString(5,userDto.getAddr1());
		pstmt.setString(6,userDto.getAddr2());
		
		int result = pstmt.executeUpdate();
		
		return result;
	}

	
	public static UserDto selectOne(String username) throws Exception{
		
		return null;
	}
	


}
