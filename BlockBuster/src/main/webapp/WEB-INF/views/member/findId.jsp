<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 align="center">아이디 찾기 </h1>
	<form method="post" action="/member/findId">
		Email : <input type="text" name="email" placeholder="Enter Email" required autofocus><br>
		<button type="submit">아이디 찾기</button>
		<p class="text-muted text-center mt-2 ml-2 mb-0">회원이 아니신가요? <a href="registration.jsp" class="text-primary ml-1">회원가입</a></p>
	</form>
</body>
</html>