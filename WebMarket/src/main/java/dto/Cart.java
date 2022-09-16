package dto;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dto.Product;

public class Cart {

	public void update(HttpServletRequest request,String pcode,int qty) {
		
		HttpSession session = request.getSession(true);

		
		ArrayList<Product> product = (ArrayList<Product>)session.getAttribute("cartList");
		
		for(int i=0;i<product.size();i++) {
			if(product.get(i).getProductId().equals(pcode)) {
   			   product.get(i).setQuantity(qty);
			   break;
			}
		}
		
		
	}
	
}