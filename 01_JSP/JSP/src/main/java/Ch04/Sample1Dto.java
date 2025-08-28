package Ch04;

public class Sample1Dto {
	private String no;
	private String col1;
	private String col2;
	private String col3;
	
	//디폴트 생성자
	public Sample1Dto(){}
	
	//모든인자 생성자
	public Sample1Dto(String no, String col1, String col2, String col3) {
		super();
		this.no = no;
		this.col1 = col1;
		this.col2 = col2;
		this.col3 = col3;
	}

	
	//getter and setter
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getCol1() {
		return col1;
	}

	public void setCol1(String col1) {
		this.col1 = col1;
	}

	public String getCol2() {
		return col2;
	}

	public void setCol2(String col2) {
		this.col2 = col2;
	}

	public String getCol3() {
		return col3;
	}

	public void setCol3(String col3) {
		this.col3 = col3;
	}

	
	//toString
	@Override
	public String toString() {
		return "Sample1Dto [no=" + no + ", col1=" + col1 + ", col2=" + col2 + ", col3=" + col3 + "]";
	}

	

	
	
}
