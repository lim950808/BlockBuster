<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<title>회원수정</title>
<!-- <script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->
<script type="text/javascript">



//닉네임 중복확인
function nickNameFuncChk(){
	//getElementById --> ID가 가지고 있는 객체 
	var nickNameChk  = document.getElementById("nickNameChk"); //hidden으로 값 "0" 저장 중복이면 "0", 아니면 "1"
	var nickNameId   = document.getElementById("nickname");
	
	// 시작^ 0~9, 소문자 a~z , +1개이상 $끝
	var regExpNickname = /^[0-9a-z]+$/;
	
	//문자열 일치 여부 test()
	if (!regExpNickname.test(nickname.value)) {
	    alert("닉네임은 숫자나 영문자로 입력해 주세요!"); 
	    frm.nickname.focus();
	    frm.nickname.value='';
	    return false;
	}
	 $.ajax(
			{
/*데이터 전송 타입*/	type:'post',
/*데이터 받을 주소*/	url :"${pageContext.request.contextPath}/member/nickNameChk", //컨트롤러 url
/*보내는 데이터*/	data:{'nickname' : nickNameId.value},  //파라미터 nickname값 검증
/*받을 데이터 타입*/	dataType:'text',
				success:function(data){//data에는 컨트롤러를 통해 리턴된 값이 들어있음
					if(data == '1' ){
						alert("중복된 닉네임입니다.");
						frm.nickname.focus();
						nickNameChk.value = '0';
						return false;
					}else{
						alert("사용 가능한 닉네임입니다.");
						nickNameChk.value = '1';
					}
				}
			}
	); 
}


//이메일 중복확인
function emailFuncChk(){
	//getElementById --> ID가 가지고 있는 객체 
	var emailChk = document.getElementById("emailChk");
	var emailId = document.getElementById("email");
	var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	if (!regExpEmail.test(email.value)) {
	    alert("이메일 형식을 확인해 주세요"); 
	    frm.email.focus();
	    frm.email.value='';
	    return false;
	}
	$.ajax(
			{
				type:'post',
				url :"${pageContext.request.contextPath}/member/emailChk", //컨트롤러 url
				data:{'email':emailId.value},
				dataType:'text',
				success:function(data){
					if(data == '1'){
						alert("중복된 이메일입니다.");
						frm.email.focus();
						emailChk.value = '0';
						return false;
					}else{
						alert("사용 가능한 이메일입니다.");
						emailChk.value = '1';
					}
				}
			}
	);
}


function register(){
	   var nickNameChk = $('#nickNameChk').val();
	   var emailChk    = $('#emailChk').val();
	   var nickName    = $('#nickname').val();
	   var email = $('#email').val();
	   var pw1   = $('#pw1').val();
	   var pw2   = $('#pw2').val();
	   
	   if(nickName==''){//닉네임 입력 안 했을 시
		   alert("닉네임을 입력해주세요");
		   frm.nickName.focus();
		   return false;
	   }
	   
	   if(email==''){ //이메일 입력 안 했을 시 
		   alert("이메일을 입력해주세요");
		   frm.email.focus();
		   return false;
	   }
	   
	   if(pw1 =='' && pw2 == ''){ //비밀번호 입력 안 했을 시
		   alert("비밀번호를 입력해주세요");
		   return false;
		   
	   }else if(!/^[a-zA-Z0-9]{8,}$/.test(pw1)){ //소문자 a~z 대문자 A~Z 숫자 0~9 8자리이상
		   alert("비밀번호는 숫자와 영문자 조합으로 8자리 이상을 사용해야 합니다.");	
		   frm.pw1.focus();
		   frm.pw1.value='';
		   return false;
		   
	   }else if(pw1 != pw2){ //비밀번호 동일하지 않을 때
		   alert("입력하신 비밀번호가 동일하지 않습니다");
		   frm.pw2.focus();
		   frm.pw2.value='';
		   return false;
	   }
	   
	   if(nickNameChk == '1' && emailChk == '1'){ //중복 확인 둘 다 했을 때
		   $('#frm').submit();
	   
	   }else{
		   alert("중복확인절차를 완료해주세요");
		   return false;
	   } 
}

</script>
</head>
<body>
<pre>

</pre>
<div class="container">
<h2><b>회원정보 수정</b></h2>
<hr color="white">
		<form action="${pageContext.request.contextPath}/member/memberUpdate"  method="post" id="frm" >		
			<div class="form-group row">
				<input type="hidden" name="id" value="${member.id}">
			</div>

			<h2>ID : ${member.id}</h2>
<pre>

</pre>		    
			<div class="form-group row">
				<label class="col-sm-2 col-xs-12 col-form-label" for="nickname">닉네임</label>
				<div class="col-sm-10 col-xs-12">
				    <input type="hidden" id="nickNameChk"  value="0">
				    <input type="text" id="nickname" name="nickname"  required="required" placeholder="닉네임을 입력해주세요" value="${member.nickname}">
					<input type="button" value="중복확인" onclick="nickNameFuncChk()">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2 col-xs-12 col-form-label" for="email">이메일</label>
				<div class="col-sm-10 col-xs-12">
				    <input type="hidden" id="emailChk"  value="0">
					<input type="text" id="email" name="email"   required="required" placeholder="이메일을 입력해주세요" value="${member.email}">
					<input type="button" value="중복확인" onclick="emailFuncChk()">
				</div>
			</div>
	
			<div class="form-group row">
				<label class="col-sm-2 col-xs-12 col-form-label" for="content">비빌번호</label>
				<div class="col-sm-10 col-xs-12">
					<input type="password" id="pw1" name="password" placeholder="비밀번호를 입력해주세요" required="required"> 
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 col-xs-12 col-form-label" for="content">비빌번호 확인</label>
				<div class="col-sm-10 col-xs-12">
					<input type="password" id="pw2" name="passwordCheck" placeholder="비밀번호 확인" required="required">
				</div>
			</div>
<pre>

</pre>	
			<div class="form-group row">
				<div class="col-sm-12">
					<a class="btn btn-success" type="submit" onclick="register()" role="button" title="확인"><i class="fa fa-save"></i> 확인</a>
					<a class="btn btn-danger" type="submit" onclick="location.href='${pageContext.request.contextPath}/member/myinfo?id=${member.id}'" role="button" title="취소"><i class="fa fa-save"></i> 취소</a>
					<a class="btn btn-secondary" type="submit" onclick="location.href='${pageContext.request.contextPath}/member/passwordModifyForm?id=${member.id}'" role="button" title="비밀번호변경"><i class="fa fa-save"></i> 비밀번호변경</a>
					<%-- <input type="button" value="취소"
					onclick="location.href='/member/myinfo?id=${member.id}'"> --%>
					
				</div>
			</div>
		</form>
</div>
<pre>

</pre>
<%@ include file="../footer.jsp" %> 
</body>
</html>