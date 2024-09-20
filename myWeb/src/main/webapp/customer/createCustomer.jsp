<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../style/myStyle.css" rel="stylesheet"/>
<title>Insert title here</title>
</head>
<body>
	<h2>新增顧客</h2>
	<%-- Start Error Report --%>
	
	<% LinkedList<String> errors = (LinkedList<String>)request.getAttribute("errors"); %>
	<% if (errors != null) { %>
		<ul style="color: red; font-size: 0.8em">
		<table border="0" style="margin: auto; text-align: left">
			<% for(String error : errors) { %>
			<tr><td><li><%= error %></li></td></tr>
			<% } %>
		</table>
		</ul>
	<% } %>
	
	<%-- End Error Report --%>
	<form action="ccController.do" method='get'>
		<table style='margin:auto; text-align:left'>
			<tr>
				<td>姓名</td><td><input type='text' name='name' value="${ param.name }"></td>
			</tr>
			<tr>
				<td>電郵</td><td><input type='email' name='email' value="${ param.email }"></td>
			</tr>
			
			<tr>
				<td>電話</td><td><input type='tel' name='phone' value="${ param.phone }"></td>
			</tr>
			<tr>
				<td>地址</td><td><input type='text' name='address' value="${ param.address }"></td>
			</tr>
			<tr>
				<td>生日</td><td><input type='date' name='birth' value="${ param.birth }"></td>
			</tr>
			<tr>
				<td>性別</td>
				<td>
					<%
						String isMale = "";
						String isFemale = "";
						String gender = request.getParameter("gender");
						if (gender != null) {
							if (gender.equals("male")) {
								isMale = "checked";
							} else {
								isFemale = "checked";
							}
						}
					%>
					<input type='radio' name='gender' id='man' value='male' <%= isMale %>>男
					<input type='radio' name='gender' id='woman' value='female' <%= isFemale %>>女
				</td>
			</tr>
			<tr>
				<td>嗜好</td>
				<td>
					<%
						String musicSelected = "";
						String shoppingSelected = "";
						String readingSelected = "";
						String[] habits = request.getParameterValues("habit");
						LinkedList<String> habitsList = new LinkedList<>();
						if (habits != null) {
							for (String habit : habits) {
								habitsList.add(habit);
							}	
						}
						if (habitsList != null) {
							if (habitsList.contains("music")) {
								musicSelected = "checked";
							}
							if (habitsList.contains("shopping")) {
								shoppingSelected = "checked";
							}
							if (habitsList.contains("reading")) {
								readingSelected = "checked";
							}
						}
					%>
					<input type='checkbox' name='habit' value='music' <%= musicSelected %>>聽音樂
					<input type='checkbox' name='habit' value='shopping' <%= shoppingSelected %>>逛大街
					<input type='checkbox' name='habit' value='reading' <%= readingSelected %>>讀好書
				</td>
			</tr>
			<tr>
				<td></td>
				<td style='align:center'><input type='reset' value='重設'><input type='submit' value='新增'></td>
			</tr>
		</table>
	</form>
</body>
</html>