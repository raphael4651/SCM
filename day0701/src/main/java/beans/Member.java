package beans;

public class Member {
	
	//기본생성자 
	//생성자의 역할은 클래스 초기화
	public Member() {
		
	}
	
	
	//필드(=멤버변수) 선언
	//접근제한자 
	//public, default, private, protected
	//public:모든 클래스에게 접근허용
	//default:같은 패키지 내에 있는 클래스에게만 접근허용
	//private:직접적으로 접근 할 수 없고 get,set 메서드를 이용하여 접근 가능
	//protected:같은 패키지에 있는 클래스에게 접근허용, 자신을 상속받은 자식클래스는
	// 패키지가 다르더라도 접근허용
	
	//private 정보은닉(=캡슐화)
	private String id;
	private String passwd;
	private String name;
	private String phone;
	
	
	//get메서드는 필드값을 가져온다.
	public String getId() {
		return id;
	}
	//set메서드는 필드에 값을 대입 
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	
}
