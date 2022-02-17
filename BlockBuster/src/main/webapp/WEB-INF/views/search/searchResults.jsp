<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>통합 검색 결과</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
 body { margin:0; padding:0; font-family:'sans-serif', verdana;}
 th, td {
           color: #f5f5f5;
        }
 #noneKeyword, #mainkeyword, #headPart>td, #ctgr, #kwd {color: #ff7f00;}
 #link {color: #ffd600; font-weight:bold;}
</style>
<script> 
	//검색단어 bold처리
    $(document).ready(function(){
        fnKeyWordHighlights("#highlight > td","${keyword}");
    });

    function fnKeyWordHighlights(obj,keyword)
    {
        $(obj).each(function(){ 
            $(this).html($(this).html().replace(eval("/"+keyword+"/gi"), "<span style='color:#ff7f00;font-weight:bold;'>"+keyword+"</span>"));
        });
    }
</script>
<body>
<%@ include file="../header.jsp" %>
<div class="container">
<c:set var="cnt" value="${searchCnt}"/>
<pre>

</pre>
<c:choose>
<c:when test="${not empty keyword}">
<p align="right"><span id="kwd"><b>[${keyword}]</b></span>의 통합 검색 결과는 총<span id="kwd"><b>[${searchCnt}]</b></span>건 입니다.</p>	
</c:when>
</c:choose>
</div>
<c:choose>
<c:when test="${not empty keyword && cnt gt '0'}"> <!-- gt는 > 비교 연산자임 즉 cnt > 0의미-->
<div class="container" id="total">						
<table class="table table-bordered">
	<tr id="headPart"><td width="180"><b>제목</b></td><td width="120" align="center"><b>장르</b></td><td width="100" align="center"><b>개봉연도</b></td><td width="100" align="center"><b>국가</b></td><td width="190" align="center"><b>출연진</b></td><td width="80" align="center"><b>감독</b></td><td width="390"><b>줄거리</b></td></tr>
</table>
<br>
<c:set var="mc" value="${mCnt}"/>
<c:choose>
<c:when test="${mc gt '0'}">
<table class="table table-bordered">
	<tr><th colspan="7" id="ctgr">영화 (${mc})</th></tr>
	<c:forEach items="${productsList}" var="media"> 
		<c:if test="${media.category eq '1000'}"> <!--카테고리 1000번 => 영화-->
			<tr id="highlight"><td width="180"><a id="link" href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}">${media.title}</a></td><td align="center" width="120">${media.gen_name}</td><td width="100" align="center">${media.year}</td><td width="100" align="center">${media.country}</td><td width="190" align="center">${media.casting}</td><td width="80" align="center">${media.director}</td><td width="390">${media.description}</td></tr>
		</c:if> 
	</c:forEach>
</table>
</c:when>
<c:when test="${mc eq '0'}">
<table class="table table-bordered">
<tr><th id="ctgr" colspan="7"><b >영화 (${mc})</b></th></tr>
<tr><td colspan="7"><span id="kwd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</td></tr>
</table>
</c:when>
</c:choose>
<br>

<c:set var="dc" value="${dramaCnt}"/>
<c:choose>
<c:when test="${dc gt '0'}">
<table class="table table-bordered">	
	<tr><th colspan="7"  id="ctgr">드라마 (${dc})</th></tr>
	<c:forEach items="${productsList}" var="media"> 
		<c:if test="${media.category eq '2000'}"> <!--카테고리 2000번 => 드라마 -->
			<tr id="highlight"><td width="180"><a id="link" href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}">${media.title}</a></td><td width="120" align="center">${media.gen_name}</td><td width="100" align="center">${media.year}</td><td width="100" align="center">${media.country}</td><td width="190" align="center">${media.casting}</td><td width="80" align="center">${media.director}</td><td width="390">${media.description}</td></tr>
		</c:if> 
	</c:forEach>
</table>
</c:when>
<c:when test="${dc eq '0'}">
<table class="table table-bordered">
<tr><th id="ctgr" colspan="7"><b>드라마 (${dc})</b></th></tr>
<tr><td colspan="7"><span id="kwd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</td></tr>
</table>
</c:when>
</c:choose>
<br>

<c:set var="ec" value="${eCnt}"/>
<c:choose>
<c:when test="${ec gt '0'}">
<table class="table table-bordered">	
	<tr><th colspan="7" id="ctgr">예능 (${ec})</th></tr>
	<c:forEach items="${productsList}" var="media"> 
		<c:if test="${media.category eq '3000'}"> <!--카테고리 3000번 => 예능 -->
			<tr id="highlight"><td width="180"><a id="link" href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}">${media.title}</a></td><td width="120" align="center">${media.gen_name}</td><td width="100" align="center">${media.year}</td><td width="100" align="center">${media.country}</td><td width="190" align="center">${media.casting}</td><td width="80" align="center">${media.director}</td><td width="390">${media.description}</td></tr>
		</c:if>
	</c:forEach>
</table>
</c:when>
<c:when test="${ec eq '0'}">
<table class="table table-bordered">
<tr><th id="ctgr" colspan="7"><b>예능 (${ec})</b></th></tr>
<tr><td colspan="7"><span id="kwd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</td></tr>
</table>
</c:when>
</c:choose>
<br>


<c:set var="docuc" value="${docuCnt}"/>
<c:choose>
<c:when test="${docuc gt '0'}">
<table class="table table-bordered">	
	<tr><th colspan="7" id="ctgr">다큐멘터리 (${docuc})</th></tr>
	<c:forEach items="${productsList}" var="media">
		<c:if test="${media.category eq '4000'}"> <!--카테고리 4000번 => 다큐멘터리 -->
			<tr id="highlight"><td width="180"><a id="link" href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}">${media.title}</a></td><td width="120" align="center">${media.gen_name}</td><td width="100" align="center">${media.year}</td><td width="100" align="center">${media.country}</td><td width="190" align="center">${media.casting}</td><td width="80" align="center">${media.director}</td><td width="390">${media.description}</td></tr>
		</c:if> 
	</c:forEach>
</table>
</c:when>

<c:when test="${docuc eq '0'}">
<table class="table table-bordered">
<tr><th id="ctgr" colspan="7"><b>다큐멘터리 (${docuc})</b></th></tr>
<tr><td colspan="7"><span id="kwd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</td></tr>
</table>
</c:when>
</c:choose>
<br>


<c:set var="ac" value="${aCnt}"/>
<c:choose>
<c:when test="${ac gt '0'}">
<table class="table table-bordered">	
	<tr><th id="ctgr" colspan="7">애니메이션 (${ac})</th></tr>
	<c:forEach items="${productsList}" var="media">
		<c:if test="${media.category eq '5000'}"> <!--카테고리 5000번 => 애니메이션 -->
			<tr id="highlight"><td width="180"><a id="link" href="${pageContext.request.contextPath}/Product/productDetail?pno=${media.pno}">${media.title}</a></td><td width="120" align="center">${media.gen_name}</td><td width="100" align="center">${media.year}</td><td width="100" align="center">${media.country}</td><td width="190" align="center">${media.casting}</td><td width="80" align="center">${media.director}</td><td width="390">${media.description}</td></tr>
		</c:if>
	</c:forEach>
</table>
</c:when>
<c:when test="${ac eq '0'}">
<table class="table table-bordered">
<tr><th id="ctgr" colspan="7"><b>애니메이션 (${ac})</b></th></tr>
<tr><td colspan="7"><span id="kwd"><b>[${keyword}]</b></span>에 대한 검색결과가 없습니다.</td></tr>
</table>
</c:when>
</c:choose>
</div>
</c:when>

<c:when test="${not empty keyword && cnt eq '0'}">
<div class="container">
<table class="table table-bordered">
<tr><th><span id="noneKeyword">'${keyword}'</span>에 대한 검색결과가 없습니다.</th></tr>
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
<tr><th  id="noneKeyword">검색어가 입력되지 않았습니다!</th></tr>
<tr><td>단어의 철자가 정확한지 확인해 보세요.<br>
한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.<br>
검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.<br>
두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.</td></tr>
</table>
</div>
</c:when>
</c:choose>
<pre>

</pre>
<%@ include file="../footer.jsp" %>
</body>
</html>