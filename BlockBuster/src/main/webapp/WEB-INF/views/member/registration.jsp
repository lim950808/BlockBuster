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
<title>회원가입</title>
<style type="text/css">
body {background-color: #000000;}
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

<script type="text/javascript">
var idValidate=0;
var nickValidate=0;

function register(){	
	
	var regExpId = /^[0-9a-z]+$/;
	var regExpNickname =/^[0-9a-z]+$/;
	var regExpPassword =/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,}$/;
	var regExpPasswordCheck =/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,}$/;
	var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; //akim
	
	var id=$('#id').val();
	var password=$('#password').val();
	var passwordCheck=$('#passwordCheck').val();
	var nickname=$('#nickname').val();
	var email=$('#email').val();
//	alert("idValidate=>"+idValidate);
//	alert("nickValidate=>"+nickValidate);
	if(id==null||id==""){
		alert("아이디를 입력해주세요");
			if(!regExpId.test(id)){
				alert("아이디는 8자이내로 입력해주세요 숫자와 문자조합");
				form.id.focus();
				form.id.value="";
				return false;
			}
			return false;
		}
		if(nickname==null||nickname==""){
			if(!regExpNickname.test(nickname)){
				alert("닉네임은 8자이내로 입력해주세요!");
				form.nickname.focus();
				form.nickname.value='';
				return false;
			}
			return false;
		}
		
		
		if(!/^[a-zA-Z0-9]{8,}$/.test(password)){
			alert('비밀번호는 숫자와 영문자 조합으로 8자리 이상을 사용해야 합니다.');
			//alert("password=>"+password);
			//alert("passwordCheck=>"+passwordCheck);
			
 			return false;
		}
		
		if(password != passwordCheck){
			alert("입력하신 비밀번호가 동일하지 않습니다");
			return false;					
		}
		
		if(email==null||email==""){	
			if(!regExpEmail.test(email)){
				alert("이메일 입력을 확인 해주세요");
			    form.email1.focus();
				form.email.value='';
				return false;	
			}
			return false;	
		}
		if(idValidate == 0 || nickValidate == 0){
			alert('중복확인절차를 완료해주세요')
			return false;
		}	
//	console.log(idValidate);
//	console.log(nickValidate);
	return true;
}
	 
function idchk(){
		$('#idCheck').remove();
			$.ajax({
				type: "GET",
				url: "${pageContext.request.contextPath}/idCheck.do",
				data:{"id":$('#id').val(), "nickname":$('#nickname').val()},
				dataType:'text',
				success: function(data){
					console.log(data); //0
					if(data == "0"){
						var html="<a id='idCheck' style='color: green'>사용 가능한 아이디 입니다.</a>";
						$(html).insertAfter("#idCheck2");
						idValidate = 1;
						return false;
					}else if(data == "1"){
						var html="<a id='idCheck' style='color: red'>사용 불가능한 아이디 입니다.</a>";
						$(html).insertAfter("#idCheck2");
						return false;
					}
				}
			});
	}
function nikchk(){	
	$('#idCheck').remove();
		$.ajax({
			type: "GET",
			url: "${pageContext.request.contextPath}/nicknameCheck.do",
			data:{"id":$('#id').val(), "nickname":$('#nickname').val()},
			dataType:'text',
			success: function(data){
				console.log(data); //0
				if(data == "0"){
					var html="<a id='idCheck' style='color: green'>사용 가능한 닉네임 입니다.</a>";
					$(html).insertAfter("#nickCheck");
					nickValidate = 1;
					return false;
				}else if(data == "1"){
					var html="<a id='idCheck' style='color: red'>사용 불가능한 닉네임 입니다.</a>";
					$(html).insertAfter("#nickCheck");
					return false;
				}
			}
		});
}

</script>
</head>
<body>
<section class="login-form">
	<h1 align="center">회원가입</h1>
	<form id="registrationFrm" name="registrationFrm" action="${pageContext.request.contextPath}/registration.do" onsubmit="return register()">
		<img alt="background img" class="img-bg" src="${pageContext.request.contextPath}/resources/img/벽돌배경02.jpg" />
		<div class="int-area">	
			<input type="text" name="id" id="id" autocomplete="off" required autofocus>
			<label for="id">ID</label>
		</div>
		
		<input type="button" id="check" value="중복체크" onclick="idchk()" required>
		
		<div class="int-area">	
			<input type="password" name="password" id="password" autocomplete="off" required autofocus>
			<label for="password">비밀번호</label>
		</div>
		
		<div class="int-area">	
			<input type="password" name="passwordCheck" id="passwordCheck" type="password" autocomplete="off" required autofocus>
			<label for="passwordCheck">비밀번호 확인</label>
		</div>
		
		<div class="int-area">	
			<input type="text" name="nickname" id="nickname" autocomplete="off" required autofocus>
			<label for="nickname">닉네임</label>
		</div>
		<div class="button">
			<input type="button" id="nicknameChk" value="중복체크" onclick="nikchk()" required>
		</div>
		
		<div class="int-area">	
			<input type="email" name="email" id="email" autocomplete="off" required autofocus>
			<label for="email">이메일</label>
		</div>
		
		<div class="caption">
			<a id="idCheck2"></a>
		</div>
		
		<div class="caption">
			<a id="nickCheck"></a>
		</div>
		
		<div class="btn-area">
			<button id="registration" type="submit">가입하기</button>
		</div>

	</form>
	</section>
</body>
</html>