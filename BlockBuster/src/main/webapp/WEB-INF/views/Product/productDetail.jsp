<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/user/shop/default.css" />
<link rel="stylesheet" href="/css/style.css">
<style>
		div.products div.p_img { float:left; width:350px; }
		div.products div.p_img img { width:350px; height:auto; }
		
		div.products div.info { float:right; width:330px; font-size:22px; }
		div.products div.info p { margin:0 0 20px 0; }
		div.products div.info p span { display:inline-block; width:100px; margin-right:15px; } 

		div.products div.info p.addToCart { text-align:right; }
		div.products div.info p.addToCart button { font-size:22px; padding:5px 10px; border:1px solid #eee; background:#eee;}
		div.products div.description { font-size:18px; clear:both; padding-top:30px; }
	</style>
	
	<style>
		div.replyModal { position:relative; z-index:1; display:none; }
		div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
		div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:500px; height:250px; padding:20px 10px; background:#fff; border:2px solid #666; }
		div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px; height:200px; }
		div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
		div.modalContent button.modal_cancel { margin-left:20px; }
	</style>
</head>
<body>
<%-- <%@ include file="../header1.jsp" %> --%>
<pre>

</pre>
<div id="root">
	
	<section id="container">
		<div id="container_box">
		
			<section id="content">
				
				<form role="form" method="post">
					<input type="hidden" name="pno" value="${product.pno}" />
				</form>
				
				<div class="products"><!-- <div class="goods"> -->
					<div class="p_img"><!-- <div class="goodsImg"> -->
						<img src="${product.p_img}">
					</div>
					
					<div class="info">
						<p class="title">${product.title}</p>
						<p class="genre">${product.genre}</p>
						<p class="year">${product.year}</p>
						<p class="director">${product.director}</p>
						<p class="casting">${product.casting}</p>					
						<p class="price">
							<fmt:formatNumber pattern="###,###,###" value="${product.price}" /> 원
						</p>
						<form action="/Cart/list" method="post" onsubmit="return cartAlert();">
						<script>
						function cartAlert(){
							var cartAlert = confirm("장바구니에 담으시겠습니까?");
							if(cartAlert){
								return true;
							}else{
								return false;
							}						
						}
						</script>
						<div class="add_to_cart">
		              		<input type="submit" value="장바구니" class="btn_3">
		              	</div>
						</form>
						<!-- <p class="addToCart">
							<button type="button" class="addCart_btn">장바구니</button>
							<script>
								$(".addCart_btn").click(function(){
									
									var pno = $("#pno").val();
									var data = {pno : pno};
									
									$.ajax({
										url : "/Product/productDetail/addCart",
										type : "post",
										data : data,
										success : function(result){
											
											if(result == 1) {
												alert("카트 담기 성공");
											} else {
												alert("회원만 사용가능")
											}
										},
										error : function(){
											alert("카트 담기 실패");
										}
									});
								});
							</script>
						</p> -->
					</div>
					
					<div class="description">${product.description}</div>
				</div>
				</section>
				</div>
				</section>
				</div>
				
<%-- <div class="wrapper">
<div class="wrap">
<h1 id="company"><b>영상 정보</b></h1>
<div class="line"></div>
<pre>

</pre>
<div class="content_top">
     <div class="ct_left_area">
        <div class="image_wrap">
        	<img src="${product.p_img}" alt="image_wrap">
        </div>
     </div>
     <div class="ct_right_area">
		<div class="title">
       		<h1>${product.title}</h1>
       	</div>
       	<div class="line"></div>
        <div class="content">
        	${product.year }<br>
       		${product.country }<br>
       		${product.genre}<br>
       		${product.description}
	       	<div class="button">
	          	<a href="/Review/reviewListSH.jsp?pno=${product.pno}" class="btn btn-danger">리뷰게시판</a>
	       		<p class="addToCart">
	       			<!-- <button type="button" class="addCart_btn">주문하기</button> -->
	       			<input type="button" value="주문하기" onclick="location.href='/Cart/cartList'">
	       			<script>
	       				$(".addCart_btn").click(function(){
	       					var pno = $("#pno").val();
	       					console.log("pno : " + pno);
	       					var data = {pno : pno};
	       					
	       					$.ajax({
	       						url : "/Product/productDetail/addCart",
	       						type : "post",
	       						data : data,
	       						success : function(result){
	       							if(result == 1) {
	       								alert("카트 담기 성공");
	       							}else {
	       								alert("회원만 사용가능")
	       							}
	       						},
	       						error : function(){
	       							alert("카트 담기 실패");
	       						}
	       					});
	       				});
	       			</script>
	       		</p>
	       	</div>
       	</div>
     </div>
</div>
<div class="line"></div>
<div class="content_middle">
	<div class="description">
		${product.description}
	</div>
</div>
</div>
</div>
       <p><form name="addForm" action="./addCart.jsp?pno=${product.pno}" method="post">
          <div class="col-md-2">
          <input type="hidden" name="rate"  id="rate" value="<%=rate%>">
          <input type="number" name="qty" value="0" class="form-control input-md">
          <br>
          </div>
          	<a href="BookListAction.do?category=<%=rs.getString("category")%>" 
                 class="btn btn-secondary" role="button">&laquo; 이전</a>
            <button onclick="history.back()">뒤로가기 &raquo;</button>
          	<a href="/Cart/cart.jsp" class="btn btn-success" onclick="addToCart()">주문하기</a>
          	<a href="/Review/reviewListSH.jsp" class="btn btn-danger">리뷰게시판</a>
          </form>
     </div>
  </div>
</div> --%>
<pre>

</pre>

<%@ include file="../footer.jsp" %>
</body>
</html>