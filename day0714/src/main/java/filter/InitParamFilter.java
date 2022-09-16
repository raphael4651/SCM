package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class InitParamFilter 
					implements Filter {

	//필터 설정을 정의한 객체
	private FilterConfig filterConfig = null;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter02 초기화...");
		this.filterConfig = filterConfig;
	}

	@Override
	public void doFilter(
			ServletRequest request, 
			ServletResponse response, 
			FilterChain filterChain)
			throws IOException, ServletException {
		
		System.out.println("Filter02.jsp 실행");
		
		//로그인 화면에서 입력받은 값을 변수에 대입
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		//web.xml 파일에 있는 초기값을 가져온다.
		//web.xml 파일에서
		//init-param 태그에 있는 값을 가져온다.
		String param1 = 
				filterConfig.getInitParameter("param1");
		String param2 = 
				filterConfig.getInitParameter("param2");
		
		String message;
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter writer = response.getWriter();
		
		if(id.equals(param1) && passwd.equals(param2)) {
			message = "로그인 성공";
		}else {
			message = "로그인 실패";
		}
		
		writer.println(message);
		
		//다음 필터를 실행한다.
		//만약 다음 필터가 존재하지 않으면
		//내부적으로 Servlet에 있는 service()
		//메서드가 실행된다.
		filterChain.doFilter(request,response);
		
	}
	
	@Override
	public void destroy() {
		System.out.println("Filter02 해제...");
	}

}
