package dto;

import java.io.Serializable;

//Serializable:인터페이스
//직렬화:객체의 상태를 바이트 스트림으로 변환하는데
//사용하는 프로세스로 객체를 파일로 저장하여 네트워크로
//전송하여 다른곳에서도 객체를 실행할 수 있는 기법
public class Product implements Serializable
		           

{

	//클래스 버전 관리
	//static final long : 상수 선언
	private static final long serialVersionUID = 1L;
	
	//상품 필드 선언
	private String productId;//상품아이디
	private String pname;//상품명
	private Integer unitPrice;//상품단가
	private String description;//상품설명
	private String manufacturer;//제조업체
	private String category;//분류
	private long unitsInStock;//재고수량
	private String condition;//상품상태
	
	//p239
	private String filename;
	
	//p438
	private int quantity;//장바구니에 담은 갯수
	
	//기본생성자
	public Product() {
		super();//Object 클래스의 기본생성자를 호출
	}
	
	//매개변수 3개 생성자
	//this:클래스 자신(Product)
	//오버로딩(Overloading)?
	//생성자 이름은 동일하고 매개변수 갯수,
	//순서,자료형태를 달리하여 선언할 수 있는 기법
	//오버라이딩(Overriding)?
	//부모클래스를 상속받아 자식클래스에서 부모클래스
	//에 선언된 메서드를 재정의하는 기법
	public Product(String productId,
			       String pname,
			       Integer unitPrice) {
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	
}







