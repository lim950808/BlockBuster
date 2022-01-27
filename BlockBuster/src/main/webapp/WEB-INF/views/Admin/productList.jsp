<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>영상 목록</h2><a href="productWriteForm">등록</a>
	<%-- <p>uptCnt 수정시 전달 Message : ${uptCnt } <p>
	<p>kk3 수정시 전달 Message : ${kk3 } <p> --%>
	
	<c:set var="num" value="${pg.total-pg.start+1 }"></c:set>
	
	<table>
		<tr><th>No</th><th>품번</th><th>제목</th><th>대분류</th><th>소분류</th><th>가격</th></tr>
		<c:forEach var="product" items="${listProduct }">
			<tr><td>${num }</td><td>${product.pno }</td>
			<td><a href="detail?pno=${product.pno }">${product.title }</a></td>
				<td>${product.category }</td><td>${product.genre }</td><td>${product.price }</td></tr>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:forEach>
	</table>
	<c:if test="${pg.startPage > pg.pageBlock }">
		<a href="list?currentPage=${pg.startPage - pg.pageBlock }">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
		<a href="list?currentPage=${i }">[${i }]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage }">
		<a href="list?currentPage=${pg.startPage + pg.pageBlock }">[다음]</a>
	</c:if>
	
<%@ include file="../footer.jsp" %>
</body>
</html>