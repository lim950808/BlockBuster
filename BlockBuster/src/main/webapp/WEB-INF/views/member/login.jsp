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
<style type="text/css">
body{
	margin-top: 0;
	padding: 0;
	font-family: poppins;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;	
}
body::before{
	content: "";
	position: absolute;
	z-index: 1;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
}
.vid-bg{
	position: absolute;
	right: 0;
	bottom: 0;
	min-width: 100%;
	min-height: 100%;
}
.img-bg{
	position: absolute;
	right: 0;
	bottom: 0;
	min-width: 100%;
	min-height: 100%;
}
/* login-form  */
.login-form{
	position: relative;
	z-index: 2;
}
.login-form h1{
/* 	font-weight: bold; */
	font-size: 40px;
	color: #fff;
	text-align: center;
	margin-bottom: 60px;
	text-shadow: 0 0 7px #fff, 0 0 10px #fff, 0 0 21px #fff, 0 0 42px #ff7f00,
    0 0 82px #ff7f00, 0 0 92px #ff7f00, 0 0 102px #ff7f00, 0 0 151px #ff7f00;
}
/* .login-form span {
	color: red;
	font-size: 38px;
} */
.int-area{
	width: 400px;
	position: relative;
	margin-top: 20px;
}
.int-area:first-shild{
	margin-top: 0;
}
.int-area input{
	width: 100%;
	padding: 20px 10px 10px;
	background-color: transparent;
	border: none;
	border-bottom: 1px solid #999;
	font-size: 18px;
	color: #fff;
	outline: none;
}
.int-area label{
	position: absolute;
	left: 10px;
	top: 15px;
	font-size: 18px;
	color: #999;
	transition: top .5s ease;
}
.int-area label.warning{
	color: red !important;
	animation: warning .3s ease;
	animation-iteration-count: 3;
}
 @keyframes warning{
	0% { transform: translateX(-8px);}
	25%{ transform: translateX(8px);}
	50%{ transform: translateX(-8px);}
	75%{ transform: translateX(8px);}
}
.int-area input:focus + label,
.int-area input:valid + label{
	top: 0;
	font-size: 13px; 
	color: #ff7f00;
}
.btn-area{
	margin-top: 30px;	
}
.btn-area button{
	width: 100%;
	height: 50px;
	background: #ff7f00;
	color: #fff;
	font-size: 20px;
	border: none;
	border-radius: 25px;
	cursor: pointer;
}
.caption{
	margin-top: 20px;
	text-align: center;
}
.caption a{
	font-size: 15px;
	color: #999;
	text-decoration: none;
}
p {
    margin-top: 1rem;
    margin-bottom: 1rem;
    color: #ff7f00;
}
.text-primary {
    color: #ff7f00!important;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

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
	});
}
</script>
</head>
<body>
<%-- 
	<h1 align="center">로그인</h1>
	<form method="get" name="login" action="${pageContext.request.contextPath}/login" onsubmit="checkIdPw(); return false;">
		ID : <input type="text" id="id" name="id" placeholder="Enter ID" required autofocus><br>
		PW : <input type="text" id="password" name="password" placeholder="Enter password"><br>
		<div>
		<a href="${pageContext.request.contextPath}/findId" class="txt1">아이디를 잊으셨나요?</a>
		<a href="${pageContext.request.contextPath}/findPw" class="txt1" id="test">비밀번호를 잊으셨나요?</a>
		</div>
		<button type="submit">로그인</button>
		<p class="text-muted text-center mt-2 ml-2 mb-0">회원이 아니신가요? <a href="${pageContext.request.contextPath}/registrationView" class="text-primary ml-1">회원가입</a></p>
	</form>
	 --%>


<!-- background video -->
	<!-- <video src="/resources/video/IronManBattle.mp4" class="vid-bg" autoplay loop muted></video> -->

<!-- background img -->
	<img alt="background img" class="img-bg" src="${pageContext.request.contextPath}/resources/img/벽돌배경02.jpg" />
	 
<section class="login-form">
	<h1 align="center">LOGIN</h1>
	<form method="get" name="login" action="${pageContext.request.contextPath}/login" onsubmit="checkIdPw(); return false;">
		<input type="hidden" name="requestURL" value="${param.requestURL}"/>
		<div class="int-area">	
			<input type="text" name="id" id="id" autocomplete="off" required autofocus>
			<label for="id">USER ID</label>
		</div>
		<div class="int-area">	
			<input type="password" name="password"  id="password" autocomplete="off" required >
			<label for="id">PASSWORD</label>
		</div>
		<div class="btn-area">
			<button id="btn" type="submit">LOGIN</button>
		</div>
		
<!-- 		<div class="caption">
			<a href="findId.jsp" class="txt1">아이디를 잊으셨나요?</a>
		</div> -->
		<div class="caption">
			<a href="findPwView.do" class="txt1" id="test">비밀번호를 잊으셨나요?</a>
		</div>
		<div class="caption">
			<p class="text-muted text-center mt-2 ml-2 mb-0">회원이 아니신가요?<a href="${pageContext.request.contextPath}/registrationView" class="text-primary ml-1">회원가입</a></p>
		</div>
	</form>
</section>
	
	<script>
		let id = $('#id');
		let pw = $('#password');
		let btn =$('#btn');
		
		$(btn).on('click', function() {
			if($(id).val()==""){
				$(id).next('label').addClass('warning');
				setTimeout(function() {
					$('label').removeClass('warning');
				}, 1500);
			}
			else if($(password).val()=="") {
				$(password).next('label').addClass('warning');
			}
		});
	</script>		 

</body>
</html>