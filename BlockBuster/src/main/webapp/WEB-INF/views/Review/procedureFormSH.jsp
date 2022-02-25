<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
	#head {
	    font-size: 60px;
	    font-weight: bold;
	    font-family: 'Montserrat', sans-serif;
	    text-align: left;
	    color: #fff;
	    position: relative;
	    padding: 20px;
	    }
</style>


<script type="text/javascript">

	/* 한줄인사 리스트 출력 - 호출 */
	$(function(){
		cursorList();
	}); 
	
	
	//한줄인사 입력 검증
	function procedureCall(){
		q_content.value = q_content.value.trim();
		
		if(q_content.value.length == 0){
			alert("내용을 입력해주세요.");
			q_content.focus();
			return;
		}
		insertProcedure();
	}
	
	//한줄인사 검증 되면 등록
	function insertProcedure(){
		
		var id=$("#id").val();
		var nickName=$("#nickName").val();
		var q_content=$("#q_content").val();
		
			$.ajax({
				type : 'post',
				url : "${pageContext.request.contextPath}/insertProcedure",
				data : {'id' : id, 'nickName' : nickName, 'q_content' : q_content},
				dataType : 'text',
				
				success : function(data){
					if(data == 1){
					alert("한줄인사가 등록되었습니다.");
					}else{
					alert("한줄인사 등록에 실패하였습니다.");
					}
					cursorList();
					$('#q_content').val("");
				}
			}); 
	 }
	
	//한줄인사 리스트 출력 
	function cursorList(){
		
		$.ajax({
			type : 'post',
			url : "${pageContext.request.contextPath}/cursorList",
					
			success : function(data){
				$("#QWList").html(data);	//이전 내용을 지우고 HTML 태그를 포함하여 선택한 요소 안의 새로운 내용을 넣습니다				
			}
		});
	 }

</script>

</head>
<body>
  <div class="container">
	<h2 id="head">한줄인사</h2>
	
		
		  <div class="form-group col-sm-12" style="padding: 0px;">
			<div class="col-sm-12">
				<input id="id" type="hidden" name="id" value="${sessionScope.sessionId}"  placeholder="${sessionScope.sessionId}" readonly/>
				<input id="nickName" type="hidden" name="nickName" value="${sessionScope.Nickname}"  placeholder="${sessionScope.Nickname}" readonly/>
				<textarea mexlength="300" id="q_content" class="form-control" rows="3" placeholder="한줄인사를 입력해 주세요"></textarea>
			</div> 
			 <div class="col-sm-2" style="float:right;">
				<button type="button" class="btn btn-warning" onclick="procedureCall()" style="width: 100%; margin-top: 10px"> 등  록 </button>
			</div>
		</div>
		<br><br><br>
	 
	<!-- 등록된 한줄인사 리스트 -->
	<div id="QWList" class="col-sm-12">
		<%@ include file="cursorListSH.jsp" %>
	</div>
	<br><br><br>
	<%@ include file="../footer.jsp" %>
  </div>
  
</body>
</html>