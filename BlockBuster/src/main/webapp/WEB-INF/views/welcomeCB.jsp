<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome BlockBuster</title>
<!-- <link rel="stylesheet" href="css/welcomeCB.css"> -->
<style type="text/css">
body{
	margin: 0;
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

/* login-form  */
.login-form{
	position: relative;
	z-index: 2;
}
.login-form h1{
	font-size: 32px;
	color: #fff;
	text-align: center;
	margin-bottom: 60px;
}

.login-form span {
	color: red;
	font-size: 38px;
}

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
	border-bottom: 1px solid; #999;
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
	color: #166cea;
}

.btn-area{
	margin-top: 30px;	
}
.btn-area button{
	width: 100%;
	height: 50px;
	background: #166cea;
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


.lo h1 {
	color: #fff;
}
.lo span {
	color: #f5bb00;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<!-- background video -->
	<video src="/resources/video/AvengersVsThanos.mp4" class="vid-bg" autoplay loop muted></video>


<!-- login form -->
	<section class="login-form">
		
		<h1><span>B</span>lock<span>B</span>uster </h1>
		<form action="<c:url value='loginCheck'/>" method="post">
			<div class="int-area">
				<input type="text" name="id" id="id" autocomplete="off" required>
				<label for="id">USER NAME</label>
			</div>
			<div class="int-area">
				<input type="password" name="password" id="pw" autocomplete="off" required>
				<label for="id">PASSWORD</label>
			</div>
			<div class="btn-area">
				<button id="btn" type="submit">LOGIN</button>
			</div>
			<div class="caption">
				<a href="#">Forgot Password?</a>
			</div>
		</form>
	</section>
	
	<script>
		let id = $('#id');
		let pw = $('#pw');
		let btn =$('#btn');
		
		$(btn).on('click', function() {
			if($(id).val()==""){
				$(id).next('label').addClass('warning');
				setTimeout(function() {
					$('label').removeClass('warning');
				}, 1500);
			}
			else if($(pw).val()=="") {
				$(pw).next('label').addClass('warning');
			}
		});
	</script>
	
	
	
</body>
</html>