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
  table {
    width: 100%;
    border: 1px solid #444444;
  }
</style>
<script type="text/javascript">
function confirmChk(){
	if(confirm("정말 탈퇴하시겠습니까?") == true){ //확인
		location.href='${pageContext.request.contextPath}/member/memberDelete?id=${member.id}';
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

<div class="form-group row">
	<label class="col-sm-2 col-xs-12 col-form-label" for="nickname">아이디</label>
		<div class="col-sm-10 col-xs-12">
		    ${member.id}
		</div>
</div>

<div class="form-group row">
	<label class="col-sm-2 col-xs-12 col-form-label" for="nickname">닉네임</label>
		<div class="col-sm-10 col-xs-12">
		    ${member.nickname}
		</div>
</div>

<div class="form-group row">
	<label class="col-sm-2 col-xs-12 col-form-label" for="nickname">이메일</label>
		<div class="col-sm-10 col-xs-12">
		    ${member.email}
		</div>
</div>


<div class="form-group row">
	<label class="col-sm-2 col-xs-12 col-form-label" for="nickname">비밀번호</label>
		<div class="col-sm-10 col-xs-12">
		    ${member.password}
		</div>
</div>

<%-- <table>
	<tr>
		<th>아이디 &nbsp;</th>
		<td>${member.id}</td>
	</tr>
	<tr>
		<th>닉네임 &nbsp;</th>
		<td>${member.nickname}</td>
	</tr>
	<tr>
		<th>이메일 &nbsp;</th>
		<td>${member.email}</td>
	</tr>
	<tr>
		<th>비밀번호 &nbsp;</th>
		<td>${member.password}</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<input type="button" value="수정" onclick="location.href='/member/memberModifyForm?id=${member.id}'">
			<input type="button" value="탈퇴" onclick="confirmChk();" >
		</td>
	</tr>
</table> --%>
<pre>

</pre>
		<a class="btn btn-success" type="submit" onclick="location.href='${pageContext.request.contextPath}/member/memberModifyForm?id=${member.id}'" role="button" title="수정"><i class="fa fa-save"></i>수정</a>
		<a class="btn btn-danger" type="submit" onclick="confirmChk();" role="button" title="탈퇴"><i class="fa fa-save"></i>탈퇴</a>	
</div>
<pre>

</pre>
<%@ include file="../footer.jsp" %> 
</body>
</html>