package Ch02;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class TestDto {
	private String username;
	private int age;
	private LocalDateTime date; //날짜
	
	//디폴트 생성자
	public TestDto(){}
	
	//모든인자
	public TestDto(String username, int age, LocalDateTime date) {
		super();
		this.username = username;
		this.age = age;
		this.date = date;
	}
	
	//getter and setter
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getAge() {
		return age;
	}

	public void setAge(String age) { //int형은 java에서 String으로 들어올 것이다(??)
		this.age = Integer.parseInt(age); //set함수에서 String으로 들어오는 데이터는 Integer로 parse해주기
	}

	public LocalDateTime getDate() {
		return date;
	}

//	public void setDate(LocalDateTime date) {
//		DateTimeFormatter fmtin = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");//폼에서는 이 포멧에 맞게 들어옴
//		
//		this.date = LocalDateTime.parse(date,fmtin);
//	} 오류가 일어나는 이유 :  <!--  age="10"은 String인데 원시타입으로 바뀌어지나 String으로 들어오는 데이터를 editor가 LocalDateTime를 자동으로 변환시켜주진 않음-->
	
	public void setStringtoDate(String date) {
		System.out.println("setStringtoDate : " + date);
		DateTimeFormatter fmtin = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:,mm");
		this.date = LocalDateTime.parse(date,fmtin);
	}

	//toString()
	@Override
	public String toString() {
		return "TestDto [username=" + username + ", age=" + age + ", date=" + date + "]";
	}
	
	
	
	

}
