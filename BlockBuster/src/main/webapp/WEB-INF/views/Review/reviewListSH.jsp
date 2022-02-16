<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html >
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
	
	hr{
		background-color:white;
	}
	table{
		width : 80%
	}
	body{
		background-color : #333;
	}
	tr{
		color : white;
	}
	a {
  		color : white;
	}
</style>

<title>리뷰게시판</title></head>
<body>
<pre>

</pre>
<div class="container">
 	    <input type="hidden" name="boardKind" value="$(boardKind)">
  
  
  	<h1 style="color:white;"><b>Review</b></h1>
<pre>

</pre>
	<div align="center">
  	
		 <%-- <h1>세션아이디 : ${sessionScope.sessionId}</h1>  --%>
		<!-- 게시글 리스트 출력 -->
		<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
		
		<table id="list" class="table success">
		
				<tr id = "headRow" style="text-align: center; background-color:#F5F5F5; color: black">
					<th><b>글번호</b></th>
					<th><b>제 목</b></th>
					<th><b>추천수</b></th>
					<th><b>작성자</b></th>
					<th><b>조회수</b></th>
					<th><b>등록일</b></th>
				</tr>
			
			<c:forEach var="reviewList" items="${reviewList}">
			
				<tr style="text-align: center;">
					<td>${reviewList.r_no}</td>
					<td style="text-align: left;"><a href="reviewDetailSH?r_no=${reviewList.r_no}">[${reviewList.title}]&nbsp;${reviewList.r_title}&nbsp;[${reviewList.commentCnt}]</a></td>
					<td>${reviewList.good}</td>
					<td>${reviewList.nickName}</td>
					<td>${reviewList.r_hit}</td>
					<td>${reviewList.r_date}</td>
				</tr>
				
				<c:set var="num" value="${num - 1}"></c:set>
				
			</c:forEach>
			
		</table>
	</div>
	
	<br>
	
		<hr><br>
	<div align="center">	
	    <!-- 검색기능 -->
		<form name="form1" method="post" action="search">
			<select name="search_option">
		        <option value="title">영상제목</option>
				<option value="r_title">글제목</option>
				<option value="nickName">작성자</option>
		    </select>
		    <input name="keyword" value="">
		    <input type="hidden" name="Search_option" value="$(Search_option)">
		    <input type="submit" value="조회">
		</form>
		
		
		<!-- 페이징처리 -->	
		<c:choose>
		    <c:when test="${boardKind eq '일반리뷰'}">
				<c:if test="${pg.startPage > pg.pageBlock }">
					<a href="reviewList?currentPage=${pg.startPage-pg.pageBlock}">⬅︎</a>
				</c:if>
				
				<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
					<a href="reviewList?currentPage=${i}">[${i}]</a>
				</c:forEach>
				
				<c:if test="${pg.endPage < pg.totalPage }">
					<a href="reviewList?currentPage=${pg.startPage+pg.pageBlock}">➡︎︎</a>
				</c:if>
		    </c:when>
		    <c:when test="${boardKind eq '상품페이지'}">
				<c:if test="${pg.startPage > pg.pageBlock }">
					<a href="reviewProductList?pno=${pno}&currentPage=${pg.startPage-pg.pageBlock}">⬅︎</a>
				</c:if>
				
				<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
					<a href="reviewProductList?pno=${pno}&currentPage=${i}">[${i}]</a>
				</c:forEach>
				
				<c:if test="${pg.endPage < pg.totalPage }">
					<a href="reviewProductList?pno=${pno}&currentPage=${pg.startPage+pg.pageBlock}">➡︎︎</a>
				</c:if>
		    </c:when>
		    <c:when test="${boardKind eq '검색'}">
				<c:if test="${pg.startPage > pg.pageBlock }">
					<a href="search?keyword=${keyword}&currentPage=${pg.startPage-pg.pageBlock}&search_option=${Search_option}">⬅︎</a>
				</c:if>
				
				<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
					<a href="search?keyword=${keyword}&currentPage=${i}&search_option=${Search_option}">[${i}]</a>
				</c:forEach>
				
				<c:if test="${pg.endPage < pg.totalPage }">
					<a href="search?keyword=${keyword}&currentPage=${pg.startPage+pg.pageBlock}&search_option=${Search_option}">➡︎︎</a>
				</c:if>
		    </c:when>
		    
				
		</c:choose>
		
		
		
	  <!-- 기타버튼 -->
	  <div>	
		<c:choose>
		    <c:when test="${pno eq null}">
				<a href="reviewWriteForm">리뷰남기기</a>
		    </c:when>
		    <c:otherwise>
				<a href="javascript:window.history.back();">뒤로가기</a> &nbsp;|&nbsp;
				<a href="reviewWriteForm?pno=${pno}">${title} 리뷰남기기</a>
		    </c:otherwise>
		</c:choose>
		<br>
	  </div>
	</div>
	</div>
<br><br><%@include file="../footer.jsp" %>
</body>
</html>