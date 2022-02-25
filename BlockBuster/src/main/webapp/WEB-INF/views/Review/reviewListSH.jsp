<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css" integrity="sha384-zEpdAL7W11eTKeoBJK1g79kgl9qjP7g84KfK3AZsuonx38n8ad+f5ZgXtoSDxPOh" crossorigin="anonymous">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE html >
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
	
	table{
		width : 80%
	}
	body{
		background-color : #333;
		font-family: 'Montserrat', sans-serif;
	}
	tr{
		color : white;
	}
	a:hover {
  		color : white;
	}
	
	.thChange th{
	border:0px;
	}
	
	.table th, .table td{
		vertical-align:middle;
		font-size:1rem;
	}
	.table td{
		height:60px;
	}
	
	.search-input input{
	    background-color: #2f2f2f;
	    color: #a5a5a5;
	    width: 400px;
	    height: 35px;
	    padding-left: 20px;
	    border-radius: 8px;
	    border: 1px solid #2f2f2f;
		float: center;
	}
	.search-input select{
	    background-color: #2f2f2f;
	    color: #a5a5a5;
	    width: 130px;
	    height: 35px;
	    padding-left: 20px;
	    border-radius: 8px;
	    border: 1px solid #2f2f2f;
		float: center;
	}
	.search-input option{
	    background-color: #2f2f2f;
	    color: #a5a5a5;
	    width: 130px;
	    height: 35px;
	    padding-left: 20px;
	    border-radius: 8px;
	    border: 1px solid #2f2f2f;
		float: center;
	}
	
	.cs-search-btn{
		background-color: #747474;
		font: 12px sans-serif;
	  	text-align: center;
	  	text-decoration: none;
		color: black;
		width: 130;
		height: 30;
	  	border: none;
	  	border-radius: 8px;
	  	padding: 10px 20px;
	  	margin: 4px 2px;
	  	display: inline-block;
	  	cursor: pointer;
	}
	.cs-search-btn:hover{
		background-color: #F5F5F5;
	}
	a{
	color : white;
	}
	a:hover {
	color:#ff7f00;
	}
	 
	#list:hover tr:hover td{
    background: #F5F5F5;
    color: black;
    }
    
    #revH {
	    font-size: 60px;
	    font-weight: bold;
	    font-family: 'Montserrat', sans-serif;
	    text-align: left;
	    color: #fff;
	    position: relative;
	    padding: 20px;
    }

	#rev a{
		text-decoration: none;
	}
	#rev a:hover{
		color:#000;
	}

	#rev{
	    min-width: 100%;
	    min-height: 100%;
		color: #b3b3b3;
		font-size: 20px;
		font-weight: bold;
		text-align: center;
		text-shadow: 0 0 7px #fff, 0 0 10px #fff, 0 0 21px #fff, 0 0 42px #ff7f00,
	    0 0 82px #ff7f00, 0 0 92px #ff7f00, 0 0 102px #ff7f00, 0 0 151px #ff7f00;   
	}	

</style>

<script type="text/javascript">

	/* 검색어 기입 여부 검증 */
	function searchCheck(){
		
		if(keyword.value.length == 0){
			alert("검색어를 입력해주세요.");
			keyword.focus();
			return;
		} 
		$('#form1').submit();
	}
	</script>


<title>리뷰게시판</title></head>
<body>
<pre>

</pre>
<div class="container">
    <input type="hidden" name="boardKind" value="${boardKind}">
  
  	<h2 id="revH" style="color:white;"><b>Review</b></h2>

	<div align="center">
  	
		<!-- 게시글 리스트 출력 -->
		<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
		
		<table id="list" class="table table-hover thChange" style="width:100%;">
		
			<tr	class = "table-active" style="text-align: center; background-color:#ff7f00; color: white">
				<th scope="row"><b>글번호</b></th>
				<th scope="row"><b>제 목</b></th>
				<th scope="row"><b>추천수</b></th>
				<th scope="row"><b>작성자</b></th>
				<th scope="row"><b>조회수</b></th>
				<th scope="row"><b>등록일</b></th>
			</tr>
			<c:choose>
				<c:when test="${searchResult eq 0 || reviewProListResult eq 0 || reviewListResult eq 0}"><!-- 리스트size로 검색결과 없음 확인 -->
					<tr>
						<td colspan="6" style="text-align: center;">검색 결과가 없습니다.  첫 번째 리뷰의 주인공이 되어 주세요.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="reviewList" items="${reviewList}">
					
						<tr class="list2" style="text-align: center;">
								<td>${reviewList.r_no}</td>
								<td style="text-align: left;" onclick="location.href='${pageContext.request.contextPath}/reviewDetailSH?r_no=${reviewList.r_no}'">[${reviewList.title}]&nbsp;${reviewList.r_title}&nbsp;[${reviewList.commentCnt}]</td>
								<td>${reviewList.good}</td>
								<td>${reviewList.nickName}</td>
								<td>${reviewList.r_hit}</td>
								<td>${reviewList.r_date}</td>
						</tr>
						
						<c:set var="num" value="${num - 1}"></c:set>
						
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	
	<br>
	
    <!-- 검색기능 -->
	<div align="center">	
		<form class="search-input" id="form1" name="form1" method="post" action="search">
			<select name="search_option">
		        <option value="title">영상제목</option>
				<option value="r_title">글제목</option>
				<option value="nickName">작성자</option>
		    </select>
		    <input id="keyword" name="keyword" value="">
		    <input type="hidden" name="Search_option" value="${Search_option}">
		    <button type="button"  onclick="searchCheck(); return false;" class="cs-search-btn" value="검색">검색</button>
		</form>
		
		
		
		<!-- 페이징처리 -->	
		<c:choose>
		    <c:when test="${boardKind eq '일반리뷰'}">
				<c:if test="${pg.startPage > pg.pageBlock }">
					<a href="${pageContext.request.contextPath}/reviewList?currentPage=${pg.startPage-pg.pageBlock}">⬅︎</a>
				</c:if>
				
				<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
					<a  href="${pageContext.request.contextPath}/reviewList?currentPage=${i}">[${i}]</a>
				</c:forEach>
				
				<c:if test="${pg.endPage < pg.totalPage }">
					<a href="${pageContext.request.contextPath}/reviewList?currentPage=${pg.startPage+pg.pageBlock}">➡︎︎</a>
				</c:if>
		    </c:when>
		    <c:when test="${boardKind eq '상품페이지'}">
				<c:if test="${pg.startPage > pg.pageBlock }">
					<a href="${pageContext.request.contextPath}/reviewProductList?pno=${pno}&currentPage=${pg.startPage-pg.pageBlock}">⬅︎</a>
				</c:if>
				
				<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
					<a href="${pageContext.request.contextPath}/reviewProductList?pno=${pno}&currentPage=${i}">[${i}]</a>
				</c:forEach>
				
				<c:if test="${pg.endPage < pg.totalPage }">
					<a href="${pageContext.request.contextPath}/reviewProductList?pno=${pno}&currentPage=${pg.startPage+pg.pageBlock}">➡︎︎</a>
				</c:if>
		    </c:when>
		    <c:when test="${boardKind eq '검색'}">
				<c:if test="${pg.startPage > pg.pageBlock }">
					<a href="${pageContext.request.contextPath}/search?keyword=${keyword}&currentPage=${pg.startPage-pg.pageBlock}&search_option=${Search_option}">⬅︎</a>
				</c:if>
				
				<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
					<a href="${pageContext.request.contextPath}/search?keyword=${keyword}&currentPage=${i}&search_option=${Search_option}">[${i}]</a>
				</c:forEach>
				
				<c:if test="${pg.endPage < pg.totalPage }">
					<a href="${pageContext.request.contextPath}/search?keyword=${keyword}&currentPage=${pg.startPage+pg.pageBlock}&search_option=${Search_option}">➡︎︎</a>
				</c:if>
		    </c:when>
		    
				
		</c:choose>
		
	<br><br>
		
	  <!-- 기타버튼 -->
	  <div id="rev">	
		<c:choose>
		    <c:when test="${pno eq null}">
		    	<a href="javascript:window.history.back();">뒤로가기</a> &nbsp;|&nbsp;
				<a href="reviewWriteForm">리뷰남기기</a>
		    </c:when>
		    <c:otherwise>
				<a href="javascript:window.history.back();">뒤로가기</a> &nbsp;|&nbsp;
				<a href="reviewWriteForm?pno=${pno}">${title} 리뷰남기기</a><!-- 상품번호를 매개변수로 글 작성 -->
		    </c:otherwise>
		</c:choose>
		<br>
	  </div>
	</div>
	<br><br><%@include file="../footer.jsp" %>
	</div>
</body>
</html>