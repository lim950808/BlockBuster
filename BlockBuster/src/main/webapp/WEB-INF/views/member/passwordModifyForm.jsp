<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
<script type="text/javascript">

function register(){
	   var pw1   = $('#pw1').val();
	   var pw2   = $('#pw2').val();
	
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
	   }else{
		   $('#frm').submit();
	   }
}

</script>
</head>
<body>
<pre>

</pre>
<div class="container">
<h2><b>비밀번호 변경</b></h2>
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
				    <input type="text" id="nickname" name="nickname" value="${member.nickname}" readonly>	
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2 col-xs-12 col-form-label" for="email">이메일</label>
				<div class="col-sm-10 col-xs-12">
					<input type="text" id="email" name="email" value="${member.email}" readonly>
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
					<a class="btn btn-danger" type="submit" onclick="location.href='${pageContext.request.contextPath}/member/memberModifyForm?id=${member.id}'" role="button" title="취소"><i class="fa fa-save"></i> 취소</a>
					<%-- <input type="button" value="취소"
					onclick="location.href='/member/myinfo?id=${member.id}'"> --%>
					
				</div>
			</div>
		</form>
</div>
<%@ include file="../footer.jsp" %> 
</body>
</html>