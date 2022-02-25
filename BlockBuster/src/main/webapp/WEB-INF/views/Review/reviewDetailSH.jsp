<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 버튼 보이기 감추기 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css" integrity="sha384-zEpdAL7W11eTKeoBJK1g79kgl9qjP7g84KfK3AZsuonx38n8ad+f5ZgXtoSDxPOh" crossorigin="anonymous">

<script type="text/javascript">


	/* 게시글 삭제 전 check */
	function chk(){
		
		if (confirm("정말 삭제하시겠습니까? 삭제할 경우, 게시글 복원은 불가합니다.") == true){   
		    location.href="delete?r_no=${reviewDetail.r_no}"
		}else{  
		 	   return false;	
			 }
	}

	
	/* 게시글 이미지 삭제 전 check */
	function imgchk(){
		
		if (confirm("수정하기로 새로운 이미지를 넣을 수 있습니다. 현재 이미지만 삭제하시겠습니까?") == true){   
		    location.href="imgDelete?r_no=${reviewDetail.r_no}"
		}else{  
		 	   return false;	
			 }
	}
	

	/* 댓글 리스트 출력 - 호출 */
	$(function(){
		listComment("1");
	}); 

	
	/* 댓글 입력 */
	//댓글 입력 검증
	function insertComment(){

		c_content.value = c_content.value.trim();
		
		if(c_content.value.length == 0){
			alert("댓글을 입력해주세요.");
			c_content.focus();
			return;
		}
		insertComment2();
	}
	
	//댓글 검증 되면 등록
	function insertComment2(){
		
		var r_no="${reviewDetail.r_no}";/* 게시글 번호 */
		var c_content=$("#c_content").val();/* 댓글 내용 */
		
			$.ajax({
				type : 'post',
				url : "${pageContext.request.contextPath}/commentInsert",
				data : {'r_no' : r_no, 'c_content' : c_content},
				dataType : 'text',
				
				success : function(data){
					if(data>0){
					alert("댓글이 등록되었습니다.");
					}else{
					alert("댓글 등록에 실패하였습니다.");
					}
					listComment("1");
					$('#c_content').val("");
				}
			}); 
	 }
	
	
	/* 댓글 리스트 출력 */
	function listComment(Vnum){
		
		var num = Vnum;
		
		$.ajax({
			type : 'post',
			url : "${pageContext.request.contextPath}/commentList?r_no=${reviewDetail.r_no}&currentPage="+num,
					
			success : function(data){
				$("#Commentlist").html(data);	//이전 내용을 지우고 HTML 태그를 포함하여 선택한 요소 안의 새로운 내용을 넣습니다				
			}
		});
	 } 
	
	
	/* 게시글 추천 기능 */
	$(function () {
	
		// 추천 여부 확인
        var userGood = ${userGood};
        
        // userGood이 1이면 좋아요가 이미 되있는것이므로 heart-fill.svg를 출력하는 코드
        if(userGood>0) {
            console.log(userGood);
            $("#heart").attr("src", "${pageContext.request.contextPath}/resources/icon/heart-fill.svg");
        } else {
            console.log(userGood);
            $("#heart").attr("src", "${pageContext.request.contextPath}/resources/icon/heart.svg");
        }

			// 좋아요 버튼을 클릭 시 실행되는 코드
	        $("#goodClick").on("click", function () {
			    $.ajax({
			    	url :'${pageContext.request.contextPath}/checkGood',
			        type :'POST',
			        data : {'r_no' : ${SHgoodModel.r_no}, 'id' : '${sessionScope.sessionId}'},
			        
			        error : function(){
			        	Rnd.alert("통신 에러","error","확인",function(){});
			        	},
			    	success : function(data){
				    		if(data == 1){
								/* alert("insert 성공"); */
								$('#heart').attr("src","${pageContext.request.contextPath}/resources/icon/heart-fill.svg");
								totalChange();
							} else if (data == 2){
								/* alert("delete 성공"); */
								$('#heart').attr("src","${pageContext.request.contextPath}/resources/icon/heart.svg");
								totalChange();
							} else {
								alert("실패");
							}
		             	}
			    });
	        });/* goodClick end */
	});
	 
	
	//추천 전체 개수 출력
	function totalChange(){
		 $.ajax({
		    	url :'${pageContext.request.contextPath}/totalGood',
		        type :'POST',
		        data : {'r_no' : ${SHgoodModel.r_no}},
		        
		        error : function(){
		        	Rnd.alert("통신 에러","error","확인",function(){});
		        	},
		    	success : function(data){
		    		
		    		if(data !== null){
							document.getElementById("totalGoodId").innerHTML = data;
		    		} else { 
							alert("전체 개수 확인 실패");
		    		}
	             }
		    });
	}

		
</script>

<style>
	.col-sm-2 button{
		background-color: #ff7f00;
		font: 12px sans-serif;
	  	text-align: center;
	  	text-decoration: none;
		color: black;
	  	border: none;
	  	border-radius: 8px;
	  	margin: 4px 2px;
	  	display: inline-block;
	  	float: right; 	
	}
	.col-sm-2 button:hover{
		background-color: #F5F5F5;
		color:black;
	}	
		
</style>

<title>리뷰상세보기</title></head>
<body>
<pre>



</pre>
  <div class="container">

	<div class="card border-light mb-3">
		<h3 class="card-header" style="color: black; background-color: #F7F7F7;">[${reviewDetail.title}]&nbsp;${reviewDetail.r_title}</h3>
		<h6 class="card-subtitle text-muted" style="margin-top:1px; background-color: #F7F7F7;">&emsp;작성자 : ${reviewDetail.nickName}&emsp;|&emsp;${reviewDetail.r_hit}&emsp;|&emsp;${reviewDetail.r_date}</h6>
	  
		<div class="card-body" style="color: black; background-color: #F7F7F7;">
			<img class="img-fluid" src="${pageContext.request.contextPath}/upload/${reviewDetail.r_img}" width ="280px" height="400px"onerror="this.src='/resources/img/logo2.png'">&nbsp;${reviewDetail.r_content}
		</div>
		
		
		
		<div class="card-footer text-muted col-sm-12">
			<div class="row">
				<div class="col-sm-4" >
					<input type="button" class="btn btn-outline-secondary" value="같은리뷰보기" onclick="location.href='reviewProductList?pno=${reviewDetail.pno}'">
					<input type="button" class="btn btn-outline-secondary" value="다른리뷰보기" onclick="location.href='reviewList'">
				</div>
				
				<div class="col-sm-4" style="text-align : center; vertical-align: middle;">
					<a class="text-dark heart" style="text-decoration-line: none;">
						<label  id="goodClick"><img id="heart" src="/resources/icon/heart.svg"></label>
					<span id="totalGoodId">${totalGood}</span>
					</a>
				</div>
				
				<div style="text-align : right; vertical-align: middle;" class="col-sm-4">
					<c:choose>
						<c:when test="${sessionScope.sessionId==reviewDetail.id}">
							<a href="reviewEditForm?r_no=${reviewDetail.r_no}" class="text-muted" >수정</a>&emsp;
							<a href="" class="text-muted" onclick="chk(); return false;">삭제</a>&emsp;
							<a href="" class="text-muted" onclick="imgchk(); return false;">이미지삭제</a>&emsp;
						</c:when>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	  <!-- 댓글 작성 폼 -->
		<div class="card-body col-sm-12" style="padding-left: 0px;">
		
		  <div class="form-group">
			<div class="col-sm-10" style="float: left; padding-left: 0px;">
				<textarea mexlength="300" id="c_content" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></textarea>
			</div> 
		  </div> 


			 <div class="col-sm-2" style="float: left;">
				<button type="button" class="btn btn-warning" id="commentSubmit" onclick="insertComment()" style="width: 100%; margin-top: 10px"> 댓글등록 </button>
			</div>

			
		</div><br><br><br><br>


	<!-- 등록된 댓글 리스트 -->
	<div id="Commentlist"><!-- 댓글 페이지 처리 시에 get방식에 사용할 블록 -->
		<%@ include file="commentListSH.jsp" %>
	</div>
	
  </div>
	
	
<%@ include file="../footer.jsp" %>


</body>
</html>