<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error/error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%! int a = 100; %>
	<% int a = 500; %>
	a = <%= a/0 %><br/>
	CurrentTime Time is : <%= SimpleDateFormat.getInstance().format(new Date()) %><br/>
	<!-- HTML comment -->
	<%//java single Line comment %>
	<%-- JSP Comment --%>
	
	User-Agent: <%= request.getHeader("User-Agent") %><br/>
	User-Agent: <% out.println(request.getHeader("User-Agent"));  %><br/>
	User-Agent: ${ header["User-Agent"] }<br/>
	${ abc*123 }
</body>
</html>