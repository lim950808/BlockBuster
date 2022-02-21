<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Insert title here</title>
<style type="text/css">
body{
  background-color: #000;
  color: #fff;
}
.foot {
	background-color: #000
}
.foot span{
	color: #fff;
}
.foot hr{
	border-color: #fff;
}

.foot p{
	color: #fff;
}
</style>
</head>
<body>

<footer class="foot">
<p align="center"><a href="${pageContext.request.contextPath}/introduce"><span>회사 소개</span></a>&emsp;
                  <a href="${pageContext.request.contextPath}/serviceInt"><span>서비스 소개</span></a>&emsp;
				  <a href="${pageContext.request.contextPath}/policy"><span>이용약관</span></a>&emsp;
                  <a href="${pageContext.request.contextPath}/privacy"><span>개인정보보호정책</span></a>&emsp;</p>
                
<hr>
<!-- <p style="padding-left:30%">BlockBuster 1st Project 프로젝트<br>
전화번호 : 02-123-4567 | 주소 : 서울특별시 강남구 테헤란로 7길 7, 중앙정보처리학원 7층 4실습실.<br>
이메일 : korea@BlockBuster.com  | 제작기간 : 22-0105-22-0228
</p> -->
<!-- <p style="padding-left:30%"><a>&copy; BlockBuster All rights reserved.</a></p> -->
<p>
	BlockBuster 1st Project 프로젝트<br>
	전화번호 : 02-123-4567 | 주소 : 서울특별시 강남구 테헤란로 7길 7, 중앙정보처리학원 7층 4실습실.<br>
	이메일 : korea@BlockBuster.com  | 제작기간 : 22-0105-22-0228
</p>
<p>
	<a>&copy; BlockBuster All rights reserved.</a>
</p>
</footer> 
</body>
</html>
    