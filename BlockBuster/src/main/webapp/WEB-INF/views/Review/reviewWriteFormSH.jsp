<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl을 사용하기 위한 선언 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 작성하기</title>

<script type="text/javascript">

	function getRecommendWords(){
		var str="";
		var str2="";
		$.ajax({
					url : "${pageContext.request.contextPath}/SearchWord",
					dataType:'json',
					success:function(data){
						str += "<datalist id='searchingist'>";
							$(data).each(
								function(){
									
									str2 = "<option value='"+this.title+"'/>";
									
									str += str2;
									}		
							);
						str += "</datalist>";
						$('#words').append(str);
					}
				}
			);
	}
	
	function insertCheck(){
		
		var title=$('#words').val();/* 영상제목 */
		
			$.ajax({
				type : 'post',
				data : {'title' : title},
				url : "${pageContext.request.contextPath}/checkTitle",
				dataType : 'text',
				
				success : function(data){
					if(data==0){
						alert("영상 제목을 확인해 주세요.");
						title.value.focus();
						return;
					}
					if(r_title.value.length == 0){
						alert("제목을 입력해주세요.");
						r_title.value.focus();
						return;
					}
					if(r_content.value.length == 0){
						alert("내용을 입력해주세요.");
						r_content.value.focus();
						return;
					}
					$('#frm').submit();
				}
			}); 
	} 

</script>
 

	<div class="container">
	
	
		<!-- 파일 등록을 위해 enctype="multipart/form-data" 을 선언 -->
		<form action="<c:url value="reviewWrite"/>" class="form-horizontal" id="frm" name="frm" method="post" enctype="multipart/form-data">

			<div class="form-group row">
	 			<input name="id" value="${sessionScope.id}">
			</div>


		    <!-- 검색기능 -->
		    
			<div class="form-group row">
				<label class="col-sm-2 col-xs-12 col-form-label" for="title">영화제목</label>
				<div class="col-sm-10 col-xs-12">
				    <input class="form-control mr-sm-2" type="text" autofocus="autofocus" name="title" id="words" list="searchingist" onkeydown="getRecommendWords()" placeholder="키워드 입력" value=""/>
				</div>
			</div>

  


			<!-- class에 사용되는 form-group, row 등은 부트스트랩에서 사용되는 class -->
			<div class="form-group row">
				<label class="col-sm-2 col-xs-12 col-form-label" for="title">글제목</label>
				<div class="col-sm-10 col-xs-12">
					<input class="form-control" id="r_title" name="r_title" placeholder="제목" type="text" value="" />
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
					<a class="btn btn-success" type="submit" onclick="insertCheck();return false;" role="button" title="저장"><i class="fa fa-save"></i> 저장</a>
					<a class="btn btn-primary" href="javascript:window.history.back();" role="button" title="리스트"><i class="fa fa-list-ul"></i> 리스트</a>
				</div>
			</div>
	
		</form>
	</div>


</body>
</html>