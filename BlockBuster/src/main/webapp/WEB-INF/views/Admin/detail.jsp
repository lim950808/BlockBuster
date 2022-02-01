<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
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
	<h2>영상정보</h2>
	<table>
		<tr><th>품번</th><td>${product.pno }</td></tr>
		<tr><th>영상제목</th><td>${product.title }</td></tr>
		<tr><th>대분류</th><td>${product.category }</td></tr>
		<tr><th>소분류</th><td>${product.genre }</td></tr>
		<tr><th>제작연도</th><td>${product.year }</td></tr>
		<tr><th>제작국가</th><td>${product.country }</td></tr>
		<tr><th>감독</th><td>${product.director }</td></tr>
		<tr><th>출연진</th><td>${product.casting }</td></tr>
		<tr><th>가격(원)</th><td>${product.price }</td></tr>
		<tr><td colspan="2">
			<input type="button" value="목록"
				onclick="location.href='productList'">
			<input type="button" value="수정"
				onclick="location.href='updateForm?pno=${product.pno}'">
			<input type="button" value="삭제"
				onclick="location.href='delete?pno=${product.pno}'"></td></tr>
	</table>
<%@ include file="../footer.jsp" %>
</body>
</html>