<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp" %>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>영상 목록</title>

<style>
	hr{
		background-color:white;
	}
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
	a {
  		color : white;
	}

.bhtitle h1 {
	font-size:48px;
	font-weight:bold;
	font-family: 'Montserrat', sans-serif;
	text-align:left;
	color: white;
	letter-spacing:0px;
  	transition:1s;
  	-webkit-transition:1s;
  	-ms-transition:1s;
  	position: relative;
  	padding:10px;
}

.bhtitle h1:before
.bhtitle h1:after {
	  	content:"";
  	position: absolute;
  	height: 7px;
  	width: 0px;
  	background:#79ABFF;
  	transition:300ms;
  	-webkit-transition:1s;
  	-ms-transition:1s;
  	opacity:0.3;
  	left:50%;
}

.bhtitle h1:before {
  	bottom:0;
}

.bhtitle h1:after {
  	top:0;  
}

.bhtitle h1:hover{
	color: #5D5D5D;
}
.bhtitle h1:hover:before,
.bhtitle h1:hover:after{
	width: 95%;
	opacity:1;
	left:0;
  }
	
.page_wrap {
	text-align:center;
	align: center;
	font-size:0;
 }
.page_nation {
	display:inline-block;	
}
.page_nation .none {
	display:none;
}
.page_nation a {
	display:block;
	margin-left: 100px;
	margin:0 3px;
	float: left;
	border:1px solid #e6e6e6;
	width:28px;
	height:28px;
	line-height:28px;
	text-align:center;
	background-color:#fff;
	font-size:13px;
	color:#999999;
	text-decoration:none;
}
.page_nation .arrow {
	border:1px solid #ccc;
}
.page_nation .prev {
	background:#f8f8f8 no-repeat center center;
	margin-right:7px;
}
.page_nation .next {
	background:#f8f8f8 no-repeat center center;
	margin-left:7px;
}
.page_nation a.active {
	background-color:#42454c;
	color:#fff;
	border:1px solid #42454c;
}

.page_nation button{
	width: 70px;
	margin-left: 100px;
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
</head>
<body>
<pre>

</pre> 
<div class="container">
  <div class="bhtitle">
	<h1><b>영상 목록</b></h1>
  </div>
  

	   <div align="center">
	   <c:set var="num" value="${pg.total-pg.start+1 }"></c:set>
	
		<table id="list" class="table table-hover">
		
		<tr id = "headRow" style="text-align: center; background-color:#F5F5F5; color: black">
			<th><b>No</b></th>
			<th><b>품번</b></th>
			<th><b>제목</b></th>
			<th><b>대분류</b></th>
			<th><b>소분류</b></th>
			<th><b>가격(원)</b></th>
		</tr>
		
		<c:forEach var="product" items="${listProduct }">
		<tr style="text-align: center;">
			<td>${num }</td>
			<td>${product.pno }</td>
			<td><a href="${pageContext.request.contextPath}/detail?pno=${product.pno }">${product.title }</a></td>
			<td>${product.category }</td>
			<td>${product.genre }</td>
			<td>${product.price }</td>
		</tr>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:forEach>

		</table>

	</div> <!-- 전체 감싸는 container -->

	<br>
	
	<div class="page_wrap">

   	<div class="page_nation">
	<c:if test="${pg.startPage > pg.pageBlock}">
		<a class="arrow prev" href="${pageContext.request.contextPath}/Admin/productList?currentPage=${pg.startPage - pg.pageBlock}">⬅︎</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
		<a class="active" href="${pageContext.request.contextPath}/Admin/productList?currentPage=${i }">${i }</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage}">
		<a class="arrow next" href="${pageContext.request.contextPath}/Admin/productList?currentPage=${pg.startPage + pg.pageBlock}">➡︎</a>
	</c:if>
	<button type="button" onclick="location.href='${pageContext.request.contextPath}/Admin/writeForm';" class="button" id="btn">등록</button>
	</div>
	</div>
</div>	
<br><br><%@include file="../footer.jsp" %>
</body>
</html>