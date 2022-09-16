package filter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LogFileFilter implements Filter {

	PrintWriter writer;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
		//web.xml 파일에서 초기값을 읽어온다.
		String filename = 
			filterConfig.getInitParameter("filename");
		
		if(filename == null) {
			//강제로 예외 발생
			throw new ServletException("로그 파일의 이름을 찾을 수 없습니다.");
		}
		
		try {
			
			//PrintWriter?
			//문자단위 출력 보조스트림
			//FileWriter?
			//문자단위 출력 기반스트림
			//PrintWriter true?
			//autoFlush:버퍼의 내용을 자동으로 비움 설정
			writer = new PrintWriter(
						//true:append 추가모드
						new FileWriter(filename,true),true);
			
		}catch(IOException e) {
			throw new ServletException("로그 파일을 열 수 없습니다.");
		}
	}

	@Override
	public void doFilter(ServletRequest request, 
						 ServletResponse response, 
						 FilterChain filterChain)
			throws IOException, ServletException {
		
		//로그에 현재시간,클라이언트IP주소
		//문서형태를 로그파일에 저장
		writer.printf("현재일시:%s %n",getCurrentTime());
		
		String clientAddr = request.getRemoteAddr();
		writer.printf("클라이언트 주소:%s %n",clientAddr);
		
		//접근 url을 로그에 출력
		HttpServletRequest req;
		
		req = (HttpServletRequest)request;
		
		String url = req.getRequestURI();
		writer.printf("접근URL명:%s %n",url);
		
		filterChain.doFilter(request, response);
		
		String contentType = response.getContentType();
		writer.printf("문서 컨텐츠 유형:%s %n",contentType);
		
		writer.println("--------------------------------");
		
		
	}
	
	@Override
	public void destroy() {
		writer.close();
	}
	
	//현재시간을 밀리세컨드 초로 원하는 형태의
	//문자열로 출력하는 메서드
	private String getCurrentTime() {
		DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());
		
		return formatter.format(calendar.getTime());
	}

}
