<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<script> 
	//검색단어 bold처리
    $(document).ready(function(){
        fnKeyWordHighlights("#highlight > td","${keyword}");
    });

    function fnKeyWordHighlights(obj,keyword)
    {
        $(obj).each(function(){ 
            $(this).html($(this).html().replace(eval("/"+keyword+"/gi"), "<span style='color:black;font-weight:bold;'>"+keyword+"</span>"));
        });
    }
</script>
<body>
<%-- <jsp:include page=""/> 추후 상단 header들어갈 부분 --%>
<div class="jumbotron">
   <div class="container">
      <h1 class="display-3">검색 결과</h1>
   </div>
</div>

<c:set var="cnt" value="${searchCnt}"/>
<c:choose>
<c:when test="${not empty keyword && cnt gt '0'}"> <!-- gt는 > 비교 연산자임 즉 cnt > 0의미-->
<div class="container" id="total">
<p align="right"><b>[${keyword}]</b>의 검색결과는 총 <b>[${searchCnt}]</b>건 입니다.</p>
													
<table class="table table-bordered">
	<tr><td width="180"><b>제목</b></td><td width="120" align="center"><b>장르</b></td><td width="100" align="center"><b>개봉연도</b></td><td width="100" align="center"><b>국가</b></td><td width="190" align="center"><b>출연진</b></td><td width="80" align="center"><b>감독</b></td><td width="390"><b>줄거리</b></td></tr>
</table>
<br>
<c:set var="mc" value="${mCnt}"/>
<c:choose>
<c:when test="${mc gt '0'}">
<table class="table table-bordered">
	<tr><th colspan="7">영화 (${mc})</th></tr>
	<c:forEach items="${productsList}" var="media"> 
		<c:if test="${media.category eq '1000'}"> <!--카테고리 1000번 => 영화-->
			<tr id="highlight"><td width="180"><a href="/Product/productDetail?pno=${media.pno}">${media.title}</a></td><td align="center" width="120">${media.gen_name}</td><td width="100" align="center">${media.year}</td><td width="100" align="center">${media.country}</td><td width="190" align="center">${media.casting}</td><td width="80" align="center">${media.director}</td><td width="390">${media.description}</td></tr>
		</c:if> 
	</c:forEach>
</table>
</c:when>
<c:when test="${mc eq '0'}">
<table class="table table-bordered">
<tr><th colspan="7"><b>영화 (${mc})</b></th></tr>
<tr><td colspan="7"><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</td></tr>
</table>
</c:when>
</c:choose>
<br>

<c:set var="dc" value="${dramaCnt}"/>
<c:choose>
<c:when test="${dc gt '0'}">
<table class="table table-bordered">	
	<tr><th colspan="7">드라마 (${dc})</th></tr>
	<c:forEach items="${productsList}" var="media"> 
		<c:if test="${media.category eq '2000'}"> <!--카테고리 2000번 => 드라마 -->
			<tr id="highlight"><td width="180"><a href="/Product/productDetail?pno=${media.pno}">${media.title}</a></td><td width="120" align="center">${media.gen_name}</td><td width="100" align="center">${media.year}</td><td width="100" align="center">${media.country}</td><td width="190" align="center">${media.casting}</td><td width="80" align="center">${media.director}</td><td width="390">${media.description}</td></tr>
		</c:if> 
	</c:forEach>
</table>
</c:when>
<c:when test="${dc eq '0'}">
<table class="table table-bordered">
<tr><th colspan="7"><b>드라마 (${dc})</b></th></tr>
<tr><td colspan="7"><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</td></tr>
</table>
</c:when>
</c:choose>
<br>

<c:set var="ec" value="${eCnt}"/>
<c:choose>
<c:when test="${ec gt '0'}">
<table class="table table-bordered">	
	<tr><th colspan="7">예능 (${ec})</th></tr>
	<c:forEach items="${productsList}" var="media"> 
		<c:if test="${media.category eq '3000'}"> <!--카테고리 3000번 => 예능 -->
			<tr id="highlight"><td width="180"><a href="/Product/productDetail?pno=${media.pno}">${media.title}</a></td><td width="120" align="center">${media.gen_name}</td><td width="100" align="center">${media.year}</td><td width="100" align="center">${media.country}</td><td width="190" align="center">${media.casting}</td><td width="80" align="center">${media.director}</td><td width="390">${media.description}</td></tr>
		</c:if>
	</c:forEach>
</table>
</c:when>
<c:when test="${ec eq '0'}">
<table class="table table-bordered">
<tr><th colspan="7"><b>예능 (${ec})</b></th></tr>
<tr><td colspan="7"><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</td></tr>
</table>
</c:when>
</c:choose>
<br>


<c:set var="docuc" value="${docuCnt}"/>
<c:choose>
<c:when test="${docuc gt '0'}">
<table class="table table-bordered">	
	<tr><th colspan="7">다큐멘터리 (${docuc})</th></tr>
	<c:forEach items="${productsList}" var="media">
		<c:if test="${media.category eq '4000'}"> <!--카테고리 4000번 => 다큐멘터리 -->
			<tr id="highlight"><td width="180"><a href="/Product/productDetail?pno=${media.pno}">${media.title}</a></td><td width="120" align="center">${media.gen_name}</td><td width="100" align="center">${media.year}</td><td width="100" align="center">${media.country}</td><td width="190" align="center">${media.casting}</td><td width="80" align="center">${media.director}</td><td width="390">${media.description}</td></tr>
		</c:if> 
	</c:forEach>
</table>
</c:when>

<c:when test="${docuc eq '0'}">
<table class="table table-bordered">
<tr><th colspan="7"><b>다큐멘터리 (${docuc})</b></th></tr>
<tr><td colspan="7"><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</td></tr>
</table>
</c:when>
</c:choose>
<br>


<c:set var="ac" value="${aCnt}"/>
<c:choose>
<c:when test="${ac gt '0'}">
<table class="table table-bordered">	
	<tr><th colspan="7">애니메이션 (${ac})</th></tr>
	<c:forEach items="${productsList}" var="media">
		<c:if test="${media.category eq '5000'}"> <!--카테고리 5000번 => 애니메이션 -->
			<tr id="highlight"><td width="180"><a href="/Product/productDetail?pno=${media.pno}">${media.title}</a></td><td width="120" align="center">${media.gen_name}</td><td width="100" align="center">${media.year}</td><td width="100" align="center">${media.country}</td><td width="190" align="center">${media.casting}</td><td width="80" align="center">${media.director}</td><td width="390">${media.description}</td></tr>
		</c:if>
	</c:forEach>
</table>
</c:when>
<c:when test="${ac eq '0'}">
<table class="table table-bordered">
<tr><th colspan="7"><b>애니메이션 (${ac})</b></th></tr>
<tr><td colspan="7"><b>[${keyword}]</b>에 대한 검색결과가 없습니다.</td></tr>
</table>
</c:when>
</c:choose>
</div>
</c:when>

<c:when test="${not empty keyword && cnt eq '0'}">
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

<c:when test="${keyword eq ''}">
<div class="container">
<table class="table table-bordered">
<tr><th>검색어가 입력되지 않았습니다!</th></tr>
<tr><td>단어의 철자가 정확한지 확인해 보세요.<br>
한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.<br>
검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.<br>
두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.</td></tr>
</table>
</div>
</c:when>
</c:choose>
<%-- <jsp:include page=""/> 추후 상단 푸터 들어갈 부분 --%>
</body>
</html>