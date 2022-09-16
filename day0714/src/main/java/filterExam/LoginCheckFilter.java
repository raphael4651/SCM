package filterExam;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCheckFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("init() 메서드 실행");
	}

	@Override
	public void doFilter(
			ServletRequest request,
			ServletResponse response, 
			FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest httpRequest =
					(HttpServletRequest)request;
		
		HttpServletResponse httpResponse = 
					(HttpServletResponse)response;
		
		HttpSession session = 
				httpRequest.getSession();
		
		//setAttribute메서드를 이용하여
		//지정한 userID 세션값을 가져온다.
		String id = 
			(String)session.getAttribute("userID");

		
		if(id == null || id.length() == 0) {
			httpResponse.sendRedirect("http://localhost:8080/day0714/loginForm.jsp");
		}else {//정상 로그인
			httpResponse.sendRedirect("http://localhost:8080/day0714/login_success.jsp");
		}
		
		chain.doFilter(request,response);
		
		
	}
	
	
	@Override
	public void destroy() {
		System.out.println("필터 소멸....");
	}

}
