<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>제목 검색 결과</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
 	body { margin:0; padding:0; font-family:'sans-serif', verdana;}
	 
	#pic{
		width: 200px;
		height: 300px;
	}
	#titleHeader{
		background: rgba(0, 0, 0, 0.4); /* 0.5  */
		color:#ff7f00;
		font-size:23px;
		width: 100%;
	}
	#keywd{color:#ff7f00;}
	
	 th, td, P {color: #f5f5f5;}
	 
     #poster{
     	display:inline-block; 
     	margin:10px;
     }
     
     img {
	  vertical-align: top;
	}
	.postpic{
	  display:inline-block;
	  position: relative;
	}
	.postpic:hover:after,
	.postpic:hover > .hover_text,
	.postpic:hover:after,
	.postpic:hover > .hover_text
	{
	  display:block;
	}
	.postpic:after,.hover_text{
	  display:none;
	}
	.postpic:after{
	  content:'';
	  position: absolute;
	  top: 0;
	  right: 0;
	  bottom: 0;
	  left: 0;
	  background: rgba(0, 0, 0, 0.7);
	  z-index: 10;
	}
	.postpic {
	  overflow: hidden;
	}
	.postpic:hover img{
	transform: scale(1.2);
	  transition: 0.7s;
	}
	.hover_text {
 	  position: absolute;
	  top: 180px;
	  left: 5px;
	  color: #ff7f00;
	  z-index: 20;
	  font-weight: 600;
	  font-size: 20px;
	}
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<pre>

</pre>
<div class="container" id="total"> <!-- 전체 블록 시작 -->
<c:choose>
<c:when test="${not empty keyword}">
<p align="right"><span id="keywd"><b>[${keyword}]</b></span>의 제목 검색 결과는 총 <b><span id="keywd">[${searchCnt}]</span></b>건 입니다.</p>
<div class="container" id="movie"> 
<!-- 영화 전체 블록 시작 -->
<c:choose>
<c:when test="${mc gt '0'}">
<p id="titleHeader"><b>공포(${mHorrorCnt})</b></p> <!-- 장르명(검색결과 갯 수)-->
<c:choose>
<c:when test="${mHorrorCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> <!-- 검색결과를 media라는 이름으로 list타입으로 가져오기  -->
<c:if test="${media.genre eq '1100'}">
    <!--반복 시작 지점-->
    <div>
		<div id=poster>
			<a href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}" class="postpic">
			<img id="pic" src="${media.p_img}" class="img-responsive img-rounded"  onerror="this.src='${pageContext.request.contextPath}/resources/img/logo2.png'"/><p class="hover_text"><b>${media.title}</b></p></a>
		</div>
	</div>  	
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 영화:공포 부분 종료-->
</c:when>
<c:when test="${mHorrorCnt eq '0'}">
<p><span id="keywd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>

<!-- 영화:액션 부분 -->
<pre>

</pre>
<p id="titleHeader"><b>액션(${mActionCnt})</b></p> <!-- 장르명(검색결과 갯 수)-->
<c:choose>
<c:when test="${mActionCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media">
<c:if test="${media.genre eq '1200'}">
    <!--반복 시작 지점-->
    <div>
		<div id=poster>
			<a href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}" class="postpic">
			<img id="pic" src="${media.p_img}" class="img-responsive img-rounded"  onerror="this.src='${pageContext.request.contextPath}/resources/img/logo2.png'"/><p class="hover_text"><b>${media.title}</b></p></a>
		</div>
	</div> 
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 영화:액션 부분 종료-->
</c:when>
<c:when test="${mActionCnt eq '0'}">
<p><span id="keywd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>

<!-- 영화:범죄/스릴러 부분 -->
<pre>

</pre>
<p id="titleHeader"><b>범죄/스릴러(${mCrimeCnt})</b></p> <!-- 장르명(검색결과 갯 수)-->
<c:choose>
<c:when test="${mCrimeCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> 
<c:if test="${media.genre eq '1300'}">
    <!--반복 시작 지점-->
    <div>
		<div id=poster>
			<a href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}" class="postpic">
			<img id="pic" src="${media.p_img}" class="img-responsive img-rounded"  onerror="this.src='${pageContext.request.contextPath}/resources/img/logo2.png'"/><p class="hover_text"><b>${media.title}</b></p></a>
		</div>
	</div> 
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 영화:범죄/스릴러 부분 종료-->
</c:when>
<c:when test="${mCrimeCnt eq '0'}">
<p><span id="keywd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>

<!-- 영화:전쟁 부분 -->
<pre>

</pre>
<p id="titleHeader"><b>전쟁(${mWarCnt})</b></p> <!-- 장르명(검색결과 갯 수)-->
<c:choose>
<c:when test="${mWarCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> 
<c:if test="${media.genre eq '1400'}">
    <!--반복 시작 지점-->
    <div>
		<div id=poster>
			<a href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}" class="postpic">
			<img id="pic" src="${media.p_img}" class="img-responsive img-rounded"  onerror="this.src='${pageContext.request.contextPath}/resources/img/logo2.png'"/><p class="hover_text"><b>${media.title}</b></p></a>
		</div>
	</div> 
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 영화:전쟁 부분 종료-->
</c:when>
<c:when test="${mWarCnt eq '0'}">
<p><span id="keywd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>

<!-- 영화:판타지/SF 부분 -->
<pre>

</pre>
<p id="titleHeader"><b>판타지/SF(${mSFCnt})</b></p> <!-- 장르명(검색 갯 수)-->
<c:choose>
<c:when test="${mSFCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> 
<c:if test="${media.genre eq '1500'}">
    <!--반복 시작 지점-->
    <div>
		<div id=poster>
			<a href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}" class="postpic">
			<img id="pic" src="${media.p_img}" class="img-responsive img-rounded"  onerror="this.src='${pageContext.request.contextPath}/resources/img/logo2.png'"/><p class="hover_text"><b>${media.title}</b></p></a>
		</div>
	</div> 
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 영화:판타지/SF 부분 종료-->
</c:when>
<c:when test="${mSFCnt eq '0'}">
<p><span id="keywd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>

<!-- 영화:코미디 부분 -->
<pre>

</pre>
<p id="titleHeader"><b>코미디(${mComedyCnt})</b></p> <!-- 장르명(검색 갯 수)-->
<c:choose>
<c:when test="${mComedyCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> 
<c:if test="${media.genre eq '1600'}">
    <!--반복 시작 지점-->
    <div>
		<div id=poster>
			<a href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}" class="postpic">
			<img id="pic" src="${media.p_img}" class="img-responsive img-rounded"  onerror="this.src='${pageContext.request.contextPath}/resources/img/logo2.png'"/><p class="hover_text"><b>${media.title}</b></p></a>
		</div>
	</div> 
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 영화:코미디 부분 종료-->
</c:when>
<c:when test="${mComedyCnt eq '0'}">
<p><span id="keywd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>

<!-- 영화:멜로/로맨스 부분 -->
<pre>

</pre>
<p id="titleHeader"><b>멜로/로맨스(${mRomanceCnt})</b></p> <!-- 장르명(검색 갯 수)-->
<c:choose>
<c:when test="${mRomanceCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> 
<c:if test="${media.genre eq '1700'}">
    <!--반복 시작 지점-->
    <div>
		<div id=poster>
			<a href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}" class="postpic">
			<img id="pic" src="${media.p_img}" class="img-responsive img-rounded"  onerror="this.src='${pageContext.request.contextPath}/resources/img/logo2.png'"/><p class="hover_text"><b>${media.title}</b></p></a>
		</div>
	</div> 
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 영화:멜로/로맨스  부분 종료-->
<pre>

</pre>
</c:when>
<c:when test="${mRomanceCnt eq '0'}">
<p><span id="keywd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
</c:when>
<c:when test="${mc eq '0'}">
<table>
<tr><th><span id="keywd">'${keyword}'</span>에 대한 검색결과가 없습니다.</th></tr>
<tr><td>단어의 철자가 정확한지 확인해 보세요.<br>
한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.<br>
검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.<br>
두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.</td></tr>
</table>
<pre>

</pre>
</c:when>
</c:choose>
</div>

<!-- 드라마 전체 블록 시작 -->
<div class="container" id="drama"> 
<c:choose>
<c:when test="${dc gt '0'}">
<!-- 드라마:미국 부분 -->
<pre>

</pre>
<p id="titleHeader"><b>미국(${dUsCnt})</b></p> <!-- 장르명(검색 갯 수)-->
<c:choose>
<c:when test="${dUsCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> <!-- 검색결과를 media라는 이름으로 list타입으로 가져오기  -->
<c:if test="${media.genre eq '2100'}">
    <!--반복 시작 지점-->
    <div>
		<div id=poster>
			<a href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}" class="postpic">
			<img id="pic" src="${media.p_img}" class="img-responsive img-rounded"  onerror="this.src='${pageContext.request.contextPath}/resources/img/logo2.png'"/><p class="hover_text"><b>${media.title}</b></p></a>
		</div>
	</div> 
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 드라마:미국 부분 종료-->
</c:when>
<c:when test="${dUsCnt eq '0'}">
<p><span id="keywd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>

<!-- 드라마:일본 부분 -->
<pre>

</pre>
<p id="titleHeader"><b>일본(${dJpnCnt})</b></p>
<c:choose>
<c:when test="${dJpnCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media">
<c:if test="${media.genre eq '2200'}">
    <!--반복 시작 지점-->
    <div>
		<div id=poster>
			<a href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}" class="postpic">
			<img id="pic" src="${media.p_img}" class="img-responsive img-rounded"  onerror="this.src='${pageContext.request.contextPath}/resources/img/logo2.png'"/><p class="hover_text"><b>${media.title}</b></p></a>
		</div>
	</div> 
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 드라마:일본 부분 종료-->
</c:when>
<c:when test="${dJpnCnt eq '0'}">
<p><span id="keywd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>

<!-- 드라마:한국 부분 -->
<pre>

</pre>
<p id="titleHeader"><b>한국(${dKorCnt})</b></p> <!-- 장르명(검색 갯 수)-->
<c:choose>
<c:when test="${dKorCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> 
<c:if test="${media.genre eq '2300'}">
    <!--반복 시작 지점-->
    <div>
		<div id=poster>
			<a href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}" class="postpic">
			<img id="pic" src="${media.p_img}" class="img-responsive img-rounded"  onerror="this.src='${pageContext.request.contextPath}/resources/img/logo2.png'"/><p class="hover_text"><b>${media.title}</b></p></a>
		</div>
	</div> 
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 드라마:한국 부분 종료-->
<pre>

</pre>
</c:when>
<c:when test="${dKorCnt eq '0'}">
<p><span id="keywd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
</c:when>
<c:when test="${dc eq '0'}">
<div class="container">
<table class="table table-bordered">
<tr><th><span id="keywd">'${keyword}'</span>에 대한 검색결과가 없습니다.</th></tr>
<tr><td>단어의 철자가 정확한지 확인해 보세요.<br>
한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.<br>
검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.<br>
두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.</td></tr>
</table>
<pre>

</pre>
</div>
</c:when>
</c:choose>
</div> <!-- 드라마 전체 블록  종료 -->

<!-- 예능 전체 블록 시작 -->
<div class="container" id="entertain"> 
<c:choose>
<c:when test="${ec gt '0'}">
<!-- 예능:KBS 부분 -->
<pre>

</pre>
<p id="titleHeader"><b>KBS(${eKbsCnt})</b></p> <!-- 장르명(검색 갯 수)-->
<c:choose>
<c:when test="${eKbsCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> <!-- 검색결과를 media라는 이름으로 list타입으로 가져오기  -->
<c:if test="${media.genre eq '3100'}">
    <!--반복 시작 지점-->
    <div>
		<div id=poster>
			<a href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}" class="postpic">
			<img id="pic" src="${media.p_img}" class="img-responsive img-rounded"  onerror="this.src='${pageContext.request.contextPath}/resources/img/logo2.png'"/><p class="hover_text"><b>${media.title}</b></p></a>
		</div>
	</div> 
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 예능:KBS 부분 종료-->
</c:when>
<c:when test="${eKbsCnt eq '0'}">
<p><span id="keywd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>

<!-- 예능:SBS 부분 -->
<pre>

</pre>
<p id="titleHeader"><b>SBS(${eSbsCnt})</b></p>
<c:choose>
<c:when test="${eSbsCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media">
<c:if test="${media.genre eq '3200'}">
    <!--반복 시작 지점-->
    <div>
		<div id=poster>
			<a href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}" class="postpic">
			<img id="pic" src="${media.p_img}" class="img-responsive img-rounded"  onerror="this.src='${pageContext.request.contextPath}/resources/img/logo2.png'"/><p class="hover_text"><b>${media.title}</b></p></a>
		</div>
	</div> 
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 예능:SBS 부분 종료-->
</c:when>
<c:when test="${eSbsCnt eq '0'}">
<p><span id="keywd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>

<!-- 예능:MBC 부분 -->
<pre>

</pre>
<p id="titleHeader"><b>MBC(${eMbcCnt})</b></p> <!-- 장르명(검색 갯 수)-->
<c:choose>
<c:when test="${eMbcCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> 
<c:if test="${media.genre eq '3300'}">
    <!--반복 시작 지점-->
    <div>
		<div id=poster>
			<a href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}" class="postpic">
			<img id="pic" src="${media.p_img}" class="img-responsive img-rounded"  onerror="this.src='${pageContext.request.contextPath}/resources/img/logo2.png'"/><p class="hover_text"><b>${media.title}</b></p></a>
		</div>
	</div> 
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 예능:MBC 부분 종료-->
</c:when>
<c:when test="${eMbcCnt eq '0'}">
<p><span id="keywd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>

<!-- 예능:TVN 부분 -->
<pre>

</pre>
<p id="titleHeader"><b>TVN(${eTvnCnt})</b></p> <!-- 장르명(검색 갯 수)-->
<c:choose>
<c:when test="${eTvnCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> 
<c:if test="${media.genre eq '3400'}">
    <!--반복 시작 지점-->
    <div>
		<div id=poster>
			<a href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}" class="postpic">
			<img id="pic" src="${media.p_img}" class="img-responsive img-rounded"  onerror="this.src='${pageContext.request.contextPath}/resources/img/logo2.png'"/><p class="hover_text"><b>${media.title}</b></p></a>
		</div>
	</div> 
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 예능:TVN 부분 종료-->
</c:when>
<c:when test="${eTvnCnt eq '0'}">
<p><span id="keywd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>

<!-- 예능:JTBC 부분 -->
<pre>

</pre>
<p id="titleHeader"><b>JTBC(${eJtbcCnt})</b></p> <!-- 장르명(검색 갯 수)-->
<c:choose>
<c:when test="${eJtbcCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> 
<c:if test="${media.genre eq '3500'}">
    <!--반복 시작 지점-->
    <div>
		<div id=poster>
			<a href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}" class="postpic">
			<img id="pic" src="${media.p_img}" class="img-responsive img-rounded"  onerror="this.src='${pageContext.request.contextPath}/resources/img/logo2.png'"/><p class="hover_text"><b>${media.title}</b></p></a>
		</div>
	</div> 
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 예능:JTBC 부분 종료-->
<pre>

</pre>
</c:when>
<c:when test="${eJtbcCnt eq '0'}">
<p><span id="keywd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
</c:when>
<c:when test="${ec eq '0'}">
<table class="table table-bordered">
<tr><th><span id="keywd">'${keyword}'</span>에 대한 검색결과가 없습니다.</th></tr>
<tr><td>단어의 철자가 정확한지 확인해 보세요.<br>
한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.<br>
검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.<br>
두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.</td></tr>
</table>
<pre>

</pre>
</c:when>
</c:choose>
</div> <!-- 예능 전체 블록 종료 -->


<!-- 다큐멘터리 전체 블록 시작 -->
<div class="container" id="documetary"> 
<c:choose>
<c:when test="${doc gt '0'}">
<pre>

</pre>
<p id="titleHeader"><b>히스토리(${dHisCnt})</b></p> <!-- 장르명(검색 갯 수)-->
<c:choose>
<c:when test="${dHisCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media">
<c:if test="${media.genre eq '4100'}">
    <!--반복 시작 지점-->
    <div>
		<div id=poster>
			<a href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}" class="postpic">
			<img id="pic" src="${media.p_img}" class="img-responsive img-rounded"  onerror="this.src='${pageContext.request.contextPath}/resources/img/logo2.png'"/><p class="hover_text"><b>${media.title}</b></p></a>
		</div>
	</div> 
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 다큐멘터리:히스토리 부분 종료-->
</c:when>
<c:when test="${dHisCnt eq '0'}">
<p><span id="keywd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>

<!-- 다큐멘터리:디스커버리 부분 -->
<pre>

</pre>
<p id="titleHeader"><b>디스커버리(${dDscvCnt})</b></p>
<c:choose>
<c:when test="${dDscvCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media">
<c:if test="${media.genre eq '4200'}">
    <!--반복 시작 지점-->
    <div>
		<div id=poster>
			<a href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}" class="postpic">
			<img id="pic" src="${media.p_img}" class="img-responsive img-rounded"  onerror="this.src='${pageContext.request.contextPath}/resources/img/logo2.png'"/><p class="hover_text"><b>${media.title}</b></p></a>
		</div>
	</div> 
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 다큐멘터리:디스커버리 부분 종료-->
</c:when>
<c:when test="${dDscvCnt eq '0'}">
<p><span id="keywd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>


<!-- 다큐멘터리:내셔널지오그래픽 부분 -->
<pre>

</pre>
<p id="titleHeader"><b>내셔널지오그래픽(${dNgpCnt})</b></p> <!-- 장르명(검색 갯 수)-->
<c:choose>
<c:when test="${dNgpCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> 
<c:if test="${media.genre eq '4300'}">
    <!--반복 시작 지점-->
    <div>
		<div id=poster>
			<a href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}" class="postpic">
			<img id="pic" src="${media.p_img}" class="img-responsive img-rounded"  onerror="this.src='${pageContext.request.contextPath}/resources/img/logo2.png'"/><p class="hover_text"><b>${media.title}</b></p></a>
		</div>
	</div> 
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 다큐멘터리:내셔널지오그래픽 부분 종료-->
<pre>

</pre>
</c:when>
<c:when test="${dNgpCnt eq '0'}">
<p><span id="keywd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
</c:when>
<c:when test="${doc eq '0'}">
<table class="table table-bordered">
<tr><th><span id="keywd">'${keyword}'</span>에 대한 검색결과가 없습니다.</th></tr>
<tr><td>단어의 철자가 정확한지 확인해 보세요.<br>
한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.<br>
검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.<br>
두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.</td></tr>
</table>
<pre>

</pre>
</c:when>
</c:choose>
</div> <!-- 다큐멘터리 전체 블록  종료 -->

<!-- 애니 전체 블록 시작 -->
<div class="container" id="animation"> 
<c:choose>
<c:when test="${ac gt '0'}">
<!-- 애니:디즈니 부분 -->
<pre>

</pre>
<p id="titleHeader"><b>디즈니(${aDCnt})</b></p> <!-- 장르명(검색 갯 수)-->
<c:choose>
<c:when test="${aDCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> <!-- 검색결과를 media라는 이름으로 list타입으로 가져오기  -->
<c:if test="${media.genre eq '5100'}">
    <!--반복 시작 지점-->
    <div>
		<div id=poster>
			<a href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}" class="postpic">
			<img id="pic" src="${media.p_img}" class="img-responsive img-rounded"  onerror="this.src='${pageContext.request.contextPath}/resources/img/logo2.png'"/><p class="hover_text"><b>${media.title}</b></p></a>
		</div>
	</div> 
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 애니:디즈니 부분 종료-->
</c:when>
<c:when test="${aDCnt eq '0'}">
<p><span id="keywd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>

<!-- 애니:지브리 부분 -->
<pre>

</pre>
<p id="titleHeader"><b>지브리(${aJCnt})</b></p>
<c:choose>
<c:when test="${aJCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media">
<c:if test="${media.genre eq '5200'}">
    <!--반복 시작 지점-->
    <div>
		<div id=poster>
			<a href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}" class="postpic">
			<img id="pic" src="${media.p_img}" class="img-responsive img-rounded"  onerror="this.src='${pageContext.request.contextPath}/resources/img/logo2.png'"/><p class="hover_text"><b>${media.title}</b></p></a>
		</div>
	</div> 
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 애니:지브리 부분 종료-->
<pre>

</pre>
</c:when>
<c:when test="${aJCnt eq '0'}">
<p><span id="keywd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
<br>
</c:when>
<c:when test="${ac eq '0'}">
<table class="table table-bordered">
<tr><th><span id="keywd">'${keyword}'</span>에 대한 검색결과가 없습니다.</th></tr>
<tr><td>단어의 철자가 정확한지 확인해 보세요.<br>
한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.<br>
검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.<br>
두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.</td></tr>
</table>
<pre>

</pre>
</c:when>
</c:choose>
</div> <!-- 애니 전체 블록  종료 -->
</c:when>
<c:when test="${empty keyword}">
<table class="table table-bordered">
<tr><th id="keywd">검색어가 입력되지 않았습니다!</th></tr>
<tr><td>단어의 철자가 정확한지 확인해 보세요.<br>
한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.<br>
검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.<br>
두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.</td></tr>
</table>
<pre>

</pre>
</c:when>
</c:choose>
</div> <!-- 전체 블록 종료 -->
<%@ include file="../footer.jsp" %>
</body>
</html>