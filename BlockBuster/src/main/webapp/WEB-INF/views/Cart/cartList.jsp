<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

 body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
 a { color:#05f; text-decoration:none; }
 a:hover { text-decoration:underline; }
 
 h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
 ul, lo, li { margin:0; padding:0; list-style:none; }

 /* ---------- */
 
 div#root { width:900px; margin:0 auto; }
 header#header { }
 nav#nav { }
 section#container { }
  section#content { float:right; width:700px; }
  aside#aside { float:left; width:180px; }
  section#container::after { content:""; display:block; clear:both; } 
 footer#footer { background:#eee; padding:20px; }
 
 /* ---------- */
 
 header#header div#header_box { text-align:center; padding:30px 0; }
 header#header div#header_box h1 { font-size:50px; }
 header#header div#header_box h1 a { color:#000; }
 
 nav#nav div#nav_box { font-size:14px; padding:10px; text-align:right; }
 nav#nav div#nav_box li { display:inline-block; margin:0 10px; }
 nav#nav div#nav_box li a { color:#333; }
 
 section#container { }
 
 aside#aside h3 { font-size:22px; margin-bottom:20px; text-align:center; }
 aside#aside li { font-size:16px; text-align:center; }
 aside#aside li a { color:#000; display:block; padding:10px 0; }
 aside#aside li a:hover { text-decoration:none; background:#eee; }
 
 footer#footer { margin-top:100px; border-radius:50px 50px 0 0; }
 footer#footer div#footer_box { padding:0 20px; }
 
</style>

<style>
 /*
 section#content ul li { display:inline-block; margin:10px; }
 section#content div.goodsThumb img { width:200px; height:200px; }
 section#content div.goodsName { padding:10px 0; text-align:center; }
 section#content div.goodsName a { color:#000; }
 */
 section#content ul li { margin:10px 0; }
 section#content ul li img { width:250px; height:250px; }
 section#content ul li::after { content:""; display:block; clear:both; }
 section#content div.p_img { float:left; width:250px; }
 section#content div.info { float:right; width:calc(100% - 270px); }
 section#content div.info { font-size:20px; line-height:2; }
 section#content div.info span { display:inline-block; width:100px; font-weight:bold; margin-right:10px; }
 section#content div.info .delete { text-align:right; }
 section#content div.info .delete button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}
 
.allCheck { float:left; width:200px; }
.allCheck input { width:16px; height:16px; }
.allCheck label { margin-left:10px; }
.delBtn { float:right; width:300px; text-align:right; }
.delBtn button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}

.checkBox { float:left; width:30px; }
.checkBox input { width:16px; height:16px; }

.listResult { padding:20px; background:#eee; }
.listResult .sum { float:left; width:45%; font-size:22px; }

.listResult .orderOpne { float:right; width:45%; text-align:right; }
.listResult .orderOpne button { font-size:18px; padding:5px 10px; border:1px solid #999; background:#fff;}
.listResult::after { content:""; display:block; clear:both; } 

.orderInfo { border:5px solid #eee; padding:20px; display:none; }
.orderInfo .inputArea { margin:10px 0; }
.orderInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; }
.orderInfo .inputArea input { font-size:14px; padding:5px; }
#userAddr2, #userAddr3 { width:250px; }

.orderInfo .inputArea:last-child { margin-top:30px; }
.orderInfo .inputArea button { font-size:20px; border:2px solid #ccc; padding:5px 10px; background:#fff; margin-right:20px;}

.orderInfo .inputArea #sample2_address { width:230px; }
.orderInfo .inputArea #sample2_detailAddress { width:280px; }
.orderInfo .inputArea #sample2_extraAddress { display:none; }

<script src="/resources/jquery/jquery-3.3.1.min.js"></script>

</style>

</head>
<body>
<div id="root">
	
	<section id="container">
		<div id="container_box">
		
			<section id="content">
				<ul>
					<li>
  						<div class="allCheck">
   							<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label>
   							<script>
							$("#allCheck").click(function(){
 								var chk = $("#allCheck").prop("checked");
 								if(chk) {
  									$(".chBox").prop("checked", true);
 								}else {
  									$(".chBox").prop("checked", false);
 								}
							});
							</script> 
  						</div>
  						<div class="delBtn">
   							<button type="button" class="selectDelete_btn">선택 삭제</button>
   							<script>
							$(".selectDelete_btn").click(function(){
								var confirm_val = confirm("정말 삭제하시겠습니까?");
							  	if(confirm_val) {
							   		var checkArr = new Array();
								   	$("input[class='chBox']:checked").each(function(){
								    	checkArr.push($(this).attr("data-no"));
								   	});
								    
								   	$.ajax({
								    	url : "/Cart/deleteCart",
								    	type : "post",
								    	data : { chbox : checkArr },
								    	success : function(result){
								    		if(result == 1) {
								    			location.href = "/Cart/cartList";
								    		}else {
								    			alert("삭제 실패");
								    		}
								    	}
								   	});
							  	} 
							 });
							</script>
  						</div>
 					</li>
					<c:set var="sum" value="0" />
 					<c:forEach items="${cart}" var="cart">
	 					<li>
	 						<div class="checkBox">
   								<input type="checkbox" name="chBox" class="chBox" data-cartNum="${cart.no}" />
   								<script>
 								$(".chBox").click(function(){
  									$("#allCheck").prop("checked", false);
 								});
								</script>
  							</div>
	  						<div class="p_img">
	   							<a href="/Product/productDetail?pno=${product.pno}">
	   								<img src="${product.p_img}">
	   							</a>
	  						</div> 
	  						<div class="info">
	   							<p>
	   								<span>제목</span>${cart.title}<br />
	   								<span>가격</span><fmt:formatNumber pattern="###,###,###" value="${cart.price}" />원
	   							</p>
	   							
	   							<div class="delete">
	   								<button type="button" class="delete_${price.no}_btn" data-cartNum="${cart.no}">삭제</button>
	   								<script>
									$(".delete_${cart.no}_btn").click(function(){
										var confirm_val = confirm("정말 삭제하시겠습니까?");
									  
									  	if(confirm_val) {
									   		var checkArr = new Array();
									   
									   		checkArr.push($(this).attr("data-no"));
									              
										   	$.ajax({
										    	url : "/Cart/deleteCart",
										    	type : "post",
										    	data : { chbox : checkArr },
										    	success : function(result){
											     	if(result == 1) {            
											      		location.href = "/Cart/cartList";
											     	} else {
											      		alert("삭제 실패");
											     	}
										    	}
										   	});
									  	} 
									 });
									</script>
	   							</div>
	  						</div>
	 					</li>
	 				<c:set var="sum" value="${sum + (cart.price * cart.count)}" />
 					</c:forEach>
				</ul>
				<div class="listResult">
					<div class="sum">
				  		총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원
				 	</div>
				</div>
				
				<div class="orderInfo">
					<form role="form" method="post" autocomplete="off">
						<div class="inputArea">
						<button type="submit" class="order_btn">주문</button>
						<button type="button" class="cancel_btn">취소</button>
						
						<script>
						$(".cancel_btn").click(function(){
							$(".orderInfo").slideUp();  // $(".orderInfo")를 숨기고
							$(".orderOpne_bnt").slideDown();  // $(".orderOpne_bnt")를 나타냄
						});						
						</script>
						</div>
					</form>
				</div>

			</section>
		
		</div>
	</section>
</div>
</body>
</html>