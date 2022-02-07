<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="checkout_area section_padding">
	<div class="container">
		<div class="billing_details">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="mt-3 mb-4">주문 정보</h3>
					<table class="table">
						<thead>
							<tr>
								<th>상품</th>
								<th>가격</th>
							</tr>
						</thead>
						<tbody id="cartList">
						</tbody>
					</table>
					
					<h3 class="mt-5 mb-4">결제 정보</h3>
					<form method="post" novalidate="novalidate">
						<div class="col-md-12 form-group">
							<label for="paymentCd">결제수단</label><br />
							&nbsp; <input type="radio" id="rdCash" name="paymentCd" />
							<label for="rdCash">현금</label>
							&nbsp; <input type="radio" id="rdCard" name="paymentCd" />
							<label for="rdCard">카드</label>
						</div>
						<div class="col-md-12 form-group">
							<button type="button" class="btn btn-info pull-right" style="margin-bottom: 15px;">결제하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>

<script src="/js/order.js"></script>
<script>
	orderCartList();
</script>