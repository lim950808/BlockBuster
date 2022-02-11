<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title></title>
    <meta charset="utf-8">
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="container">
  <h1>결제 완료</h1>
  
카카오페이 결제가 정상적으로 완료되었습니다.
 
결제일시:     [[${payment.p_date}]]<br/>
주문번호:    [[${payment.orderNo}]]<br/>
결제금액:    [[${payment.totalPrice}]]<br/>
결제방법:    [[카카오페이]]<br/>
 
 
 
<h2>[[${payment}]]</h2>
</div>
</body>
</html>