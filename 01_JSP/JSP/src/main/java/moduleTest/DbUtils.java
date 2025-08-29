package moduleTest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DbUtils {
	//�Ӽ�(DB ������õ� ���)
	//DB CONN DATA
	private static String id = "root";
	private static String pw = "1234";
	private static String url = "jdbc:mysql://localhost:3306/opendatadb";

	//JDBC��������
	private static Connection conn = null; // DBMS �� Ư�� DB�� ����Ǵ� ��ü
	private static PreparedStatement pstmt = null; // SQL Query ���ۿ� ��ü
	private static ResultSet rs = null; // Select ����� ���� ��ü
	
	public static void conn() throws Exception
	{
		//����̺� Ŭ���� �޸� ���� ����
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Driver Loading Success...");
		//Connection conn ����� Connection ��ü ����
		conn = DriverManager.getConnection(url,id,pw);
		System.out.println("DB CONNECTED...");
	}
	
	public static void disConn() throws Exception {
		//rs / pstmt / conn close ó��
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}
	public static int insertMember(MemberDto memberDto) throws Exception 
	{
		pstmt = conn.prepareStatement("insert into tbl_user values(?,?,?,?,?,?)");
		pstmt.setString(1, userid);
		pstmt.setString(2, password);
		pstmt.setString(3, "");
		pstmt.setString(4, "");
		pstmt.setString(5, "");
		pstmt.setString(6, "");
		int result = pstmt.executeUpdate();
		
		return result;
	}
	public static MemberDto selectMember(String userid) throws Exception
	{
		pstmt = conn.prepareStatement("select * from tbl_user where userid=?");
		pstmt.setString(1, userid);
		rs = pstmt.executeQuery();
		MemberDto dto = null;
		if(rs!=null && rs.next()) {
			dto = new MemberDto();
			dto.setUsername(rs.getString("username"));
			dto.setPassword(rs.getString("password"));
		}
		
		return dto;
		
	}
	
}
