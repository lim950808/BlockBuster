<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Form</title>
<style>
.bhtitle h2 {
	font-size:60px;
	font-weight:bold;
	font-family: 'Montserrat', sans-serif;
	text-align:left;
	color:#fff;
  	position: relative;
  	padding:20px;
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
	font-weight: 900;
	width: 100%;
	padding: 18px;
	border-color: black;
	
}
.b tr{
  	font-family: 'Montserrat', sans-serif;
  	text-align: center;
  	color: #fff;
  	cursor: pointer;
  	/* width: 100%; */
  	padding: 18px;
} 

.b th{
	background: #ff7f00;
	font-family: 'Montserrat', sans-serif;
	font-weight: 1000;
	width: 350;
	height: 50;
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	color: black;
}

.b td {
	border-bottom: 1px solid #F5F5F5;
	border-top: 1px solid #F5F5F5; 
	border-right: 1px solid #F5F5F5;
    height: 50;
    text-align: center;
}

#list:hover tr:hover td{
    background: #F5F5F5;
    color: black;
}
</style>
</head>
<body>
<pre>

</pre>

<div class="container">
${sessionScope.id }

<div class=bhtitle>
	<b><h2>영상 수정</h2></b>
	</div>

<pre>

</pre>
<c:if test="${sessionScope.sessionId eq 'admin' }"> 
   	
   	<div align="center">
	<form action="${pageContext.request.contextPath}/Admin/update" method="post" id="form1" name="form1" enctype="multipart/form-data" target="myBatisFrame">
  	<input type="hidden" name="pno" value="${product.pno}">
          
    <table id="list" class="b">
    
     <tr id = "headRow" style="text-align: center; background-color:#F5F5F5; color: black">	
     
	<tr><th>품번</th><td>${product.pno }</td></tr>
	<tr><th>영상제목</th><td>
	    <input type="text" name="title" required="required" value="${product.title }" ></td></tr>
	<tr><th>대분류</th><td>
	    <input type="number" name="category" required="required" value="${product.category }"></td></tr>
	<tr><th>소분류</th><td>
	    <input type="number" name="genre" required="required" value="${product.genre }"></td></tr>
	<tr><th>제작연도</th><td>
	    <input type="number" name="year" required="required" value="${product.year }"></td></tr>
	<tr><th>제작국가</th><td>
	    <input type="text" name="country" required="required" value="${product.country }"></td></tr>
	<tr><th>감독</th><td>
	    <input type="text" name="director" value="${product.director }"></td></tr>
	<tr><th>출연진</th><td>
	    <input type="text" name="casting" value="${product.casting }"></td></tr>
	<tr><th>가격(원)</th><td>
	    <input type="number" name="price" required="required" value="${product.price }"></td></tr>
	<tr><th>줄거리</th><td>
	    <input type="text" name="description" value="${product.description }"></td></tr>
	<tr><th>이미지</th><td>
	    <input class="" id="imgFile" name="imgFile" type="file"></td></tr>
	<tr><th>영상 URL</th><td>
	    <input type="text" name="p_video" value="${product.p_video }"></td><tr>
	</tr>
	
	</tr>
</table>
</form>

	<br>
	
	<button form="form1" type="submit" class="btn btn-outline-primary">수정완료</button>
	
	<pre>
	
	</pre>
	</div> <!-- align center 끝 -->
<%@ include file="../footer.jsp" %>
	
</div> <!-- container 끝 -->
</c:if> <!-- 관리자한테만 보이게 -->

<pre>

</pre>
<script>
		function addFilePath(msg) {
			alert(msg);
			document.getElementById("form1").reset();
		}
</script>
	
</body>
</html>