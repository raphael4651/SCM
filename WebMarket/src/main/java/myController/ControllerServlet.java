package myController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LoginBean;

public class ControllerServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=utf-8");
		
		String id = req.getParameter("id");
		String password = req.getParameter("passwd");
		
		//인스턴스 생성
		LoginBean bean = new LoginBean();
		
		//입력화면에서 입력받은 아이디,비밀번호를
		//LoginBean 클래스의 필드에 대입
		bean.setId(id);
		bean.setPassword(password);
		
		//속성 생성
		req.setAttribute("bean",bean);
		
		//입력받은 아이디 값이 admin이면 true
		//아니면 false 리턴
		boolean status = bean.validate();
		//RequestDispatcher?
		//클라이언트의 요청처리를 하거나 처리된 결과를
		//받아오는 기능을 함
		if(status) {
			RequestDispatcher rd = req.getRequestDispatcher("mvc_success.jsp");
			//제어권이 넘어간다.
			rd.forward(req,resp);
		}else {
			RequestDispatcher rd = req.getRequestDispatcher("mvc_error.jsp");
			rd.forward(req,resp);
		}
		
	}
	
}