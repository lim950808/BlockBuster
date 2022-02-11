<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl을 사용하기 위한 선언 -->

<!DOCTYPE html>
<html lang="ko">
<head>
<!-- 
<script src="http://code.jquery.com/jquery-1.7.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
 -->
<script type="text/javascript">
	
	
</script>
<body>

	<div class="container">
	
		<h3>리뷰작성하기</h3>
		
		<!-- 파일 등록을 위해 enctype="multipart/form-data" 을 선언 -->
		<form action="<c:url value="reviewProWrite"/>" class="form-horizontal" id="frm" name="frm" method="post" enctype="multipart/form-data"  target="SHFrame">


			<input type="hidden" name="pno" value="${pno}">
 			<input type="hidden" name="id" value="${sessionScope.sessionId}">

			
			<!-- class에 사용되는 form-group, row 등은 부트스트랩에서 사용되는 class -->
			<div class="form-group row">
				<label class="col-sm-2 col-xs-12 col-form-label" for="title">영화제목</label>
				<div class="col-sm-10 col-xs-12">
					<input class="form-control" id="title" name="title" placeholder="영상제목" type="text" value="${title}" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-xs-12 col-form-label" for="title">제목</label>
				<div class="col-sm-10 col-xs-12">
					<input class="form-control" id="r_title" name="r_title" placeholder="글제목" type="text" value="" />
				</div>
			</div>
	
			<div class="form-group row">
				<label class="col-sm-2 col-xs-12 col-form-label" for="content">내용</label>
				<div class="col-sm-10 col-xs-12">
					<textarea rows="5" class="form-control" id="r_content" name="r_content" placeholder="내용"></textarea>
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
					<a class="btn btn-primary" href="javascript:window.history.back();" role="button" title="리스트"><i class="fa fa-list-ul"></i> 리스트</a>
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