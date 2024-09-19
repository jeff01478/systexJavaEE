<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../style/myStyle.css" rel="stylesheet"/>
</head>
<body>
	<h2>Dump JSP</h2>
	<table border="1" style="margin: auto">
		<% 
			for(int i = 1; i<10; i++) {
				out.println("<tr>");
				for(int j = 1; j<10; j++) {
					out.println("<td>" + i + "x" + j + "=" + i*j + "</td>");
				}
				out.println("</tr>");
			} 
		%>
	</table>
	<% Enumeration<String> headerNames = request.getHeaderNames(); %>
	<table border="1" style="margin: auto">
		<% 
			while(headerNames.hasMoreElements()) {
				String headerName = headerNames.nextElement();
				String headerValue = request.getHeader(headerName);
		%>
		
		<tr>
			<td><%= headerName %></td><td><%= headerValue %></td>
		</tr>
		
		<% } %>
	</table>
	<img alt="" src="../image/迅龍.png">
	<a href="../.">Go Back</a>
</body>
</html>