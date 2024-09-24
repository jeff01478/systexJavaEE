<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>遊戲結束</title>
  <!-- 引入 Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card">
            <div class="card-header bg-success text-white">
                <h2 class="text-center">恭喜你！</h2>
            </div>
            <div class="card-body text-center">
                <p>猜到了幸運數字！</p>
                <a href="guess.jsp" class="btn btn-primary">再玩一次</a>
                <a href="../index.jsp" class="btn btn-secondary">回選單</a>
            </div>
        </div>
    </div>
    <!-- 引入 Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>