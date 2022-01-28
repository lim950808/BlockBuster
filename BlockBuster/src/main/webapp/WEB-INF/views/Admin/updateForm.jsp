<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head>
<body>
<h2>영상 상세정보</h2>
<form action="update" method="post">
  <input type="hidden" name="pno" value="${product.pno }">
         
  <table>  
	<tr><th>품번</th><td>${product.pno }</td></tr>
	<tr><th>영상제목</th><td>
	    <input type="text" name="title" required="required" value="${product.title }" ></td></tr>
	<tr><th>대분류</th><td>
	    <input type="text" name="category" required="required" value="${product.category }"></td></tr>
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
	<tr><th>가격</th><td>
	    <input type="number" name="price" required="required" value="${product.price }"></td></tr>
	<tr><th>이미지</th><td>
	    <input type="text" name="p_img" value="${product.p_img }"></td></tr>
	<tr><th>영상 URL</th><td>
	    <input type="text" name="p_video" value="${product.p_video }"></td><tr>
	</tr>
	<tr><td colspan="2">
	   <input type="submit" value="수정완료">
	   </td>
	</tr>
</table>
</form>
<%@ include file="../footer.jsp" %>
</body>
</html>