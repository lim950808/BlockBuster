<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../header.jsp" %>
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
 aside#aside li a { color:white; display:block; padding:10px 0; }
 aside#aside li a:hover { text-decoration:none; background:#ff7f00; }
 
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
 section#content ul li { margin:10px 0; border-bottom:1px solid #999;}
 section#content ul li img { width:200px; height:300px; margin:10px 0; }
 section#content ul li::after { content:""; display:block; clear:both; }
 section#content div.p_img { float:left; width:200px; }
 section#content div.info { float:right; width:calc(100% - 270px); }
 section#content div.info { font-size:20px; line-height:2; }
 section#content div.info span { display:inline-block; width:100px; font-weight:bold; margin-right:10px; }
 section#content div.info .delete { text-align:right; }
 /* section#content div.info .delete button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;} */
 section#content div.info .delete button { font-size:18px; padding:5px 10px; border:none; background:#F5F5F5; border-radius:8px; }
 section#content div.info .delete button:hover { background-color: #ff7f00; }
 
.allCheck { float:left; width:200px; }
.allCheck input { width:16px; height:16px; }
.allCheck label { margin-left:10px; }
.delBtn { float:right; width:300px; text-align:right; margin:10px 0; }
/* .delBtn button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;} */
.delBtn button { font-size:18px; padding:5px 10px; border:none; background:#F5F5F5; border-radius:8px; }
.delBtn button:hover { background-color: #ff7f00; }
.checkBox { float:left; width:30px; }
.checkBox input { width:16px; height:16px; }
/* .listResult { padding:20px; background:#eee; } */
.listResult { padding:20px; background:#000; border:2px solid #eee;}
.listResult .sum { color:#eee; float:left; width:45%; font-size:22px; }
.listResult .orderOpne { float:right; width:45%; text-align:right; }
/* .listResult .orderOpne button { font-size:18px; padding:5px 10px; border:1px solid #999; background:#fff;} */
.listResult .orderOpne button { font-size:18px; padding:5px 10px; border:none; background:#F5F5F5; border-radius:8px;}
.listResult .orderOpne button:hover { background-color: #ff7f00; color: #000; }
.listResult::after { content:""; display:block; clear:both; } 
/* .orderInfo { border:5px solid #eee; padding:20px; display:none; } */
.orderInfo { border:5px solid #eee; padding:20px; }
.orderInfo .inputArea { margin:10px 0; }
.orderInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; }
.orderInfo .inputArea input { font-size:14px; padding:5px; }
#userAddr2, #userAddr3 { width:250px; }
.orderInfo .inputArea:last-child { margin-top:30px; }
/* .orderInfo .inputArea button { font-size:20px; border:2px solid #ccc; padding:5px 10px; background:#fff; margin-right:20px;} */
.orderInfo .inputArea button { font-size:20px; border:none; padding:5px 10px; background:#F5F5F5; border-radius:8px; margin-right:20px;}
.orderInfo .inputArea button:hover { background-color: #ff7f00; }
.orderInfo .inputArea #sample2_address { width:230px; }
.orderInfo .inputArea #sample2_detailAddress { width:280px; }
.orderInfo .inputArea #sample2_extraAddress { display:none; }
</style>

<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.3.1.min.js"></script>

<!-- kakaoPay -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<body>
<pre>

</pre>
<div id="root">
	<section id="container">
		<h1 style="color:white;"><b>장바구니</b></h1>
		<hr color="white">
		<aside id="aside">
			<%@ include file="../aside.jsp" %>
		</aside>
		<div id="container_box">
			<section id="content">
				<ul>
					<li>
  						<div class="allCheck">
   							<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label>
   							<script>
							$("#allCheck").click(function(){
 								var chk = $("#allCheck").prop("checked"); //checked : 속성명
 								if(chk) {
  									$(".chBox").prop("checked", true); //모두 선택됨
 								}else {
  									$(".chBox").prop("checked", false); //모두 선택해제됨.
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
							   		var checkArr = new Array(); //배열 초기화
								   	$("input[class='chBox']:checked").each(function() { //클래스가 chBox인것들의 값들을 배열에 담음. 
								    	checkArr.push($(this).attr("data-no")); //해당 "cart.no"의 값을 가진 "data-no"
								   	});
								    
								   	$.ajax({
								    	url : "${pageContext.request.contextPath}/Cart/deleteCart",
								    	type : "post",
								    	data : { chbox : checkArr }, //http 요청과 함께 서버로 데이터 -> ex) data:{name:"홍길동"}
								    	success : function(result) {
								    		if(result == 1) {
								    			location.href = "${pageContext.request.contextPath}/Cart/cartList";
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
					
 					<c:forEach var="cart" items="${cartList}" >
	 					<li>
	 						<div class="checkBox">
   								<input type="checkbox" name="chBox" class="chBox" data-no="${cart.no}" />
   								<script>
	 								$(".chBox").click(function() {
	  									$("#allCheck").prop("checked", false); //prop()는 속성의 값을 true 혹은 false로 반환. -> checked시 false값을 세팅됨.
	 								});
								</script>
  							</div>
	  						<div class="p_img">
	   							<a href="${pageContext.request.contextPath}/Product/productDetail?pno=${cart.pno}">
	   								<img src="${cart.p_img}">
	   							</a>
	  						</div>
	  						<div class="info">
	   							<p>
	   								<span>제목 : </span>${cart.title}<br />
	   								<span>가격 : </span><fmt:formatNumber pattern="###,###,###" value="${cart.price}" />원
	   							</p>
	   							
	   							<div class="delete">
	   								<button type="button" class="delete_${cart.no}_btn" data-no="${cart.no}">삭제</button>
	   								<script>
									$(".delete_${cart.no}_btn").click(function(){
										var confirm_val = confirm("정말 삭제하시겠습니까?");
									  
									  	if(confirm_val) {
									   		var checkArr = new Array(); //배열 초기화
									   
									   		checkArr.push($(this).attr("data-no")); //해당 "cart.no"의 값을 가진 "data-no"를 배열에 담음.
									              
										   	$.ajax({
										    	url : "${pageContext.request.contextPath}/Cart/deleteCart",
										    	type : "post",
										    	data : { chbox : checkArr },
										    	success : function(result){
											     	if(result == 1) {            
											      		location.href = "${pageContext.request.contextPath}/Cart/cartList";
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
	 				<c:set var="sum" value="${sum + cart.price}" /> <!-- sum이라는 변수에 총합을 더해 놓음 -->
 					</c:forEach>
				</ul>

				<div class="listResult">
					<div class="sum">
				  		총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원 
				  		<!-- formatNumber(숫자 자리수로 나눔) : JSTL fmt태그 요망 -->
				 	</div>
				 	<div class="orderOpne">
						<button id="check_module" type="button">결제</button>
							<script>
								$("#check_module").click(function () {
									var IMP = window.IMP; // 생략가능
									IMP.init('imp05518360'); 
									// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
									// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
									IMP.request_pay({
										pg: 'kakaopay',
										pay_method: 'card',
										merchant_uid: 'merchant_' + new Date().getTime(),
										/* 
										 *  merchant_uid에 경우 
										 *  https://docs.iamport.kr/implementation/payment
										 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
										 */
										name: 'BlockBuster',
										// 결제창에서 보여질 이름(주문명)
										// name: '${auction.a_title}',
										// 위와 같이 model에 담은 정보를 넣어 쓸 수도 있습니다.
										amount: '${sum}',
										// amount: ${bid.b_bid},
										// 총 가격 
										buyer_name: '${cart.id}',
										// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
										// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
									}, function (rsp) {
										console.log(rsp);
										if (rsp.success) {
											var msg = '결제가 완료되었습니다.';
											location.href='${pageContext.request.contextPath}/Cart/cartList/order?totalPrice=${sum}' //sum값을 가진 totalPrice
											/* msg += '결제 금액 : ' + rsp.paid_amount; */
											// success.submit();
											// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
										}else {
											//var msg = '장바구니가 비어있습니다. 상품을 추가해주세요.';
											var msg = '결제에 실패하였습니다.';
											//msg += '에러내용 : ' + rsp.error_msg;
										}
										alert(msg);
									});
								});
							</script>
					</div>
				</div>
			</section>
		</div>
	</section>
<pre>

</pre>
<%@ include file="../footer.jsp" %>
</div>
</body>
</html>