<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html >
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<style type="text/css">
@CHARSET "UTF-8";
h1 {
	font-size:48px;
	font-weight:bold;
	font-family: 'Montserrat', sans-serif;
	text-align:center;
	color:#0000DB;
	letter-spacing:0px;
  	transition:1s;
  	-webkit-transition:1s;
  	-ms-transition:1s;
  	position: relative;
  	padding:10px;
}

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
	
.b{
	border:	none;
	width: 100%;
	font-weight: 900;
	background: #ffd800;
	padding: 18px;
}

.btn-area button {
	width: 70px;
	margin-left: 300px;
	height: 28px;
	background: #166cea;
	color: #fff;
	font-size: 15px;
	border: none;
	border-radius: 12px;
	cursor: pointer;
	align: right;
}

</style>

<title>상세보기</title>
</head>
<body>
<pre>

</pre>

<div class="container">

	<h1 style="color:white;"><b>영상 세부정보</b></h1>
	
	<div align="center">
	
	<table id="list" class="table table-hover">
	
		<tr id = "headRow" style="text-align: center; background-color:#F5F5F5; color: black">	
		<tr style="text-align: center;">
		
		<tr><th>품번</th><td>${product.pno }</td></tr>
		<tr><th>영상제목</th><td>${product.title }</td></tr>
		<tr><th>대분류</th><td>${product.category }</td></tr>
		<tr><th>소분류</th><td>${product.genre }</td></tr>
		<tr><th>제작연도</th><td>${product.year }</td></tr>
		<tr><th>제작국가</th><td>${product.country }</td></tr>
		<tr><th>감독</th><td>${product.director }</td></tr>
		<tr><th>출연진</th><td>${product.casting }</td></tr>
		<tr><th>가격(원)</th><td>${product.price }</td></tr>
		<tr><th>줄거리</th><td>${product.description }</td></tr>
		<tr><th>이미지</th><td>${product.p_img }</td></tr>
		<tr><th>영상 URL</th><td>${product.p_video }</td></tr>
		
		</tr>
		</tr>
	</table>
	
		<div class=btn-area>
			<button type="button" value="목록" onclick="location.href='productList'">목록</button>
			<button type="button" value="수정" onclick="location.href='updateForm?pno=${product.pno}'">수정</button>
			<button type="button" value="삭제" onclick="location.href='delete?pno=${product.pno}'">삭제</button>
		</div>	
		
			<%-- <input type="button" value="목록" onclick="location.href='productList'">
			<input type="button" value="수정" onclick="location.href='updateForm?pno=${product.pno}'">
			<input type="button" value="삭제" onclick="location.href='delete?pno=${product.pno}'"></td></tr> --%>
			
</div> <!-- container 끝 -->
<br><br><%@include file="../footer.jsp" %>
</div>
</body>
</html>