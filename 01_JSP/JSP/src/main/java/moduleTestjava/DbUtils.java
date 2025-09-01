package moduleTestjava;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;




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
		//드라이브 클래스 메모리 공간 적재
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Driver Loading Success...");
		//Connection conn 멤버에 Connection 객체 연결
		conn = DriverManager.getConnection(url,id,pw);
		System.out.println("DB CONNECTED...");
	}

	public static void disConn() throws Exception {
		//rs / pstmt / conn close 처리
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}
	
	
	public static int insertMember(MemberDto dto) throws Exception 
	{
		pstmt = conn.prepareStatement("insert into tbl_member values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		pstmt.setString(1, dto.getUserid());
		pstmt.setString(2, dto.getPassword());
		pstmt.setString(3, dto.getRePassword());
		pstmt.setString(4, dto.getUsername());
		pstmt.setString(5, dto.getZipcode());
		pstmt.setString(6, dto.getAddr1());
		pstmt.setString(7, dto.getAddr2());
		pstmt.setString(8, dto.getPhone1());
		pstmt.setString(9, dto.getPhone2());
		pstmt.setString(10, dto.getPhone3());
		pstmt.setString(11, dto.getTel1());
		pstmt.setString(12, dto.getTel2());
		pstmt.setString(13, dto.getTel3());
		pstmt.setString(14, dto.getEmail());
		pstmt.setString(15, dto.getYear());
		pstmt.setString(16, dto.getMonth());
		pstmt.setString(17, dto.getDay());
		int result = pstmt.executeUpdate();
		
		return result;

	}
	public static MemberDto selectMember(String userid) throws Exception{
		
		pstmt = conn.prepareStatement("select * from tbl_member where userid=?");
		pstmt.setString(1,userid);
		rs = pstmt.executeQuery();
		MemberDto dto = null;
		if(rs != null) {
			if(rs.next()) {
				dto = new MemberDto();
				dto.setUserid(rs.getString("userid"));
				dto.setPassword(rs.getString("password"));
				dto.setRePassword(rs.getString("rePassword"));
				dto.setUsername(rs.getString("username"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddr1(rs.getString("addr1"));
				dto.setAddr2(rs.getString("addr2"));
				dto.setPhone1(rs.getString("phone1"));
				dto.setPhone2(rs.getString("phone2"));
				dto.setPhone3(rs.getString("phone3"));
				dto.setTel1(rs.getString("tel1"));
				dto.setTel2(rs.getString("tel2"));
				dto.setTel3(rs.getString("tel3"));
				dto.setEmail(rs.getString("email"));
				dto.setYear(rs.getString("year"));
				dto.setMonth(rs.getString("month"));
				dto.setDay(rs.getString("day"));
			}
		
		}
		//tbl_member 에 userid 와 일치하는 데이터 받아와 MemberDto로 반환  
		return dto;
	}
	
	public static void TxStart() throws Exception{
		if(conn!=null)
			conn.setAutoCommit(false);
	}
	public static void TxEnd() throws Exception {
		if(conn!=null)
			conn.commit();
	}
	public static void RollBack() throws Exception {
		if(conn!=null)
			conn.rollback();	
	}
	
}