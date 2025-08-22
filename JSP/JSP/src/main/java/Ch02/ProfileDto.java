package Ch02;

public class ProfileDto {
	private String username;
	private String age;
	private String addr;
	
	//디폴트 생성자
	public ProfileDto(){}
	
	//모든 인자 생성자
	public ProfileDto(String username, String age, String addr) {
		super();
		this.username = username;
		this.age = age;
		this.addr = addr;
	}
	
	//getter and setter
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	
	//toString();
	@Override
	public String toString() {
		return "ProfileDto [username=" + username + ", age=" + age + ", addr=" + addr + "]";
	}
	
	
	
	
	
	
	
}
