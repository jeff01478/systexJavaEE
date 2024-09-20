<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<Link href="<%= request.getContextPath() %>/style/myStyle.css" rel="stylesheet"></link>
</head>
<body>
	<h2>顧客資料建立成功</h2>
	<table border="1" style="margin: auto; text-align: left">
		<tbody>
			<tr><td>姓名</td><td>${ cust.name }</td></tr>
			<tr><td>電郵</td><td>${ cust.email }</td></tr>
			<tr><td>電話</td><td>${ cust.telephone }</td></tr>
			<tr><td>地址</td><td>${ cust.address }</td></tr>
			<tr><td>生日</td><td>${ cust.birth }</td></tr>
			<tr><td>性別</td><td>${ cust.gender }</td></tr>
			<tr><td>嗜好</td><td>${ cust.habitString }</td></tr>
		</tbody>
	</table>
	<br/>
	<a href=../>Go Home</a>
</body>
</html>