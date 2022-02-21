<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.bhtitle h1 {
	font-size:48px;
	font-weight:bold;
	font-family: 'Montserrat', sans-serif;
	text-align:center;
	color: white;
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
		font-family: 'Montserrat', sans-serif;
	}
	tr{
		color : white;
	}
	a {
  		color : white;
	}

</style>
</head>
<body>
<pre>

</pre>
<div class="container">
${sessionScope.id }
<div class=bhtitle>
<h1>영상 수정</h1></div>
<hr>

   	<div align="center">
	<form action="${pageContext.request.contextPath}/Admin/update" method="post" id=form1 enctype="multipart/form-data" target="myBatisFrame">
  	<input type="hidden" name="pno" value="${product.pno}">
          
  <table>  
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
	   <%--  <input type="file" class="" name="imgFile" value="${product.p_img }"></td></tr> --%>
	<tr><th>영상 URL</th><td>
	    <input type="text" name="p_video" value="${product.p_video }"></td><tr>
	</tr>
	<tr>
	   <th>
		   <td colspan="2">
		   	<input type="submit" value="수정완료">
		   </td>
	  	</th>
	</tr>
</table>
</form>
</div>
</div> <!-- align center 끝 -->
<pre>

</pre>
<script>
		function addFilePath(msg) {
			alert(msg);
			document.getElementById("form1").reset();
		}
</script>
	
<%@ include file="../footer.jsp" %>
</body>
</html>