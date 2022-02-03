<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../header1.jsp" %>
<%-- <%@ include file="../menu.jsp" %> --%>

<div class="container mt-5">
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">
  <h2 id="company"><b>영상 정보</b></h2>
  <hr>
<pre>

</pre>
  <div class="row">
     <div class="col-md-4">
        <img class="card-img-top" src="${product.p_img}" alt="Card image cap">
     </div>
     <div class="col-md-8">
       <h3>${product.title}</h3>
       <p>${product.year }</p>
       <p>${product.country }</p>
       <p>${product.genre}</p>
       <hr class="my-4">
       
       <p>${product.description}</p>
       <p><form name="addForm" action="./addCart.jsp?pno=${product.pno}" method="post">
          <%-- <div class="col-md-2">
          <input type="hidden" name="rate"  id="rate" value="<%=rate%>">
          <input type="number" name="qty" value="0" class="form-control input-md">
          <br>
          </div> --%>
          	<%-- <a href="BookListAction.do?category=<%=rs.getString("category")%>" 
                 class="btn btn-secondary" role="button">&laquo; 이전</a> --%>
            <button onclick="history.back()">뒤로가기 &raquo;</button>
          	<a href="/Cart/cart.jsp" class="btn btn-success" onclick="addToCart()">주문하기</a>
          	<a href="/Review/reviewListSH.jsp" class="btn btn-danger">리뷰게시판</a>
          </form>
     </div>
  </div>
</div>
</div>
</div>
<pre>

</pre>

<%@ include file="../footer.jsp" %>
</body>
</html>