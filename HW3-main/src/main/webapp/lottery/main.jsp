<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>輸入張數與排除的數字</title>
	    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
	<body>
		<div class="container mt-5">
		<div class="row justify-content-center">
		<div class="col-md-6">
			<h2>請輸入張數與要排除的數字</h2>
			<%--Start Error Report --%>
			<% LinkedList<String> errors = (LinkedList<String>)request.getAttribute("errors");%>
			<% if(errors != null){ %>
				<ul style="color: red; font-size: 1em">
					<table border="0" style="margin: auto;text-align:left">
						<%for(String error: errors){%>
							<tr><td><li><%= error %></li></td></tr>
						<%}%>
					</table>
				</ul>
			<%} %>
		
		<%--End Error Report --%>
			
			<form action="lotteryController.do" method="post">
				<div class="mb-3">
					<label for="lottoCount" class="form-label">需要的組數</label>
			    	<input type="number" class="form-control" id="lottoCount" name="lottoCount" required>
				</div>
				<div class="mb-3">
			    	<input type="text" class="form-control" id="excludeNumbers" name="excludeNumbers" placeholder="2 13 15 21">
				</div>
				<button type="submit" class="btn btn-primary">送號</button>
			</form>
		</div>
		</div>
		</div>
		<!-- Bootstrap JS -->
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
	</body>
</html>