<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <h2 id="company"><b>상품 정보</b></h2>
  <hr>
<pre>

</pre>
<div class="container">
  <div class="row">
     <div class="col-md-5">
        <img src="${product.p_img}" style="width:100%">
     </div>
     <div class="col-md-6">
       <h3>${product.title}</h3>
       <p>${product.year }
       <p>${product.country }
       <p>${product.genre}
       <p>${product.description}
       <p><form name="addForm" action="./addCart.jsp?pno=${product.pno}" method="post">
          <div class="col-md-2">
          <input type="hidden" name="rate"  id="rate" value="<%=rate%>">
          <input type="number" name="qty" value="0" class="form-control input-md">
          <br>
          </div>
          	<a href="BookListAction.do?category=<%=rs.getString("category")%>" 
                 class="btn btn-secondary" role="button">&laquo; 이전</a>
          	<a href="#" class="btn btn-success" onclick="addToCart()">상품주문 &raquo;</a>
          	<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
          </form>
     </div>
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