<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/user/shop/default.css" />
<!-- <link rel="stylesheet" href="/css/style.css"> -->
	<style>
		div.products div.p_img { float:left; width:350px; }
		div.products div.p_img img { width:350px; height:auto; }
		
		div.products div.info { float:right; width:330px; font-size:12px; }
		div.products div.info p { margin:0 0 20px 0; }
		div.products div.info p span { display:inline-block; width:100px; margin-right:15px; } 
		
		div.products div.info p.cartStock input { font-size:22px; width:50px; padding:5px; margin:0; border:1px solid #eee; }
		div.products div.info p.cartStock button { font-size:26px; border:none; background:none; } 
		div.products div.info p.addToCart { text-align:right; }
		/* div.products div.info p.addToCart button { font-size:22px; padding:5px 10px; border:1px solid #eee; background:#eee;}
 */		div.products div.info p.addToCart button { font-size:22px; padding:5px 10px; border:none; background:#ff7f00; border-radius:8px; }
 		div.products div.info p.addToCart button:hover { background-color: #F5F5F5; }
		div.products div.info p.reviewBbs { text-align:right; }
/* 		div.products div.info p.reviewBbs button { font-size:22px; padding:5px 10px; border:1px solid #eee; background:#eee;}
 */		div.products div.info p.reviewBbs button { font-size:22px; padding:5px 10px; border:none; background:#ff7f00; display: inline-block; cursor: pointer; border-radius:8px; }
 		div.products div.info p.reviewBbs button:hover { background-color: #F5F5F5; }
		div.products div.description { font-size:18px; clear:both; padding-top:30px; }
		
		aside#aside { float:left; width:180px; }
		aside#aside h3 { font-size:22px; margin-bottom:20px; text-align:center; }
 		aside#aside li { font-size:16px; text-align:center; }
 		aside#aside li a { color:white; display:block; padding:10px 0; }
 		aside#aside li a:hover { text-decoration:none; background:#ff7f00; }
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
<pre>

</pre>
<div id="root">
	<section id="container">
		<div id="container_box">
		
			<section id="content">
				
				<form role="form" method="post">
					<input type="hidden" name="pno" id="pno" value="${product.pno}" />
					<input type="hidden" name="price" id="price" value="${product.price}" />
					<input type="hidden" name="title" id="title" value="${product.title}" />
				</form>
				
				<div class="products"><!-- <div class="goods"> -->
					<div class="p_img"><!-- <div class="goodsImg"> -->
						<img src="${product.p_img}">
					</div>
					
					<div class="info">
						<p class="title"><h4><b>${product.title}</b></h4></p>
						<p class="genre">${product.gen_name}</p>
						<p class="year">${product.year}</p>
						<p class="director">${product.director}</p>
						<p class="casting">${product.casting}</p>					
						<p class="price"><fmt:formatNumber pattern="###,###,###" value="${product.price}" /> 원</p>
						<p class="description">${product.description}</p>
						
						<!-- admin일때는 장바구니 안보임 -->
						<c:choose>
							<c:when test="${sessionScope.sessionId != 'admin'}">
								<p class="addToCart" style="float:left; margin-right:10px;">
									<!-- <a href="/Cart/cartList" class="btn btn-success pull-right" id="btnOrder">주문하기</a> -->
									<button type="button" class="addCart_btn">장바구니</button>
									<script>
										$(".addCart_btn").click(function() {
											//데이터를 파라미터로 보내기 => 즉, 선택된 것의 pno, price, title 값을 파라미터로 보냄.
											var pno = $("#pno").val();
											var price = $("#price").val();
											var title = $("#title").val();
											var data = {pno : pno,
														price : price,
														title : title};
											
											$.ajax({
												url : "${pageContext.request.contextPath}/Product/productDetail/addCart",
												type : "post",
												data : data,
												success : function(result) {
													if(result == 1) {
														alert("장바구니에서 결제를 완료해주세요.");
														location.href = "${pageContext.request.contextPath}/Cart/cartList";
													}else if(result == 2){
														alert("장바구니에 담긴 중복된 영상입니다.");
													}else {
														alert("로그인 해주세요.")
													}
												},
												error : function(){
													alert("카트 담기 실패!!");
												}
											});
										});
									</script>
								</p>
							</c:when>
						</c:choose>
						
						<!-- 리뷰게시판 -->
						<p class="reviewBbs" style="float:left;">
							<button type="button" onclick="location.href='${pageContext.request.contextPath}/reviewProductList?pno=${product.pno}'">리뷰게시판</button>
						</p>

					</div>
					
				</div>
				
			</section>
			
			<aside id="aside">
				<%@ include file="../aside.jsp" %>
			</aside>
			
		</div>
	</section>
<pre>

</pre>
<%@ include file="../footer.jsp" %>
</div>
</body>
</html>