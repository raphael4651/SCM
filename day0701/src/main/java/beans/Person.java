package beans;

public class Person {
	
	//필드(=멤버변수)
	//접근제한자 private 정보은닉(캡슐화)
	//getter/setter 메서드로만 접근 허용
	private int id = 20181004;
	private String name = "홍길순";
	
	//기본생성자
	public Person() {
		
	}
	
	//get 메서드는 필드의 값을 가져온다.
	public int getId() {
		return id;
	}
	//set 메서드는 값을 필드에 대입한다.
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
