package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class AuthenFilter implements Filter {

	//JSP 컨테이너에서 필터 초기화 
	//초기화시 인스턴스를 생성하여 한번만 호출
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter01 초기화...");
	}
	

	//클라이언트의 요청이 있을때마다 호출되는 메서드
	@Override
	public void doFilter(
			ServletRequest request, 
			ServletResponse response, 
			FilterChain filterChain)
			throws IOException, ServletException {
		
		System.out.println("Filter01.jsp 실행");
		
		String name = request.getParameter("name");
		
		if(name == null || name.equals("")) {
			response.setCharacterEncoding("UTF-8");
			//ContentType 선언
			response.setContentType("text/html;charset=UTF-8");
			
			PrintWriter writer = response.getWriter();
			
			String message = "입력된 name 값은 null입니다!";
			
			writer.println(message);
			
			return;
		}
		
		filterChain.doFilter(request,response);
		
	}
	
	//필터 종료시 호출되는 메서드
	@Override
	public void destroy() {
		System.out.println("Filter01 해제...");
	}

}
