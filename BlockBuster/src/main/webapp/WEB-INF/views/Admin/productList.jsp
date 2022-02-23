<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<%@ include file="../header.jsp" %>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">  
<pre>

</pre>
<title>영상 목록</title>

<style type="text/css">
/* 	hr{
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
	} */

.bhtitle h2 {
	font-size: 60px;
	font-weight: bold;
	font-family: 'Montserrat', sans-serif;
	text-align: left;
	color: #fff;
  	position: relative;
  	padding: 20px; 
}

.b{
/* 	background: #ff7f00; */
	font-family: 'Montserrat', sans-serif;
	font-weight: 900;
	width: 100%;
	padding: 18px;
	border:	none;
} 
.b tr{
  	font-family: 'Montserrat', sans-serif;
  	text-align: left;
  	color: #fff;
  	cursor: pointer;
  	width: 100%;
  	padding: 18px;
} 

.b th{
	background: #ff7f00;
	font-family: 'Montserrat', sans-serif;
	font-weight: 900;
    height: 110px;
	border:	none;
	color: black;
}

.b td {
	border-bottom: 1px solid #F5F5F5;
    height: 50px;
}

.page_wrap {
	text-align:center;
	align: center;
	font-size:0;
 }
 
.table th, .table td{
	vertical-align:middle;
	font-size:1rem;
	}

.table td{
	height:60px;
}

#list:hover tr:hover td{
    background: #F5F5F5;
    color: black;
}
	
.button{
	background-color: #ff7f00;
	font: 12px sans-serif;
  	text-align: center;
  	text-decoration: none;
	color: black;
	width: 100;
	height: 30;
  	padding: 10px 20px;
  	border: none;
  	border-radius: 8px;
  	margin: 4px 2px;
  	display: inline-block;
  	cursor: pointer;
  	float: right;
}
button:hover{
	background-color: #F5F5F5;
}

a:link{color: white;}
a:visited{color: white;}
a:hover{color: black;}
/* a:visited { 
	color: white; 
} */
 
.pag{
	text-align: center;
}
.pag a{
	color: #F5F5F5;
	text-decoration: none;
}

.pag a:hover{
	color: #ff7f00;
}
	
</style>
</head>
<body>

<div class="container">
  <div class="bhtitle">
  <b><h2>영상 목록</h2></b>
  </div>
  
<pre>

</pre> 
<c:if test="${sessionScope.sessionId eq 'admin' }"> 
	   <div align="center">
	   <c:set var="num" value="${pg.total-pg.start+1 }"></c:set>
	
		<table id="list" class="b">
		
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
			<td><span style="color: white"><a href="${pageContext.request.contextPath}/Admin/detail?pno=${product.pno }">${product.title }</a></span></td>
			<td>${product.cat_name }</td>
			<td>${product.gen_name }</td>
			<td>${product.price }</td>
		</tr>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:forEach>

		</table>



	<%-- 	<tr><th>No</th><th>품번</th><th>제목</th><th>대분류</th><th>소분류</th><th>가격(원)</th></tr>
		<c:forEach var="product" items="${listProduct }">
			<tr><td>${num }</td><td>${product.pno }</td>
			<td><a href="detail?pno=${product.pno }">${product.title }</a></td>
				<td>${product.category }</td><td>${product.genre }</td><td>${product.price }</td></tr>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:forEach> --%>
		

	
	<br>
	
<!-- 	<div class="page_wrap"> -->

<!--    	<div class="page_nation"> -->
	
	<ul class="pag">
	<c:if test="${pg.startPage > pg.pageBlock}">
		<a class="arrow prev" href="${pageContext.request.contextPath}/Admin/productList?currentPage=${pg.startPage - pg.pageBlock}">⬅︎</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
		<a class="active" href="${pageContext.request.contextPath}/Admin/productList?currentPage=${i }">[${i}]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage}">
		<a class="arrow next" href="${pageContext.request.contextPath}/Admin/productList?currentPage=${pg.startPage + pg.pageBlock}">➡︎︎</a>
	</c:if>
	</ul>
	
<!-- 	</div> -->
<!-- 	</div> -->
	
<%-- 	<c:if test="${pg.startPage > pg.pageBlock}">
		<a href="/Admin/productList?currentPage=${pg.startPage - pg.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
		<a href="/Admin/productList?currentPage=${i }">[${i }]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage}">
		<a href="/Admin/productList?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
	</c:if>
	
	<button type="button" onclick="location.href='/Admin/writeForm';" class="button">등록</button> --%>
	
	<input type="button" value="등록" onclick="location.href='${pageContext.request.contextPath}/Admin/writeForm'" class="button"><p>
	
	   </div> <!-- align center 끝  -->
</c:if>

<br><br><%@include file="../footer.jsp" %>
</div> <!-- 전체 container 끝 -->
</body>
</html>