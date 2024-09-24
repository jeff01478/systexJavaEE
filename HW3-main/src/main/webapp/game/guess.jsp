<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>猜數字遊戲</title>
	 <!-- 引入 Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
    <h2 class="text-center fw-bolder">猜數字遊戲</h2>
    <p class="text-center">請猜一個1~10之間的數字</p>
   		<%--Start Error Report --%>
  		<%
            LinkedList<String> errorMsgs = (LinkedList<String>) request.getAttribute("errorMsgs");
  				if(errorMsgs != null){
        %>
			<ul style="color: red; font-size: 1em">
					<table border="0" style="margin: auto;text-align:left">
						<% for (String error : errorMsgs) { %>
                        <tr><td><li><%= error %></li></td></tr>
						<%}%>
					</table>
				</ul>
			<%} %>
		
		<%--End Error Report --%>
        <p class="text-center">
            剩餘次數：
            <%= request.getAttribute("remains") != null
                ? request.getAttribute("remains")
                : session.getAttribute("remains") != null
                    ? session.getAttribute("remains")
                    : "3" %>
        </p>
    
    <form action="gameController.do" method="post" class="text-center">
        <div class="mb-3">
            <input type="text" name="guess" placeholder="輸入你猜測的數字" class="form-control w-25 mx-auto">
        </div>
        <button type="submit" class="btn btn-primary">提交</button>
    </form>
    
    <% if (request.getAttribute("answer") != null) { %>
    <div class="alert alert-info w-25">
        答案是：<%= request.getAttribute("answer") %>
    </div>
	<% } %>
    
    <form action="gameController.do" method="get">
    <button type="submit" class="btn btn-outline-success" name="action" value="peek">偷看答案</button>
	</form>
    

    </div>
    <!-- 引入 Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>