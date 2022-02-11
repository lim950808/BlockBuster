<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp" %>
<%-- <%@ include file="../menu.jsp" %> --%>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@CHARSET "UTF-8";
body {	font-family: 굴림체; text-align: center;	}
table { border: 1px solid pink; width: 100%; 
         }
tr { height: 30px; background: yellow; }
/* th {	background: #C9BFED;	} */
th {	background: #b9b973;	}
td {	background: #f9f3b3;	}
</style>
</head>
<body>

	<h2>영상 목록</h2><a href="/Admin/writeForm">등록</a>
	<%-- <p>uptCnt 수정시 전달 Message : ${uptCnt } <p>
	<p>kk3 수정시 전달 Message : ${kk3 } <p> --%>
	
	<c:set var="num" value="${pg.total-pg.start+1 }"></c:set>
	
	<table>
		<tr><th>No</th><th>품번</th><th>제목</th><th>대분류</th><th>소분류</th><th>가격(원)</th></tr>
		<c:forEach var="product" items="${listProduct }">
			<tr><td>${num }</td><td>${product.pno }</td>
			<td><a href="detail?pno=${product.pno }">${product.title }</a></td>
				<td>${product.category }</td><td>${product.genre }</td><td>${product.price }</td></tr>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:forEach>
	</table>
	<%-- <c:if test="${pg.startPage > pg.pageBlock }">
		<a href="<%=context %>/Admin/productList?currentPage=${pg.startPage - pg.pageBlock }">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
		<a href="<%=context %>/Admin/productList?currentPage=${i }">[${i }]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage }">
		<a href="<%=context %>/Admin/productList?currentPage=${pg.startPage + pg.pageBlock }">[다음]</a>
	</c:if> --%>
	<c:if test="${pg.startPage > pg.pageBlock }">
		<a href="/Admin/productList?currentPage=${pg.startPage - pg.pageBlock }">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
		<a href="/Admin/productList?currentPage=${i }">[${i }]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage }">
		<a href="/Admin/productList?currentPage=${pg.startPage + pg.pageBlock }">[다음]</a>
	</c:if>
<pre>

</pre>
<%@ include file="../footer.jsp" %>
</body>
</html>