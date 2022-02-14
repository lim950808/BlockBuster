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
<title>Insert title here</title>
<script>
function chkcode(){
	 $(document).ready(function(){
	$('#lists').remove();
	var youCode = $('#youCode').val();
	var weSendCode = $('#weSendCode').val();
	console.log(youCode);
	console.log(weSendCode);
	if(youCode != weSendCode){
		var result = "<div id='lists' style='margin:20px 0 0 10px;padding:20px 15px;font-size:14px;color:#555;line-height:20px;border:1px solid #ddd;background:#f5f5f5'>코드를 확인해주세요<br></div>";
		$(result).insertAfter("#youCode");
	}else{
		var form document.emailCheckFrm;
		form.submit();
	}
	});
}

<%= request.getAttribute("id") %>
<%= request.getAttribute("password") %>
<%= request.getAttribute("nickname") %>
<%= request.getAttribute("email") %>
</script>
</head>
<body>
	<h1 align="center"> 이메일 코드 확인</h1>
		email: <input id="youCode" name="youCode" type="number" placeholder="code를 입력하세요"><br>
	<form id="emailCheckFrm" name="emailCheckFrm" action="${pageContext.request.contextPath}/regSubmit.do" onsubmit="chkcode(); return false;"> <!-- 로그인 후 메인으로 날라간 컨트롤러 맵핑  -->
		<input type="hidden" id="weSendCode" value="${code}">
		<input type="hidden" id="mailSendResult" value="${mailSendResult}">
		<input type="hidden" name="id" value="${member.id}">
		<input type="hidden" name="password" value="${member.password}">		
		<input type="hidden" name="nickname" value="${member.nickname}">
		<input type="hidden" name="email" value="${member.email}">
		<button type="submit">확인</button>
	</form>

</body>
</html>