<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 검색 결과</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<%-- <link rel= "stylesheet" href="${pageContext.request.contextPath}/css/productsResults.css">
 --%>
 
<style>
	.container content, .container aside {
		position: relative;
  }

	figure {
		width: auto;
		position: relative;
  }
  
	figure img {
	    display: block;
	    width: auto;
	    height: auto;
  } 
  	figure .overlay {
	    position: absolute;
	    bottom: 0;
	    left: 0;  /* 10% */
	    right: 0;
	    overflow: hidden;
	    width: auto; /* 사진사이즈와 맞춤  190px*/
	    height: 0;
	    color: #fff;
	    background: rgba(0, 0, 0, 0.9); /* 0.7 */
	    -webkit-transition: .2s ease; /* 0.3 */
	    transition: .2s ease;/* 0.3 */
  	}  	
 	figure .overlay .description {
	    font-size: 15px;
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    -webkit-transform: translate(-50%, -50%);
	    -ms-transform: translate(-50%, -50%);
	    transform: translate(-50%, -50%);
	    text-align: center;
 	}  
	figure:hover .overlay {
	    display: block;
	    height: 100%;
	}  
	#pic{
		width: auto;  /* 190  */
		height: 260px; /*  260 */
	}  
	a:link{
		color : white;
		text-decoration: none;
	}	
	a:visited{
		color: white;
	}	
	a:hover{
		color: gold;
		text-decoration: underline;
	}
	a:active{
		color: gold;
		text-decoration: indigo;
}

	#titleHeader{
		background: rgba(0, 0, 0, 0.4); /* 0.5  */
		color:white;
		font-size:25px;
	}
</style>

 
 
 </head>
<body>
<%@ include file="../header.jsp" %>

<div class="jumbotron">
   <div class="container">
      <h1 class="display-3">카테고리 검색 결과</h1>
   </div>
</div>
<div class="container" id="total"> <!-- 전체 블록 시작 -->
<c:choose>
<c:when test="${not empty keyword}">
<p align="right"><b>[${keyword}]</b>의 검색결과는 총 <b>[${searchCnt}]</b>건 입니다.</p>
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
    <aside class="col-sm-3 col-sm-2 col-sm-3">
        <figure>
          <img id="pic" src="${media.p_img}" class="img-responsive img-rounded" valign="absmiddle" onerror="this.src='https://epasskorea.com/Public_html/Images/common/noimage.jpg'"/> 
          <%-- <h5>${media.title}</h5> 사진의 제목명 쓰는 부분 --%>
          <div class="overlay">
            <div class="description">
	             <a href="/Product/productDetail?pno=${media.pno}" id="subject"> <!-- 추후 product 상세페이지 연결 부분 get방식으로 연결-->
	             	<b>${media.title}</b>
             	</a>
            </div>
          </div>
        </figure>
	</aside>
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 영화:공포 부분 종료-->
</c:when>
<c:when test="${mHorrorCnt eq '0'}">
<p><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
<br>


<!-- 영화:액션 부분 -->
<p id="titleHeader"><b>액션(${mActionCnt})</b></p> <!-- 장르명(검색결과 갯 수)-->
<c:choose>
<c:when test="${mActionCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media">
<c:if test="${media.genre eq '1200'}">
    <!--반복 시작 지점-->
    <aside class="col-sm-3 col-sm-2 col-sm-3">
        <figure>
          <img id="pic" src="${media.p_img}" Mclass="img-responsive img-rounded" valign="absmiddle" onerror="this.src='https://epasskorea.com/Public_html/Images/common/noimage.jpg'"/> 
          <div class="overlay">
            <div class="description">
	             <a href="/Product/productDetail?pno=${media.pno}" id="subject">
					<b>${media.title}</b>
             	</a>
            </div>
          </div>
        </figure>
	</aside>
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 영화:액션 부분 종료-->
</c:when>
<c:when test="${mActionCnt eq '0'}">
<p><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
<br>



<!-- 영화:범죄/스릴러 부분 -->
<p id="titleHeader"><b>범죄/스릴러(${mCrimeCnt})</b></p> <!-- 장르명(검색결과 갯 수)-->
<c:choose>
<c:when test="${mCrimeCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> 
<c:if test="${media.genre eq '1300'}">
    <!--반복 시작 지점-->
    <aside class="col-sm-3 col-sm-2 col-sm-3">
        <figure>
          <img id="pic" src="${media.p_img}" class="img-responsive img-rounded" valign="absmiddle" onerror="this.src='https://epasskorea.com/Public_html/Images/common/noimage.jpg'"/> 
          <div class="overlay">
            <div class="description">
	             <a href="/Product/productDetail?pno=${media.pno}" id="subject"> 
					<b>${media.title}</b>
             	</a>
            </div>
          </div>
        </figure>
	</aside>
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 영화:범죄/스릴러 부분 종료-->
</c:when>
<c:when test="${mCrimeCnt eq '0'}">
<p><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
<br>


<!-- 영화:전쟁 부분 -->
<p id="titleHeader"><b>전쟁(${mWarCnt})</b></p> <!-- 장르명(검색결과 갯 수)-->
<c:choose>
<c:when test="${mWarCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> 
<c:if test="${media.genre eq '1400'}">
    <!--반복 시작 지점-->
    <aside class="col-sm-3 col-sm-2 col-sm-3">
        <figure>
          <img id="pic" src="${media.p_img}" class="img-responsive img-rounded" valign="absmiddle" onerror="this.src='https://epasskorea.com/Public_html/Images/common/noimage.jpg'"/> 
          <div class="overlay">
            <div class="description">
	             <a href="/Product/productDetail?pno=${media.pno}" id="subject">
					<b>${media.title}</b>
             	</a>
            </div>
          </div>
        </figure>
	</aside>
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 영화:전쟁 부분 종료-->
</c:when>
<c:when test="${mWarCnt eq '0'}">
<p><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
<br>


<!-- 영화:판타지/SF 부분 -->
<p id="titleHeader"><b>판타지/SF(${mSFCnt})</b></p> <!-- 장르명(검색 갯 수)-->
<c:choose>
<c:when test="${mSFCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> 
<c:if test="${media.genre eq '1500'}">
    <!--반복 시작 지점-->
    <aside class="col-sm-3 col-sm-2 col-sm-3">
        <figure>
          <img id="pic" src="${media.p_img}" class="img-responsive img-rounded" valign="absmiddle" onerror="this.src='https://epasskorea.com/Public_html/Images/common/noimage.jpg'"/> 
          <div class="overlay">
            <div class="description">
	             <a href="/Product/productDetail?pno=${media.pno}" id="subject">
					<b>${media.title}</b>
             	</a>
            </div>
          </div>
        </figure>
	</aside>
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 영화:판타지/SF 부분 종료-->
</c:when>
<c:when test="${mSFCnt eq '0'}">
<p><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
<br>


<!-- 영화:코미디 부분 -->
<p id="titleHeader"><b>코미디(${mComedyCnt})</b></p> <!-- 장르명(검색 갯 수)-->
<c:choose>
<c:when test="${mComedyCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> 
<c:if test="${media.genre eq '1600'}">
    <!--반복 시작 지점-->
    <aside class="col-sm-3 col-sm-2 col-sm-3">
        <figure>
          <img id="pic" src="${media.p_img}" class="img-responsive img-rounded" valign="absmiddle" onerror="this.src='https://epasskorea.com/Public_html/Images/common/noimage.jpg'"/> 
          <div class="overlay">
            <div class="description">
	             <a href="/Product/productDetail?pno=${media.pno}" id="subject">
					<b>${media.title}</b>
             	</a>
            </div>
          </div>
        </figure>
	</aside>
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 영화:코미디 부분 종료-->
</c:when>
<c:when test="${mComedyCnt eq '0'}">
<p><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
<br>


<!-- 영화:멜로/로맨스 부분 -->
<p id="titleHeader"><b>멜로/로맨스(${mRomanceCnt})</b></p> <!-- 장르명(검색 갯 수)-->
<c:choose>
<c:when test="${mRomanceCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> 
<c:if test="${media.genre eq '1700'}">
    <!--반복 시작 지점-->
    <aside class="col-sm-3 col-sm-2 col-sm-3">
        <figure>
          <img id="pic" src="${media.p_img}" class="img-responsive img-rounded" valign="absmiddle" onerror="this.src='https://epasskorea.com/Public_html/Images/common/noimage.jpg'"/> 
          <div class="overlay">
            <div class="description">
	             <a href="/Product/productDetail?pno=${media.pno}" id="subject">
					<b>${media.title}</b>
             	</a>
            </div>
          </div>
        </figure>
	</aside>
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 영화:멜로/로맨스  부분 종료-->
</c:when>
<c:when test="${mRomanceCnt eq '0'}">
<p><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
<br>
</c:when>
<c:when test="${mc eq '0'}">
<table>
<tr><th>'${keyword}'에 대한 검색결과가 없습니다.</th></tr>
<tr><td>단어의 철자가 정확한지 확인해 보세요.<br>
한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.<br>
검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.<br>
두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.</td></tr>
</table>
</c:when>
</c:choose>
</div>


<!-- 드라마 전체 블록 시작 -->

<div class="container" id="drama"> 
<c:choose>
<c:when test="${dc gt '0'}">
<!-- 드라마:미국 부분 -->
<p id="titleHeader"><b>미국(${dUsCnt})</b></p> <!-- 장르명(검색 갯 수)-->
<c:choose>
<c:when test="${dUsCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> <!-- 검색결과를 media라는 이름으로 list타입으로 가져오기  -->
<c:if test="${media.genre eq '2100'}">
    <!--반복 시작 지점-->
    <aside class="col-sm-3 col-sm-2 col-sm-3">
        <figure>
          <img id="pic" src="${media.p_img}" class="img-responsive img-rounded" valign="absmiddle" onerror="this.src='https://epasskorea.com/Public_html/Images/common/noimage.jpg'"/> 
          <div class="overlay">
            <div class="description">
	             <a href="/Product/productDetail?pno=${media.pno}" id="subject">
					<b>${media.title}</b>
             	</a>
            </div>
          </div>
        </figure>
	</aside>
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 드라마:미국 부분 종료-->
</c:when>
<c:when test="${dUsCnt eq '0'}">
<p><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
<br>


<!-- 드라마:일본 부분 -->
<p id="titleHeader"><b>일본(${dJpnCnt})</b></p>
<c:choose>
<c:when test="${dJpnCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media">
<c:if test="${media.genre eq '2200'}">
    <!--반복 시작 지점-->
    <aside class="col-sm-3 col-sm-2 col-sm-3">
        <figure>
          <img id="pic" src="${media.p_img}" class="img-responsive img-rounded" valign="absmiddle" onerror="this.src='https://epasskorea.com/Public_html/Images/common/noimage.jpg'"/> 
          <div class="overlay">
            <div class="description">
	             <a href="/Product/productDetail?pno=${media.pno}" id="subject">
					<b>${media.title}</b>
             	</a>
            </div>
          </div>
        </figure>
	</aside>
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 드라마:일본 부분 종료-->
</c:when>
<c:when test="${dJpnCnt eq '0'}">
<p><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
<br>



<!-- 드라마:한국 부분 -->
<p id="titleHeader"><b>한국(${dKorCnt})</b></p> <!-- 장르명(검색 갯 수)-->
<c:choose>
<c:when test="${dKorCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> 
<c:if test="${media.genre eq '2300'}">
    <!--반복 시작 지점-->
    <aside class="col-sm-3 col-sm-2 col-sm-3">
        <figure>
          <img id="pic" src="${media.p_img}" class="img-responsive img-rounded" valign="absmiddle" onerror="this.src='https://epasskorea.com/Public_html/Images/common/noimage.jpg'"/> 
          <div class="overlay">
            <div class="description">
	             <a href="/Product/productDetail?pno=${media.pno}" id="subject">
					<b>${media.title}</b>
             	</a>
            </div>
          </div>
        </figure>
	</aside>
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 드라마:한국 부분 종료-->
</c:when>
<c:when test="${dKorCnt eq '0'}">
<p><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
<br>
</c:when>
<c:when test="${dc eq '0'}">
<div class="container">
<table class="table table-bordered">
<tr><th>'${keyword}'에 대한 검색결과가 없습니다.</th></tr>
<tr><td>단어의 철자가 정확한지 확인해 보세요.<br>
한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.<br>
검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.<br>
두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.</td></tr>
</table>
</div>
</c:when>
</c:choose>
</div> <!-- 드라마 전체 블록  종료 -->


<!-- 예능 전체 블록 시작 -->
<div class="container" id="entertain"> 
<c:choose>
<c:when test="${ec gt '0'}">
<!-- 예능:KBS 부분 -->
<p id="titleHeader"><b>KBS(${eKbsCnt})</b></p> <!-- 장르명(검색 갯 수)-->
<c:choose>
<c:when test="${eKbsCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> <!-- 검색결과를 media라는 이름으로 list타입으로 가져오기  -->
<c:if test="${media.genre eq '3100'}">
    <!--반복 시작 지점-->
    <aside class="col-sm-3 col-sm-2 col-sm-3">
        <figure>
          <img id="pic" src="${media.p_img}" class="img-responsive img-rounded" valign="absmiddle" onerror="this.src='https://epasskorea.com/Public_html/Images/common/noimage.jpg'"/> 
          <div class="overlay">
            <div class="description">
	             <a href="/Product/productDetail?pno=${media.pno}" id="subject">
					<b>${media.title}</b>
             	</a>
            </div>
          </div>
        </figure>
	</aside>
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 예능:KBS 부분 종료-->
</c:when>
<c:when test="${eKbsCnt eq '0'}">
<p><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
<br>


<!-- 예능:SBS 부분 -->
<p id="titleHeader"><b>SBS(${eSbsCnt})</b></p>
<c:choose>
<c:when test="${eSbsCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media">
<c:if test="${media.genre eq '3200'}">
    <!--반복 시작 지점-->
    <aside class="col-sm-3 col-sm-2 col-sm-3">
        <figure>
          <img id="pic" src="${media.p_img}" class="img-responsive img-rounded" valign="absmiddle" onerror="this.src='https://epasskorea.com/Public_html/Images/common/noimage.jpg'"/> 
          <div class="overlay">
            <div class="description">
	             <a href="/Product/productDetail?pno=${media.pno}" id="subject">
					<b>${media.title}</b>
             	</a>
            </div>
          </div>
        </figure>
	</aside>
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 예능:SBS 부분 종료-->
</c:when>
<c:when test="${eSbsCnt eq '0'}">
<p><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
<br>



<!-- 예능:MBC 부분 -->
<p id="titleHeader"><b>MBC(${eMbcCnt})</b></p> <!-- 장르명(검색 갯 수)-->
<c:choose>
<c:when test="${eMbcCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> 
<c:if test="${media.genre eq '3300'}">
    <!--반복 시작 지점-->
    <aside class="col-sm-3 col-sm-2 col-sm-3">
        <figure>
          <img id="pic" src="${media.p_img}" class="img-responsive img-rounded" valign="absmiddle" onerror="this.src='https://epasskorea.com/Public_html/Images/common/noimage.jpg'"/> 
          <div class="overlay">
            <div class="description">
	             <a href="/Product/productDetail?pno=${media.pno}" id="subject">
					<b>${media.title}</b>
             	</a>
            </div>
          </div>
        </figure>
	</aside>
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 예능:MBC 부분 종료-->
</c:when>
<c:when test="${eMbcCnt eq '0'}">
<p><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
<br>


<!-- 예능:TVN 부분 -->
<p id="titleHeader"><b>TVN(${eTvnCnt})</b></p> <!-- 장르명(검색 갯 수)-->
<c:choose>
<c:when test="${eTvnCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> 
<c:if test="${media.genre eq '3400'}">
    <!--반복 시작 지점-->
    <aside class="col-sm-3 col-sm-2 col-sm-3">
        <figure>
          <img id="pic" src="${media.p_img}" class="img-responsive img-rounded" valign="absmiddle" onerror="this.src='https://epasskorea.com/Public_html/Images/common/noimage.jpg'"/> 
          <div class="overlay">
            <div class="description">
	             <a href="/Product/productDetail?pno=${media.pno}" id="subject">
					<b>${media.title}</b>
             	</a>
            </div>
          </div>
        </figure>
	</aside>
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 예능:TVN 부분 종료-->
</c:when>
<c:when test="${eTvnCnt eq '0'}">
<p><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
<br>


<!-- 예능:JTBC 부분 -->
<p id="titleHeader"><b>JTBC(${eJtbcCnt})</b></p> <!-- 장르명(검색 갯 수)-->
<c:choose>
<c:when test="${eJtbcCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> 
<c:if test="${media.genre eq '3500'}">
    <!--반복 시작 지점-->
    <aside class="col-sm-3 col-sm-2 col-sm-3">
        <figure>
          <img id="pic" src="${media.p_img}" class="img-responsive img-rounded" valign="absmiddle" onerror="this.src='https://epasskorea.com/Public_html/Images/common/noimage.jpg'"/> 
          <div class="overlay">
            <div class="description">
	             <a href="/Product/productDetail?pno=${media.pno}" id="subject">
					<b>${media.title}</b>
             	</a>
            </div>
          </div>
        </figure>
	</aside>
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 예능:JTBC 부분 종료-->
</c:when>
<c:when test="${eJtbcCnt eq '0'}">
<p><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
<br>
</c:when>
<c:when test="${ec eq '0'}">
<table class="table table-bordered">
<tr><th>'${keyword}'에 대한 검색결과가 없습니다.</th></tr>
<tr><td>단어의 철자가 정확한지 확인해 보세요.<br>
한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.<br>
검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.<br>
두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.</td></tr>
</table>
</c:when>
</c:choose>
</div> <!-- 예능 전체 블록 종료 -->


<!-- 다큐멘터리 전체 블록 시작 -->
<div class="container" id="documetary"> 
<c:choose>
<c:when test="${doc gt '0'}">
<p id="titleHeader"><b>히스토리(${dHisCnt})</b></p> <!-- 장르명(검색 갯 수)-->
<c:choose>
<c:when test="${dHisCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media">
<c:if test="${media.genre eq '4100'}">
    <!--반복 시작 지점-->
    <aside class="col-sm-3 col-sm-2 col-sm-3">
        <figure>
          <img id="pic" src="${media.p_img}" class="img-responsive img-rounded" valign="absmiddle" onerror="this.src='https://epasskorea.com/Public_html/Images/common/noimage.jpg'"/> 
          <div class="overlay">
            <div class="description">
	             <a href="/Product/productDetail?pno=${media.pno}" id="subject">
					<b>${media.title}</b>
             	</a>
            </div>
          </div>
        </figure>
	</aside>
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 다큐멘터리:히스토리 부분 종료-->
</c:when>
<c:when test="${dHisCnt eq '0'}">
<p><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
<br>


<!-- 다큐멘터리:디스커버리 부분 -->
<p id="titleHeader"><b>디스커버리(${dDscvCnt})</b></p>
<c:choose>
<c:when test="${dDscvCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media">
<c:if test="${media.genre eq '4200'}">
    <!--반복 시작 지점-->
    <aside class="col-sm-3 col-sm-2 col-sm-3">
        <figure>
          <img id="pic" src="${media.p_img}" class="img-responsive img-rounded" valign="absmiddle" onerror="this.src='https://epasskorea.com/Public_html/Images/common/noimage.jpg'"/> 
          <div class="overlay">
            <div class="description">
	             <a href="/Product/productDetail?pno=${media.pno}" id="subject">
					<b>${media.title}</b>
             	</a>
            </div>
          </div>
        </figure>
	</aside>
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 다큐멘터리:디스커버리 부분 종료-->
</c:when>
<c:when test="${dDscvCnt eq '0'}">
<p><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
<br>



<!-- 다큐멘터리:내셔널지오그래픽 부분 -->
<p id="titleHeader"><b>내셔널지오그래픽(${dNgpCnt})</b></p> <!-- 장르명(검색 갯 수)-->
<c:choose>
<c:when test="${dNgpCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> 
<c:if test="${media.genre eq '4300'}">
    <!--반복 시작 지점-->
    <aside class="col-sm-3 col-sm-2 col-sm-3">
        <figure>
          <img id="pic" src="${media.p_img}" class="img-responsive img-rounded" valign="absmiddle" onerror="this.src='https://epasskorea.com/Public_html/Images/common/noimage.jpg'"/> 
          <div class="overlay">
            <div class="description">
	             <a href="/Product/productDetail?pno=${media.pno}" id="subject">
					<b>${media.title}</b>
             	</a>
            </div>
          </div>
        </figure>
	</aside>
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 다큐멘터리:내셔널지오그래픽 부분 종료-->
</c:when>
<c:when test="${dNgpCnt eq '0'}">
<p><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
<br>
</c:when>
<c:when test="${doc eq '0'}">
<table class="table table-bordered">
<tr><th>'${keyword}'에 대한 검색결과가 없습니다.</th></tr>
<tr><td>단어의 철자가 정확한지 확인해 보세요.<br>
한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.<br>
검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.<br>
두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.</td></tr>
</table>
</c:when>
</c:choose>
</div> <!-- 다큐멘터리 전체 블록  종료 -->

<!-- 애니 전체 블록 시작 -->
<div class="container" id="animation"> 
<c:choose>
<c:when test="${ac gt '0'}">
<!-- 애니:디즈니 부분 -->
<p id="titleHeader"><b>디즈니(${aDCnt})</b></p> <!-- 장르명(검색 갯 수)-->
<c:choose>
<c:when test="${aDCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media"> <!-- 검색결과를 media라는 이름으로 list타입으로 가져오기  -->
<c:if test="${media.genre eq '5100'}">
    <!--반복 시작 지점-->
    <aside class="col-sm-3 col-sm-2 col-sm-3">
        <figure>
          <img id="pic" src="${media.p_img}" class="img-responsive img-rounded" valign="absmiddle" onerror="this.src='https://epasskorea.com/Public_html/Images/common/noimage.jpg'"/> 
          <div class="overlay">
            <div class="description">
	             <a href="/Product/productDetail?pno=${media.pno}" id="subject">
					<b>${media.title}</b>
             	</a>
            </div>
          </div>
        </figure>
	</aside>
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 애니:디즈니 부분 종료-->
</c:when>
<c:when test="${aDCnt eq '0'}">
<p><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
<br>


<!-- 애니:지브리 부분 -->
<p id="titleHeader"><b>지브리(${aJCnt})</b></p>
<c:choose>
<c:when test="${aJCnt gt '0'}">
<div class="row" align="center">
<c:forEach items="${productsList}" var="media">
<c:if test="${media.genre eq '5200'}">
    <!--반복 시작 지점-->
    <aside class="col-sm-3 col-sm-2 col-sm-3">
        <figure>
          <img id="pic" src="${media.p_img}" class="img-responsive img-rounded" valign="absmiddle" onerror="this.src='https://epasskorea.com/Public_html/Images/common/noimage.jpg'"/> 
          <div class="overlay">
            <div class="description">
	             <a href="/Product/productDetail?pno=${media.pno}" id="subject">
					<b>${media.title}</b>
             	</a>
            </div>
          </div>
        </figure>
	</aside>
</c:if>	
</c:forEach>	<!--반복 종료 지점-->
</div> <!-- 애니:지브리 부분 종료-->
</c:when>
<c:when test="${aJCnt eq '0'}">
<p><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</p>
</c:when>
</c:choose>
<br>
</c:when>
<c:when test="${ac eq '0'}">
<table class="table table-bordered">
<tr><th>'${keyword}'에 대한 검색결과가 없습니다.</th></tr>
<tr><td>단어의 철자가 정확한지 확인해 보세요.<br>
한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.<br>
검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.<br>
두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.</td></tr>
</table>
</c:when>
</c:choose>
</div> <!-- 애니 전체 블록  종료 -->
</c:when>
<c:when test="${empty keyword}">
<table class="table table-bordered">
<tr><th>검색어가 입력되지 않았습니다!</th></tr>
<tr><td>단어의 철자가 정확한지 확인해 보세요.<br>
한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.<br>
검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.<br>
두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.</td></tr>
</table>
</c:when>
</c:choose>
</div> <!-- 전체 블록 종료 -->

<%@ include file="../footer.jsp" %>
</body>
</html>