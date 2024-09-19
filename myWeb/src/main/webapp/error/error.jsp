<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>This is an error handling page</title>
</head>
<body style="background-color: orange">
	<h1>This is an error handling page</h1>
	Root Cause : <%= exception.getMessage() %>
</body>
</html>