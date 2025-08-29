package Servlet;

public class UserDto { //초안의 Dto는 테이블에 있는 컬럼과 동일하게 구성
	private String username;
	private String password;
	
	//생성자 - 2개
	public UserDto(){}

	public UserDto(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	//getter and setter
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	//toString
	@Override
	public String toString() {
		return "UserDto [username=" + username + ", password=" + password + "]";
	}
	
	
	
	
	
	
}
