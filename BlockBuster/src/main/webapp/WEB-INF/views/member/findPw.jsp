<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 align="center">비밀번호 찾기 </h1>
<h3 align="center">작성하신 이메일로 임시비밀번호가 전송됩니다</h3>
	<form id="findPw" action="${pageContext.request.contextPath}/findPw.do">
		Email : <input type="text" name="email" placeholder="Enter Email" required autofocus><br>
		<button type="submit">비밀번호 찾기</button>
		<p class="text-muted text-center mt-2 ml-2 mb-0">회원이 아니신가요? <a href="${pageContext.request.contextPath}/registration.do" class="text-primary ml-1">회원가입</a></p>
		<input type="hidden" name="code" value="${code}">
	</form>
</body>
</html>