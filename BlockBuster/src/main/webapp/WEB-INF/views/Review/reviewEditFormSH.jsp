<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl을 사용하기 위한 선언 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css" integrity="sha384-zEpdAL7W11eTKeoBJK1g79kgl9qjP7g84KfK3AZsuonx38n8ad+f5ZgXtoSDxPOh" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정</title>

</head>
<body>
<pre>



</pre>

  <div class="container">
   <div class="card border-light mb-3">
	<form action="<c:url value="edit"/>" class="form-horizontal" id="frm" name="frm" method="post" enctype="multipart/form-data">
			
		<input type="hidden" name="r_no" value="${editWriteForm.r_no}">
		<input type="hidden" name="id" value="${editWriteForm.id}">

		
		<div class="row card-body">
			<div class="col-sm-3 col-xs-12">		
				<h2 style="text-align: center; color: black;">[${editWriteForm.title}]</h2>
			</div>
			<div class="col-sm-9 col-xs-12">
				<input class="form-control" id="r_title" name="r_title" placeholder="제목" type="text" value="${editWriteForm.r_title}" />
			</div>
		</div>
		
		<div class="row card-body" style="padding-top: 0px; padding-bottom: 0px;">
			<div class="col-sm-3 col-xs-12">
				<img class="img-fluid" src="${pageContext.request.contextPath}/upload/${editWriteForm.r_img}" width ="280px" height="400px"onerror="this.src='/resources/img/logo2.png'">
			</div>
			<div class="col-sm-9 col-xs-12">
				<textarea rows="15" class="form-control" id="r_content" name="r_content">${editWriteForm.r_content}</textarea>
			</div>
		</div>
		
		<div class="row card-body" style="text-align: left;" >
			<div class="col-sm-3 col-xs-12">
			</div>
			<div class="col-sm-9 col-xs-12">
				<input id="imgFile" name="imgFile" type="file"/>
			</div>
		</div>
		
		<div class="card-footer text-muted col-sm-12">
			<div class="col-sm-12" style="text-align : right;">
				<input type="button" type="submit" class="btn btn-outline-warning" value="저장"  onclick="boardIn();return false;">&emsp;
				<input type="button" class="btn btn-outline-secondary" value="뒤로가기" onclick="location.href='javascript:window.history.back();'">
			</div>
		</div>
	</form>
  </div>
  </div>
  
	<script type="text/javascript">
		function boardIn(){
			$('#frm').submit();
		}
	</script>

<%@ include file="../footer.jsp" %>

</body>
</html>