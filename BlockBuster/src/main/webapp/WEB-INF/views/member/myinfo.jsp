<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<title>내정보</title></head>
<style>

</style>
<script type="text/javascript">
function confirmChk(){
	if(confirm("정말 탈퇴하시겠습니까?") == true){ //확인
		location.href='/member/memberDelete?id=${member.id}';
	}else{//취소
		return false;
	}
}
</script>
<body>
<pre>

</pre>
<div class="container">
<h2><b>내 정보</b></h2>
<hr color="white">
<table>
	<tr><th>아이디</th><td>${member.id}</td></tr>
	<tr><th>닉네임</th><td>${member.nickname}</td></tr>
	<tr><th>이메일</th><td>${member.email}</td></tr>
	<tr><th>비밀번호</th><td>${member.password}</td></tr>
	<%-- <tr><td colspan="2">
		<input type="button" value="수정" onclick="location.href='/member/memberModifyForm?id=${member.id}'">
		<input type="button" value="탈퇴" onclick="confirmChk();" >
	</td></tr> --%>	
</table>
<pre>

</pre>
		<a class="btn btn-success" type="submit" onclick="location.href='/member/memberModifyForm?id=${member.id}'" role="button" title="수정"><i class="fa fa-save"></i>수정</a>
		<a class="btn btn-danger" type="submit" onclick="confirmChk();" role="button" title="탈퇴" title="탈퇴"><i class="fa fa-save"></i>탈퇴</a>	
</div>
<pre>

</pre>
<%@ include file="../footer.jsp" %> 
</body>
</html>