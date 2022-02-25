<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl을 사용하기 위한 선언 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css" integrity="sha384-zEpdAL7W11eTKeoBJK1g79kgl9qjP7g84KfK3AZsuonx38n8ad+f5ZgXtoSDxPOh" crossorigin="anonymous">

<!DOCTYPE html>
<html lang="ko">
<head>

<script type="text/javascript">

	/* 내용 기입 여부 검증 */
	function insertCheck(){
		if(r_title.value.length == 0){
			alert("제목을 입력해주세요.");
			r_title.focus();
			return;
		}else if(r_content.value.length == 0){
			alert("내용을 입력해주세요.");
			r_content.focus();
			return;
		}else{
			$('#frm').submit();
		}
	} 

</script>
	
<body>
<pre>



</pre>
	<div class="container">
	<h3>리뷰작성하기</h3>
	
	<div class="card border-light mb-3">
		<!-- 파일 등록을 위해 enctype="multipart/form-data" 을 선언 -->
		<form action="<c:url value="reviewProWrite"/>" class="form-horizontal" id="frm" name="frm" method="post" enctype="multipart/form-data">


			<input type="hidden" name="pno" value="${pno}">
 			<input type="hidden" name="id" value="${sessionScope.sessionId}">

			
			<div class="row card-body">
				<div class="col-sm-12 col-xs-12">
					<input class="form-control" id="title" name="title" type="text" value="${title}" readonly/>
				</div>
			</div>

			<div class="row card-body" style="padding-top: 0px; padding-bottom: 0px;">
				<div class="col-sm-12 col-xs-12">
					<input class="form-control" id="r_title" name="r_title" placeholder="제목을 입력하세요." type="text" value="" />
				</div>
			</div>
	
			<div class="row card-body">
				<div class="col-sm-12 col-xs-12">
					<textarea rows="15" class="form-control" id="r_content" name="r_content" placeholder="내용을 입력하세요."></textarea>
				</div>
			</div>
			
			<div class="row card-body" style="text-align: left;" >
				<div class="col-sm-12 col-xs-12">
					<input style="height: 42px;" class="form-control" id="imgFile" name="imgFile" type="file"/>
				</div>
			</div>
	
			<div class="card-footer text-muted col-sm-12">
				<div class="col-sm-12" style="text-align : right;">
					<input type="button" type="submit" class="btn btn-outline-warning" value="저장"  onclick="insertCheck();return false;">&emsp;
					<input type="button" class="btn btn-outline-secondary" value="리스트" onclick="location.href='${pageContext.request.contextPath}/reviewProductList?pno=${pno}'">
				</div>
			</div>
		</form>
	</div>
		<%@ include file="../footer.jsp" %>
	</div>


	

</body>
</html>