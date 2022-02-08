<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.css" rel="stylesheet">

<section class="checkout_area section_padding">
	<div class="container">
		<div class="billing_details">
			<div class="row">
				<div class="col-lg-12 col-sm-12" style="margin-top: 40px; padding-right:7px;padding-left:7px;">
					<h3 class="mt-3 mb-4">주문 정보</h3>
					<table class="table" style="width:100%;">
						<thead>
							<tr>
								<th style="width:auto;">상품</th>
								<th style="min-width:60px; width:auto; padding-left: 0;padding-right: 0;">가격</th>
								<!-- <th style="width:auto; padding-left: 0;padding-right: 0;">수량</th> -->
								<th style="min-width:60px; width:auto; padding-left: 0;padding-right: 0; text-align: center;">합계</th>
							</tr>
						</thead>
						<tbody id="cartList">
						</tbody>
					</table>
					
					<%-- <h3 class="mb-4">배송 정보</h3>
					<form method="post" novalidate="novalidate">
						<div class="col-md-12 form-group">
							<label for="name">수령인</label>
							<input type="text" class="form-control" id="recipient" name="recipient" placeholder="수령인을 입력하세요." />
						</div>
						<div class="col-md-12 form-group">
							<label for="phone">연락처</label>
							<input type="text" class="form-control" id="phone" name="phone" placeholder="연락처를 입력하세요." value="${principal.user.phone}" />
						</div>
						<div class="col-md-12 form-group">
							<label for="addr">배송지</label>
							<input type="text" class="form-control" id="addr" name="addr" placeholder="배송지를 입력하세요." value="${principal.user.addr}" />
						</div>
					</form> --%>
					
					<h3 class="mt-5 mb-4">결제 정보</h3>
					<form method="post" novalidate="novalidate">
						<div class="col-md-12 form-group">
							&nbsp; <input type="radio" id="rdCash" name="paymentCd" />
							<label for="rdCash">계좌이체</label>
							&nbsp; <input type="radio" id="rdCard" name="paymentCd" />
							<label for="rdCard">카드</label>
						</div>
						<div class="col-md-12 form-group">
							<button type="button" onClick="insertCheck()" class="btn btn-info pull-right" style="margin-bottom: 15px;">주문하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="/js/imp_config.js"></script>
<script src="/js/order.js"></script>
<script src="/js/payment.js"></script>
<script>
	document.write(location.href);
	orderCartList();
</script>



<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>KakaoPay</title>
	<meta charset="UTF-8">
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<button id="check_module" type="button">테스트 결제</button>
<script>
	$("#check_module").click(function () {
		var IMP = window.IMP; // 생략가능
		IMP.init('가맹점식별코드'); 
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
		IMP.request_pay({
			pg: 'kakao',
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime(),
			/* 
			 *  merchant_uid에 경우 
			 *  https://docs.iamport.kr/implementation/payment
			 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			 */
			name: '주문명 : 아메리카노',
			// 결제창에서 보여질 이름
			// name: '주문명 : ${auction.a_title}',
			// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
			amount: 2000,
			// amount: ${bid.b_bid},
			// 가격 
			buyer_name: '이름',
			// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
			// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
			buyer_postcode: '123-456',
			}, function (rsp) {
				console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '결제 금액 : ' + rsp.paid_amount;
				// success.submit();
				// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
				// 자세한 설명은 구글링으로 보시는게 좋습니다.
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	});
</script>
</body>
</html> --%>