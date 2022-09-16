package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {

	//배열의 단점을 극복하기 위해 ArrayList 사용
	private ArrayList<Product> listOfProducts 
				= new ArrayList<Product>();
	
	private static ProductRepository instance 
	            = new ProductRepository();
	
	//싱글톤패턴(SingleTon Pattern)?
	//클래스가 최초 한번만 인스턴스를 생성한후
	//다른클래스에서 new 연산자를 통해 메모리 낭비
	//를 방지하도록 static으로 선언하여 다른 클래스
	//에서는 공유하여 사용하도록 하는 기법
	public static ProductRepository 
	             getInstance() {
		return instance;
	}
             			
	
	//page139 코딩
	//상품 전체 리스트를 가져오는 메서드
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	
	//p173 코딩
	//getProductById() 메서드는 특정상품코드에
	//대한 내역을 검색하여 리턴하는 메서드
	//메서드의 리턴타입:Product
	//매개변수는 상품코드
	public Product getProductById(
						String productId) {
		
		Product productById = null;
		
		for(int i=0;i<listOfProducts.size();i++) {
			
			//get 메서드는 ArrayList의 
			//특정 위치에 있는 상품정보를 가져오는
			//메서드
			Product product = 
					listOfProducts.get(i);
			
			//현재 위치의 상품정보가 있고
			//현재 위치의 상품코드가 있고
			//현재 위치의 상품코드와 매개변수 상품코드
			//와 일치하면 그때 상품정보를 변수에 대입
			if(product != null && 
    		   product.getProductId() != null &&
    		   product.getProductId().equals(productId)){
				
			   productById = product;
			   break;

			}
			
		}
		
		return productById;
	}
	
	//p206
	//매개변수로 Product 형태의 변수를 입력받아
	//ArrayList에 추가하는 메서드
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}

}






