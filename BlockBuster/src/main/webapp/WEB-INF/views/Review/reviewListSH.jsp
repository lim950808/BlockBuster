<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html >
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
	table{
	width : 80%
	}
</style>

<title>리뷰게시판</title></head>
<body>

  
  
	<div align="center">
  	<h2>Review</h2>
  	<hr><br>
		 <h1>세션아이디 : ${sessionScope.sessionId}</h1> 
		<!-- 게시글 리스트 출력 -->
		<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
		
		<table id="list" class="table table-hover">
		
				<tr><th>글번호</th>
					<th>제 목</th>
					<th>추천수</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>
			
			<c:forEach var="reviewList" items="${reviewList}">
			
				<tr>
					<td>${reviewList.r_no}</td>
					<td><a href="reviewDetailSH?r_no=${reviewList.r_no}">[${reviewList.title}]&nbsp;${reviewList.r_title}&nbsp;[${reviewList.commentCnt}]</a></td>
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
	
	<div align="center">	
		
	    <!-- 검색기능 -->
		<form name="form1" method="post" action="search">
			<select name="search_option">
		        <option value="title">영상제목</option>
				<option value="r_title">글제목</option>
		    </select>
		    <input name="keyword" value="">
		    <input type="submit" value="조회">
		</form>
		
		
		<!-- 페이징처리 -->	
		<c:choose>
		    <c:when test="${pno eq null}">
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
		   <%--  <c:when test="${searchPage eq 7}">
				<c:if test="${pg.startPage > pg.pageBlock }">
					<a href="search?keyword=#{keyword}&currentPage=${pg.startPage-pg.pageBlock}">⬅︎</a>
				</c:if>
				
				<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
					<a href="search?keyword=#{keyword}&currentPage=${i}">[${i}]</a>
				</c:forEach>
				
				<c:if test="${pg.endPage < pg.totalPage }">
					<a href="search?keyword=#{keyword}&currentPage=${pg.startPage+pg.pageBlock}">➡︎︎</a>
				</c:if>
		    </c:when> --%>
		    
		    <c:otherwise>
				<c:if test="${pg.startPage > pg.pageBlock }">
					<a href="reviewProductList?pno=${pno}&currentPage=${pg.startPage-pg.pageBlock}">⬅︎</a>
				</c:if>
				
				<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
					<a href="reviewProductList?pno=${pno}&currentPage=${i}">[${i}]</a>
				</c:forEach>
				
				<c:if test="${pg.endPage < pg.totalPage }">
					<a href="reviewProductList?pno=${pno}&currentPage=${pg.startPage+pg.pageBlock}">➡︎︎</a>
				</c:if>
		    </c:otherwise>
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
	
<br><br><%@include file="../footer.jsp" %>
</body>
</html>