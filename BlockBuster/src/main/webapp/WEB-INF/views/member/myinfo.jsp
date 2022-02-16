<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>내정보</title></head><body>
<div class="container">
<table>
	<tr><th>아이디</th><td>${member.id}</td></tr>
	<tr><th>닉네임</th><td>${member.nickname}</td></tr>
	<tr><th>이메일</th><td>${member.email}</td></tr>
	<tr><th>비밀번호</th><td>${member.password}</td></tr>
	<tr><td colspan="2">
		<input type="button" value="수정"
			onclick="location.href='/member/memberModifyForm?id=${member.id}'">
		<input type="button" value="탈퇴"
			onclick="location.href='/member/memberDelete?id=${member.id}'">
	</td></tr>	
</table>
</div>
<%@ include file="../footer.jsp" %> 
</body>
</html>