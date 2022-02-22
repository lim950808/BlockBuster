<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html >
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<style type="text/css">
@CHARSET "UTF-8";

.bhtitle h2 {
	font-size: 60px;
	font-weight: bold;
	font-family: 'Montserrat', sans-serif;
	text-align: left;
	color: #fff;
  	position: relative;
  	padding: 20px; 
}

hr{
	background-color:white;
}

body{
	background-color : #333;
}

a {
	color : white;
}
	
.b{
	font-family: 'Montserrat', sans-serif;
	font-weight: 500;
	width: 100%;
	padding: 17px;
	border-color: black;
	
}
.b tr{
  	font-family: 'Montserrat', sans-serif;
  	text-align: center;
  	color: #fff;
  	cursor: pointer;
    /* width: 100%;  */
  	padding: 18px;
} 

.b th{
	background: #ff7f00;
	font-family: 'Montserrat', sans-serif;
	font-size: 16px;
	font-weight: 800; 
	width: 25%;
	height: 50px;
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	color: black;
}

.b td {
	font-size: 16px;
	border-bottom: 1px solid #F5F5F5;
	border-top: 1px solid #F5F5F5; 
	border-right: 1px solid #F5F5F5;
	width: 75%;
    height: 50px;
    text-align: center;
}

#list:hover tr:hover td{
    background: #F5F5F5;
    color: black;
}

/* .btn-area button {
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
} */

</style>

<title>Detail</title>
</head>

<body>
<pre>

</pre>

<c:if test="${sessionScope.sessionId eq 'admin' }"> 
<div class="container">
	<div class="bhtitle">
	<h2><b>영상 세부정보</b></h2>
	</div>
	
<pre>

</pre>
	<div align="center">
	
	<table id="list" class="b">
	
		<tr id = "headRow" style="text-align: center; background-color:#F5F5F5; color: black">	

		<tr><th>품번</th><td>${product.pno }</td></tr>
		<tr><th>영상제목</th><td>${product.title }</td></tr>
		<tr><th>대분류</th><td>${product.cat_name  }</td></tr>
		<tr><th>소분류</th><td>${product.gen_name }</td></tr>
		<tr><th>제작연도</th><td>${product.year }</td></tr>
		<tr><th>제작국가</th><td>${product.country }</td></tr>
		<tr><th>감독</th><td>${product.director }</td></tr>
		<tr><th>출연진</th><td>${product.casting }</td></tr>
		<tr><th>가격(원)</th><td>${product.price }</td></tr>
		<tr><th>줄거리</th><td>${product.description }</td></tr>
		<tr><th>이미지</th><td>${product.p_img }</td></tr>
		<tr><th>영상 URL</th><td>${product.p_video }</td></tr>
		
		</tr>
		
	</table>
	
		<br>
		<br>
		
		<div class=btn-area">
			<button type="button" class="btn btn-outline-secondary" value="목록" onclick="location.href='${pageContext.request.contextPath}/Admin/productList'">목록</button>
			<button type="button" class="btn btn-outline-primary" value="수정" onclick="location.href='${pageContext.request.contextPath}/Admin/updateForm?pno=${product.pno}'">수정</button>
			<button type="button" class="btn btn-outline-danger" value="삭제" onclick="location.href='${pageContext.request.contextPath}/Admin/delete?pno=${product.pno}'">삭제</button>
		</div>
		
		<%-- <div class=btn-area">
			<button type="button" value="목록" onclick="location.href='productList'">목록</button>
			<button type="button" value="수정" onclick="location.href='updateForm?pno=${product.pno}'">수정</button>
			<button type="button" value="삭제" onclick="location.href='delete?pno=${product.pno}'">삭제</button>
		</div>	20220201 11:29 --%>
		
			<%-- <input type="button" value="목록" onclick="location.href='productList'">
			<input type="button" value="수정" onclick="location.href='updateForm?pno=${product.pno}'">
			<input type="button" value="삭제" onclick="location.href='delete?pno=${product.pno}'"></td></tr> --%>
			
<br><br><%@include file="../footer.jsp" %>
</div> <!-- container 끝 -->
</c:if>

</body>
</html>