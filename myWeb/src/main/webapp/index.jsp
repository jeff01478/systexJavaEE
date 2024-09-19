<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link href="style/myStyle.css" rel="stylesheet"/>
</head>
<body>
	<h1>Welcome To My Java EE Playground!!</h1>
	<p>Current Time is : <%= SimpleDateFormat.getInstance().format(new Date()) %></p>
	<p><a href="admin/hello.aspx">Hello GOOD</a>
</body>
</html>