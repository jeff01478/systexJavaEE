<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>樂透結果</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">樂透結果</h2>
        <ul class="list-group">
            <%
            	ArrayList<Integer>[] lotteryResults = (ArrayList<Integer>[]) request.getAttribute("lotteryResults");
            	if (lotteryResults != null) {
                int count = 1;
                for (ArrayList<Integer> result : lotteryResults) {
            %>
                <li class="list-group-item">
                    第<%= count++ %>組樂透號碼：<%= result %>
                </li>
            <%
                    }
                }
            %>
        </ul>
        <div class="mt-3">
            <a href="main.jsp" class="btn btn-primary">再一次</a>
            <a href="../index.jsp" class="btn btn-secondary">回選單</a>
        </div>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
