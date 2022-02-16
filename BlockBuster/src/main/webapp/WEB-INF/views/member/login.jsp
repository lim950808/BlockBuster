<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> <!-- searchbox -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>로그인</title>

<script>
function checkIdPw(){
	$('#message').remove();
	var id = $('#id').val();
	var pw = $('#password').val();
	var str = "";
	console.log(id);
	console.log(pw);
	$.ajax({	
				url :"${pageContext.request.contextPath}/idpwCheck",
				data:{id:id, password:pw},
				dataType:'text',
				success:function(data){
					console.log(data);
					if(data == '0'){
						$("<p id='message'>아이디와 비밀번호를 다시 확인해주세요</p>").insertAfter("#test");
						return false;
					}else if(data == '1'){
						var form = document.login;
						 form.submit();
					}else if(data == '2'){
						$("<p id='message'>탈퇴한 회원입니다.관리자에게 문의하세요</p>").insertAfter("#test");
						return false;
					}
			}
		}
	);
}
</script>
</head>
<body>
	<h1 align="center">로그인</h1>
	<form method="get" name="login" action="${pageContext.request.contextPath}/login" onsubmit="checkIdPw(); return false;">
		ID : <input type="text" id="id" name="id" placeholder="Enter ID" required autofocus><br>
		PW : <input type="text" id="password" name="password" placeholder="Enter password"><br>
		<input type="hidden" name="requestURL" value="${param.requestURL}"/>
		<div>
		<a href="${pageContext.request.contextPath}/findId" class="txt1">아이디를 잊으셨나요?</a>
		<a href="${pageContext.request.contextPath}/findPw" class="txt1" id="test">비밀번호를 잊으셨나요?</a>
		</div>
		<button type="submit">로그인</button>
		<p class="text-muted text-center mt-2 ml-2 mb-0">회원이 아니신가요? <a href="${pageContext.request.contextPath}/registrationView" class="text-primary ml-1">회원가입</a></p>
	</form>
</body>
</html>