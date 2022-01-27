<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<%@ include file="../menu.jsp" %>

<div class="container mt-5">
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">
  <h2 id="company"><b>${category }</b></h2>
  <hr>
<pre>

</pre>
		<div class="row" align="center">   	
	      <c:forEach  var="product" items="${productlist}">
		      <div class="col-md-4">
		        <%-- <img src="./resources/images/${book.filename}" style="width:100%"> --%>
		        <img src="${product.p_img}" style="width:100%">
		        <h3>${product.title}</h3>
		        <p>${product.description}</p>
		        <p>${product.price}원</p>
		        <!-- 링크태그 이동은 get방식 이동 -->
		        <p><a href="product.jsp?id=${product.pno}" 
		            class="btn btn-success" role="button">상품정보 &raquo;</a>
		      </div>
	      </c:forEach>
	   </div>
	   <div class="col-sm-1"></div>
</div>
</div> 
<pre>

</pre>
<%@ include file="../footer.jsp" %>
</body>
</html>