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
function register(){
		$('#registration').click(register())
			if($.trim($('#id').val()) == ''){
				alert("아이디를 입력하세요.");
				$('#id').focus();
				return;
			}else if($.trim($('#password').val()) == ''){
				alert("패스워드를 입력하세요.");
				$('#password').focus();
				return;
			}else if($.trim($('#nickname').val())== ''){
				alert("닉네임을 입력하세요");
				$('#nickname').focus();
				return;
			}
			//패스워드 확인
			else if($('#password').val() != $('#passwordCheck').val()){
				alert('패스워드가 다릅니다.');
				$('#password').focus();
				return;
			}
				$('#registration').submit();
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
					$(html).insertAfter("#idCheck2");
					return false;
				}else if(data == "1"){
					var html="<a id='idCheck' style='color: red'>사용 불가능한 닉네임 입니다.</a>";
					$(html).insertAfter("#idCheck2");
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
	<form id="registrationFrm" name="registrationFrm" action="${pageContext.request.contextPath}/registration.do">
		<table>
			<tbody>
				<tr>
					<td>아이디</td>
					<td><input type="text" id="id" name="id" ></td>
					<td><input type="button" id="check" value="중복체크" onclick="idchk()"></td>
				</tr>
				<tr >
					<td colspan="3"><div></div></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td colspan="2"><input id="password" name="password" type="password"></td>
				</tr>
				<tr>
					<td>패스워드 확인</td>
					<td colspan="2"><input id="passwordCheck" name="passwordCheck" type="password"></td>
				</tr>
				
				<tr>
					<td>닉네임</td>
					<td colspan="2"><input id="nickname" name="nickname" type="text"></td>
				</tr>
				
				<tr>
				<td><input type="button" id="nicknameChk" value="중복체크" onclick="nikchk()"></td>
				</tr>
				
				<tr>
					<td colspan=3 id="nickCheck"></td>
				</tr>
				
				<tr>
					<td>Email</td>
					<td colspan="2"><input id="email" name="email" type="email"></td>
				</tr>			
				
				<tr>
					<td colspan="3"><button type="submit" id="registration">회원가입</button></td>
				</tr>
			</tbody>
		</table>
		
		<div id="idCheck2"></div>
		
	</form>
</body>
</html>