package com.systex.view;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Enumeration;

/**
 * Servlet implementation class DumpServlet
 */
public class DumpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DumpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;");
		PrintWriter out = response.getWriter();
		String croot = request.getContextPath();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>DumpServlet</title>");
		out.println("<link href=\"" + croot + "/style/myStyle.css\" rel=\"stylesheet\"/>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2>DumpServlet</h2>");
		
		Enumeration<String> headerNames = request.getHeaderNames();
		
		out.println("<table border='1' style='margin:auto;width=70%'>");
		out.println("<thead><tr><th>Header Name</th><th>Header Value</th></tr></thead>");
		out.println("<tbody>");
		while(headerNames.hasMoreElements()) {
			String headerName = headerNames.nextElement();
			String headerVaule = request.getHeader(headerName);
			out.println("<tr><td>"
					+ headerName + "</td><td>"
					+ headerVaule + "</td></tr>");
		}
		out.println("</tbody>");
		out.println("</table>");
		
		out.println("<h2>接收表單上的資料</h2>");
		Enumeration<String> paramNames = request.getParameterNames();
		out.println("<table border='1' style='margin:auto;width=70%'>");
		out.println("<thead><tr><th>Header Name</th><th>Header Value</th></tr></thead>");
		out.println("<tbody>");
		while(paramNames.hasMoreElements()) {
			String paramName = paramNames.nextElement();
			String paramValue;
			if(paramName.equals("habit")) {
				paramValue = Arrays.toString(request.getParameterValues(paramName));
			} else {
				paramValue = request.getParameter(paramName);
			}
			out.println("<tr><td>"
					+ paramName + "</td><td>"
					+ paramValue + "</td></tr>");
		}
		out.println("</tbody>");
		out.println("</table>");
		out.println("<br/><a href='" + croot + "/'>Go Home</a>");
		out.println("</body>");
		out.println("</html>");
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
