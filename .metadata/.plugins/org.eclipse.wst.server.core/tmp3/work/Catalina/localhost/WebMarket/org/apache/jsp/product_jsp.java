/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.64
 * Generated at: 2022-08-05 03:21:48 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class product_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/dbconn.jsp", Long.valueOf(1658379408000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			"exceptionNoProductId.jsp", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	");

		Connection conn = null;
	
		try{
			String url = "jdbc:mysql://localhost:3307/WebMarketDB?serverTimezone=Asia/Seoul";
			String user = "shop";
			String password = "shop1234";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn = DriverManager.getConnection(url,user,password);
			
		}catch(SQLException e){
			out.println("데이터베이스 연결 실패<br>");
			out.println("SQLException:" + e.getMessage());
		}
	
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("   \r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>상품상세정보</title>\r\n");
      out.write("<script>\r\n");
      out.write("	function addToCart(){\r\n");
      out.write("		if(confirm(\"상품을 장바구니에 추가하시겠습니까?\")){\r\n");
      out.write("			document.addForm.submit();\r\n");
      out.write("		}else{\r\n");
      out.write("			document.addForm.reset();\r\n");
      out.write("		}\r\n");
      out.write("	}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("	");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "menu.jsp", out, false);
      out.write("\r\n");
      out.write("	\r\n");
      out.write("	<div class=\"jumbotron\">\r\n");
      out.write("		<div class=\"container\">\r\n");
      out.write("			<h1 class=\"display-3\">상품 정보</h1>\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("	\r\n");
      out.write("	");

		//상세보기 버튼 클릭시 상품코드를 가져온다.
		String id = request.getParameter("id");
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from product where p_id = ?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,id);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()){
		
	
	
      out.write("\r\n");
      out.write("	\r\n");
      out.write("	<div class=\"container\">\r\n");
      out.write("		<div class=\"row\">\r\n");
      out.write("			");
      out.write("\r\n");
      out.write("			<div class=\"col-md-5\">\r\n");
      out.write("				<img src=\"./resources/images/");
      out.print(rs.getString("p_fileName"));
      out.write("\" style=\"width:100%\">\r\n");
      out.write("			</div>\r\n");
      out.write("			<div class=\"col-md-6\">\r\n");
      out.write("				<h3>");
      out.print(rs.getString("p_name"));
      out.write("</h3>\r\n");
      out.write("				<p>");
      out.print(rs.getString("p_description"));
      out.write("\r\n");
      out.write("				<p>\r\n");
      out.write("				<b>상품코드:</b>\r\n");
      out.write("				<span class=\"badge badge-danger\">\r\n");
      out.write("					");
      out.print(rs.getString("p_id"));
      out.write("\r\n");
      out.write("				</span>\r\n");
      out.write("				\r\n");
      out.write("				<p><b>제조사</b>:");
      out.print(rs.getString("p_manufacturer"));
      out.write("\r\n");
      out.write("				<p><b>분류</b>:");
      out.print(rs.getString("p_category"));
      out.write("\r\n");
      out.write("				<p><b>재고수</b>:");
      out.print(rs.getLong("p_unitsInStock"));
      out.write("\r\n");
      out.write("				<h4>");
      out.print(rs.getInt("p_unitPrice"));
      out.write("원</h4>\r\n");
      out.write("				<p>\r\n");
      out.write("				<form name=\"addForm\" \r\n");
      out.write("					  action=\"./addCart.jsp?id=");
      out.print(rs.getString("p_id"));
      out.write("\"\r\n");
      out.write("					  method=\"post\">\r\n");
      out.write("				\r\n");
      out.write("					<a href=\"#\" class=\"btn btn-info\" onclick=\"addToCart()\">상품주문&raquo;</a>\r\n");
      out.write("					<a href=\"./cart.jsp\" class=\"btn btn-warning\">장바구니&raquo;</a>\r\n");
      out.write("					<a href=\"products.jsp\" class=\"btn btn-info\">상품목록&raquo;</a>\r\n");
      out.write("				</form>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("	");

		}
	
      out.write('\r');
      out.write('\n');
      out.write('	');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}