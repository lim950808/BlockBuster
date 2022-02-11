<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 버튼 보이기 감추기 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- <script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script> -->
<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->


<%@ include file="../header.jsp" %>

<style>
	table{
		margin :15px;
		border-top: 1px #dee2e6;
	}
	h2{
		margin :15px;
	}
	
</style>

<script type="text/javascript">


		/* 게시글 삭제 전 check */
		function chk(){
			
			if (confirm("정말 삭제하시겠습니까? 삭제할 경우, 게시글 복원은 불가합니다.") == true){   
			    location.href="delete?r_no=${reviewDetail.r_no}"
			}else{  
			 	   return false;	
				 }
		}


		/* 댓글 리스트 출력 - 호출 */
		$(function(){
			listComment("1");
		}); 
		
		
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
				c_content.value.focus();
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
						alert("댓글이 등록되었습니다.");
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
				/* url : "${pageContext.request.contextPath}/commentList?r_no=${reviewDetail.r_no}&currentPage="+num, */
				url : "${pageContext.request.contextPath}/commentList?r_no=${reviewDetail.r_no}",
						
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
	            $("#heart").attr("src", "/resources/icon/heart-fill.svg");
	        } else {
	            console.log(userGood);
	            $("#heart").attr("src", "/resources/icon/heart.svg");
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
									$('#heart').prop("src","/resources/icon/heart-fill.svg");
									totalChange();
								} else if (data == 2){
									/* alert("delete 성공"); */
									$('#heart').prop("src","/resources/icon/heart.svg");
									totalChange();
								} else {
									alert("로그인 해 주세요.");
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

<title>리뷰상세보기</title></head>
<body>

${sessionScope.sessionId}

  <div class="container">
	<h2>[${reviewDetail.title}]&nbsp;${reviewDetail.r_title}</h2> 
	
	<table id="table1" class="table">
		<!-- 작성자 -->
		<tr>
			<td>
				작성자 : ${reviewDetail.nickName}&emsp;|&emsp;${reviewDetail.r_hit}&emsp;|&emsp;${reviewDetail.r_date}
			</td>
			<td>
				
				<c:choose>
				    <c:when test="${sessionScope.sessionId==SHgoodModel.id}">
						<a href="reviewEditFrom?r_no=${reviewDetail.r_no}">수정</a>
						<a href="#" onclick="chk(); return false;">삭제</a>
						<a href="#" onclick="imgchk(); return false;">이미지삭제</a>
				    </c:when>
				</c:choose>
			</td>
		</tr>
		
		<!-- 사진&내용 -->
		<tr>
			<td colspan="2"><img src="${pageContext.request.contextPath}/upload/${reviewDetail.r_img}" width ="280px" height="400px">&nbsp;${reviewDetail.r_content}</td>
		</tr>
		
		<tr>
			<td><input type="button" value="같은리뷰보기" onclick="location.href='reviewProductList?pno=${reviewDetail.pno}'">
				<input type="button" value="다른리뷰보기" onclick="location.href='reviewList'"></td>
			
			<!-- 추천기능 -->
			<td>
				<div>
					<a class="text-dark heart" style="text-decoration-line: none;">
						<label  id="goodClick"><img id="heart" src="/resources/icon/heart.svg"></label>
						<!-- <input type="submit" id="goodClick" value="추천" > -->
					<span id="totalGoodId">${totalGood}</span>
					</a>
				</div>
			</td>
		</tr>
	</table>
	
	
	
	  <!-- 댓글 작성 폼 -->
	<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
		<div class="row">
		
			<div class="col-sm-10">
				<textarea mexlength="300" id="c_content" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></textarea>
			</div>

			<div class="col-sm-2">
				<button type="button" class="btn btn-sm btn-primary" id="btnReplySave" onclick="insertComment()" style="width: 100%; margin-top: 10px"> 댓글등록 </button>
			</div>
			
		</div>
	</div>

	 
	 
	 
	<!-- 등록된 댓글 리스트 -->
	<div id="Commentlist">
		<%@ include file="commentListSH.jsp" %>
	</div>
	
  </div>
	
	
<%@ include file="../footer.jsp" %>


</body>
</html>