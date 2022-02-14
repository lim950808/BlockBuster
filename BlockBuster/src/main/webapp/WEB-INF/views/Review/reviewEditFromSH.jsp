<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl을 사용하기 위한 선언 -->
<!DOCTYPE html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정</title>

<style>

iframe {
	width: 0px;
	height: 0px;
	border: 0px;
}
</style>

</head>
<body>


  <div class="container">
<h1>세션아이디 : ${sessionScope.sessionId}</h1> 
	<form action="<c:url value="edit"/>" class="form-horizontal" id="frm" name="frm" method="post" enctype="multipart/form-data">
			
		<input type="hidden" name="r_no" value="${editWriteFrom.r_no}">
		<input type="hidden" name="id" value="${editWriteFrom.id}">

		<div>		
		<h2>[${editWriteFrom.title}]</h2>
		</div>
		
		
		<!-- class에 사용되는 form-group, row 등은 부트스트랩에서 사용되는 class -->
		<div class="form-group row">
			<label class="col-sm-2 col-xs-12 col-form-label" for="title">제목</label>
			<div class="col-sm-10 col-xs-12">
				<input class="form-control" id="r_title" name="r_title" placeholder="제목" type="text" value="${editWriteFrom.r_title}" />
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2 col-xs-12 col-form-label" for="content">내용</label>
			<div class="col-sm-10 col-xs-12">
				<textarea rows="5" class="form-control" id="r_content" name="r_content">${editWriteFrom.r_content}</textarea>
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2 col-xs-12 col-form-label" for="imgFile">파일</label>
			<div class="col-sm-10 col-xs-12">
				<input class="form-control" id="imgFile" name="imgFile" type="file"/>
			</div>
		</div>

		<div class="form-group row">
			<div class="col-sm-12">
				<a class="btn btn-success" type="submit" onclick="boardIn();return false;" role="button" title="저장"><i class="fa fa-save"></i> 저장</a>
				<a class="btn btn-primary" href="javascript:window.history.back();" role="button" title="뒤로가기"><i class="fa fa-list-ul"></i> 뒤로가기</a>
			</div>
		</div>
	
	</form>
  </div>
  
	<script type="text/javascript">
		function boardIn(){
			$('#frm').submit();
		}
	</script>



</body>
</html>