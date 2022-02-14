<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ include file="../header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<title>Insert title here</title>
<!-- <link href="/css/faqCB.css" rel="stylesheet" > -->
<style type="text/css">
/* body{
	background-color: #333;
} */

.titleCB h2{
	font-size:60px;
	font-weight:bold;
	font-family: 'Montserrat', sans-serif;
	text-align:center;
	color:#fff;
	letter-spacing:0px;
  	transition:1s;
  	-webkit-transition:1s;
  	-ms-transition:1s;
  	position: relative;
  	padding:20px;
 
}

.titleCB h2:before,
.titleCB h2:after{
  	content:"";
  	position: absolute;
  	height: 3px;
  	width: 0px;
  	background:#ffd800;
  	transition:300ms;
  	-webkit-transition:1s;
  	-ms-transition:1s;
  	opacity:0.3;
  	left:50%;
  
}

.titleCB h2:before{
  	bottom:0px;
}

/* .titleCB h2:after{
  	top:0;  
} */

.titleCB h2:hover{
	letter-spacing:30px;
}

.titleCB h2:hover:before,
.titleCB h2:hover:after{
	width: 95%;
	opacity:1;
	left:0;
  }

.b{
	border:	none;
	width: 100%;
	font-weight: 900;
	background: #ffd800;
	padding: 18px;
}

.accordion {
	
  	background-color: #333;
  	color: #fff;
  	cursor: pointer;
  	padding: 18px;
  	width: 100%;
  	text-align: left;
  	border-bottom: 1px solid #fff;
  	border-left: 0;
  	border-right: 0;
  	outline: none;
  	transition: 0.4s;
  	
}
.active, .accordion:hover {
  	background-color: #ffd800;
  	color: #000;
}
.panel {
  	padding: 18px;
  	background-color: #4d4d4d;
  	font-family: 'Montserrat', sans-serif;
  	display: none;
  	overflow: hidden;
	font-weight: bold;
	color: #fff;
}

.panel input{
	
	background-color: #ffd600;
	font: 12px 굴림;
	font-weight: bold;
	color: #000;
	width: 130;
	height: 30;
  	border: none;
  	padding: 10px 20px;
  	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	margin: 4px 2px;
  	cursor: pointer;
  	border-radius: 16px;
}

.accordion:after {
  	content: '\02795'; /* Unicode character for "plus" sign (+) */
  	font-size: 13px;
  	color: #777;
  	float: right;
  	margin-left: 5px;
}

.active:after {
	content: "\2796"; /* Unicode character for "minus" sign (-) */
}

.button{
	
	background-color: #ffd600;
	font: 12px 굴림;
	font-weight: bold;
	color: black;
	width: 130;
	height: 30;
  	border: none;
  	padding: 10px 20px;
  	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	margin: 4px 2px;
  	cursor: pointer;
  	border-radius: 16px;
  	float: right;
}

.button:hover {
  	background-color: #f1f1f1;
}

.search-input input{
	float: center;
    width: 400px;
    height: 35px;
    padding-left: 20px;
    border-radius: 6px;
    background-color: #2f2f2f;
    border: 1px solid #2f2f2f;
    color: #a5a5a5;
}
.search-input select{
	float: center;
    width: 130px;
    height: 35px;
    padding-left: 20px;
    border-radius: 6px;
    background-color: #2f2f2f;
    border: 1px solid #2f2f2f;
    color: #a5a5a5;
}
.search-input option{
	float: center;
    width: 130px;
    height: 35px;
    padding-left: 20px;
    border-radius: 6px;
    background-color: #2f2f2f;
    border: 1px solid #2f2f2f;
    color: #a5a5a5;
}

.cs-search-btn{
	background-color: #747474;
	font: 12px 굴림;
	font-weight: bold;
	color: black;
	width: 130;
	height: 30;
  	border: none;
  	padding: 10px 20px;
  	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	margin: 4px 2px;
  	cursor: pointer;
  	border-radius: 16px;
}
.cs-search-btn:hover{
	background-color: #D5D5D5;
}
</style>
</head>
<body>
<%
	String context = request.getContextPath();
%>

${ sessionScope.id}

<div class="container">
<div class="titleCB">
<h2>FAQ</h2></div>
 <c:set var="num" value="${pg.total-pg.start+1 }"></c:set>
 <table class="b">
 	<tr><th>No</th><th>제목</th></tr>
 </table>
<table>
	<c:forEach var="faq" items="${listFaq }">
		
	<button class="accordion"> ${faq.f_no}&emsp;&emsp;&emsp;&emsp;&emsp;${faq.f_title }</button>
		<div class="panel">
  			<p>${faq.f_content } <br><br><br>		
  	<!-- ------------------------------ admin 권한 설정하기 --------------------------------------- -->
		<c:if test="${sessionScope.id eq 'admin' }">	  			
			<input type="button"  value="수정" onclick="location.href='updateFormCB?f_no=${faq.f_no}'">
			<input type="button"  value="삭제" onclick="location.href='deleteCB?f_no=${faq.f_no}'">	
		</c:if>	
  			</p>
		</div><br>
	

<c:set var="num" value="${num - 1 }"></c:set>
</c:forEach>
</table>
<c:if test="${pg.startPage > pg.pageBlock }">
 	<a href="<%=context%>/FAQ/listCB?currentPage=${pg.startPage-pg.pageBlock }">[이전]</a>
 </c:if>
 <c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
 	<a href="<%=context%>/FAQ/listCB?currentPage=${i }"> [${i}]</a>
 </c:forEach>
 <c:if test="${pg.endPage < pg.totalPage }">
 	<a href="<%=context%>/FAQ/listCB?currentPage=${pg.startPage+pg.pageBlock }">[다음]</a>
 </c:if>
<!-- ------------------------------ admin 권한 설정하기 --------------------------------------- --> 	
<c:if test="${sessionScope.id eq 'admin' }"> 
	<input type="button" value="입력" onclick="location.href='<%=context%>/FAQ/writeFormCB'" class="button">	
	</c:if>
	&nbsp; 
	<input type="button" value="목록" onclick="location.href='<%=context%>/FAQ/listCB'" class="button"><p>

<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
  });
}
</script>

<!-- ----------------------------------검색기능---------------------------- -->
<form class="search-input" name="form1" method="post" action="<%=context%>/listCB.do">
	<select name="search_option">
		<option value="f_title" >제목</option>
        <option value="f_content">내용</option>
        <option value="all">제목+내용</option>
    </select>
    <input type="text" name="keyword" value="${faq.keyword}" maxlength="50" placeholder="궁금하신 점이 있다면 검색해주세요(최대 50자)">
    <button type="submit" class="cs-search-btn" value="검색">검색</button>
</form>

</div>
</body>
<%@ include file="../footer.jsp" %>
</html>