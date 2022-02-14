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
			alert('숫자와 영문자 조합으로 8자리 이상을 사용해야 합니다.');
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
	<h1>회원가입</h1>
	<hr>
	<form id="registrationFrm" name="registrationFrm" action="${pageContext.request.contextPath}/registration.do" onsubmit="return register()">
		<table>
			<tbody>
				<tr>
					<td>아이디</td>
					<td><input type="text" id="id" name="id" required></td>
					<td><input type="button" id="check" value="중복체크" onclick="idchk()" required></td>
				</tr>
				<tr>
					<td colspan=3 id="idCheck2"></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td colspan="2"><input id="password" name="password" type="password" required></td>
				</tr>
				<tr>
					<td>패스워드 확인</td>
					<td colspan="2"><input id="passwordCheck" name="passwordCheck" type="password" required></td>
				</tr>
				
				<tr>
					<td>닉네임</td>
					<td colspan="2"><input id="nickname" name="nickname" type="text" required></td>
				</tr>
				
				<tr>
				<td><input type="button" id="nicknameChk" value="중복체크" onclick="nikchk()"></td>
				</tr>
				
				<tr>
					<td colspan=3 id="nickCheck"></td>
				</tr>
				
				<tr>
					<td>Email</td>
					<td colspan="2"><input id="email" name="email" type="email" required></td>
				</tr>			
				
				<tr>
					<td colspan="3"><button type="submit" id="registration">회원가입</button></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>