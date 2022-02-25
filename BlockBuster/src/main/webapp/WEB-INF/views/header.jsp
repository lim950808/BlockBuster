<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 검색창 -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>

<script type="text/javascript">
function getRecommendWords(){
	$('#searchingist1').remove();
	$('#lengthCheck').remove();
	var str="";
	var str2="";
	$.ajax({
				url : "${pageContext.request.contextPath}/rcmdSearchWord",
				dataType:'json',
				success:function(data){
					str += "<datalist id='searchingist1'>"
					$(data).each( 
							function(){
                                if  (this.title  != null ) {
                                	str2 = str2 + "<option value='"+this.title+"'/>"
                                }
                                if  (this.casting  != null ) {
                               	    str2 = str2 + "<option value='"+this.casting+"'/>"
                                }
                                if  (this.cat_name  != null ) {
                               	    str2 = str2 + "<option value='"+this.cat_name+"'/>"
                                }
                                if  (this.gen_name  != null ) {
                               	    str2 = str2 + "<option value='"+this.gen_name+"'/>"
                                }
                                if  (this.year  != 0 ) {
                               	    str2 = str2 + "<option value='"+this.year+"'/>"
                                }
                                if  (this.country  != null ) {
                               	    str2 = str2 + "<option value='"+this.country+"'/>"
                                }
                                if  (this.director  != null ) {
                               	    str2 = str2 + "<option value='"+this.director+"'/>"
                                }
									str += str2;
	                                str2 = "";
								}
					);
					str += "</datalist>";
					$('#words1').append(str);
				}
			}
		);
}
function wordlengthCheck(){
	$(document).ready(function(){
	var searchWord = $('#words1').val();
	if(searchWord.length == 1){
		 var result = "<p id='lengthCheck' align='center' style='color: #ff7f00;'>&ensp;&emsp;&emsp;&emsp;두 글자 이상 입력하셔야 검색이 가능합니다.</p>";
		  $(result).insertAfter("#lengthChecker");
	}else{
		var form = document.form;
		form.submit();
	} 
	});
	return true;
}
</script>
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
}

.navbarJE {
	overflow: hidden;
	background-color: #000;
	font-family: Arial, Helvetica, sans-serif;
	border-bottom: 1px solid #ff7f00;
	height: 150px;
	/* padding-top: 40px; */
	
	
}
.navbarJE a {
	float: left;
	font-size: 16px;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}
@import url('https://fonts.googleapis.com/css2?family=Bangers&family=Noto+Sans+KR:wght@100;500&display=swap');
@font-face{
	font-family: "Bangers";
	src:url("${pageContext.request.contextPath}/resources/fonts/Bangers-Regular.ttf") format("truetype");
	font-style: normal;
	font-weight: normal;
}
.logo a {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
}
.logo a:hover{
	text-decoration:none !important;
}
.logo img{
	margin-top: 50px;
}

.logo span{
	text-align: center;
	color: #ff7f00;
	font-size: 80px;
	font-family: Bangers-Regular;
}


.navbarJE h6{
	/* margin-left: 30px; */
	margin-bottom: 0px;
	width: auto;
	height: 52px;
	color: #fff;
	text-align: center;
	float: right;
	padding: 14px 19px;
}
.menuJE {
	float: left;
	margin-top: 50px;
	z-index: 10;
}
.dropdownJE {
	float: left;
	overflow: hidden;
	display: inline;
	margin: 0;
	padding-top: 40px;
	z-index:10;
	
}
.dropdownJE .dropbtnJE {
	font-size: 16px;  
	border: none;
	outline: none;
	color: white;
	padding: 14px 16px;
	background-color: inherit;
	font: inherit;
	margin: 0;
	z-index: 10;
	 
}

.navbarJE a:hover{
	background-color: black;
	z-index: 10;
}
.dropdownJE:hover .dropbtnJE {
	z-index: 10;
}
.dropdownJE a:hover,
.dropdownJE i:hover{
	color: #ff7f00;
}

.dropdown-contentJE a:hover{
	background-color: #262626;
	color: #ff7f00;
	z-index: 10;
	text-decoration:none !important;
}

.dropdown-contentJE {
	background-color: #262626;
	display: none;
	position: absolute;
	top: 100px;
	left: 0;
	width: 100%;
	height: auto;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	z-index: 10;
	margin-top: 35px;
	border-top: 1px solid #ff7f00;
}

.dropdown-contentJE .headerJE {
	background: #262626;
	padding: 16px;
	color: white;
	z-index: 10;
}
.headerJE h2:hover{
	color: #ff7f00;
	z-index: 10;
}

.dropdownJE:hover .dropdown-contentJE {
	display: block;
	z-index: 10;
}

/* Create three equal columns that floats next to each other */
.columnJE {
	float: left;
	width: 20%;
	padding: 15px;
	background-color: #262626;
	height: 500px;
	z-index: 10;
}

.columnJE a {
	float: none;
	color: #999999;
	padding: 16px;
	text-decoration: none;
	display: block;
	text-align: left;
	z-index: 10;
}

.columnJE a:hover {
	font-weight: bold;
	background-color: #ff7f00;
	color: #fff;
	z-index: 10;
}
.columnJE h3{
	color: #cccccc;
	font-weight: bold;
}
.columnJE h3:hover{
	color: #000;
	font-weight: bold;
}

/* Clear floats after the columns */
.rowJE:after {
	content: "";
	display: table;
	clear: both;
	margin-top: 20px;
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .columnJE {
	width: 100%;
	height: auto;
	z-index: 10;
  }
}

.searchJE {
	float: right;
	margin-top: 80px;
	padding-right: 30px;
}
.exampleJE{
	display: inline;
	margin-left: 50px;
} 

.exampleJE input{
	
/*     height: 30x; */
 	width: 450px;
    padding-left: 5px;
    padding-top : 14px;
    border-radius: 30px;
    background-color: #333;
    border: 1px solid #333;
    color: #a5a5a5;
    margin-top: 5px;
    maegin-bottom: 10px;

 	/* width: 100%;
 	height: 46px;
 	line-height: 46px;
 	font-size: 1.1em;
 	color: rgba(0,0,0,0.5);
 	border: none;
 	border-radius: 30px;
 	padding: 10px 20px;
 	     */
    
    
}
.exampleJE button{
	background-color: #F5F5F5;
	color: #fff;
  	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	height: 46px;
  	border: none;
  	border-radius: 30px;
  	position: absolute;
  	background: linear-gradient(to right, rgba(var(--tmdbLightGreen), 1) 0%, rgba(var(--tmdbLightBlue), 1) 100%);
  	
  	
  	
} 
.exampleJE fa fa-search :hover{
	background-color: #D5D5D5;
}

</style>
</head>
<body>
	<div class="navbarJE">

	
<!-- ------------------------------ 검색기능 --------------------------------------- --> 	      
      	<div class="searchJE">	
      	<form name="form" class="exampleJE" id="search" action="${pageContext.request.contextPath}/HTGetSearchResult" method="get" onsubmit="wordlengthCheck(); return false;">
			<input type="text" placeholder="  키워드를 입력(두 글자 이상)" name="keyword" id="words1" list="searchingist1" onfocus="getRecommendWords()" autofocus="autofocus">
			<button type="submit" value="fa fa-search" id="lengthChecker"><i class="fa fa-search"></i></button>
		</form>
			
		</div>

<!-- ------------------------------ logo --------------------------------------- --> 	
		<div class="logo">
			  <!-- <a href="../main" style="margin-top: 15px; padding-bottom: 0px;"><b><span>BlockBuster</span></b></a> -->
			  <a href="${pageContext.request.contextPath}/main" style="padding-bottom: 0px;"><img src="${pageContext.request.contextPath}/resources/img/logoBangers.jpg" width="450" height="60"></a>
		</div>
	
	<%--   <a href="${pageContext.request.contextPath}/login" type="hidden"></a> --%>
	<input type="hidden" value="${pageContext.request.contextPath}/login" />  
	
<!-- ------------------------------ 아이디 표시 --------------------------------------- -->	
 <div class="menuJE">	
	<div class="dropdownJE">
			<h6>${ sessionScope.Nickname}님 환영합니다</h6>
	  	</div>
	  	
<!-- ------------------------------ 카테고리 --------------------------------------- -->		  	
 
	
	  <div class="dropdownJE">
	    <button class="dropbtnJE">카테고리 
	      <!-- <i class="fa fa-caret-down"></i> -->
	    </button>
	    <div class="dropdown-contentJE">
	      <div class="headerJE">
	        <h2>Category</h2>
	      </div>   
	      <div class="rowJE">
	        <div class="columnJE">
	          <a href="${pageContext.request.contextPath}/CategoryList?c=1000"><h3>영화</h3></a>
	          <a href="${pageContext.request.contextPath}/GenreList?g=1100">공포</a>
	          <a href="${pageContext.request.contextPath}/GenreList?g=1200">액션</a>
	          <a href="${pageContext.request.contextPath}/GenreList?g=1300">범죄/스릴러</a>
	          <a href="${pageContext.request.contextPath}/GenreList?g=1400">전쟁</a>
	          <a href="${pageContext.request.contextPath}/GenreList?g=1500">판타지/SF</a>
	          <a href="${pageContext.request.contextPath}/GenreList?g=1600">코미디</a>
	          <a href="${pageContext.request.contextPath}/GenreList?g=1700">멜로/로멘스</a>
	        </div>
	        <div class="columnJE">
	          <a href="${pageContext.request.contextPath}/CategoryList?c=2000"><h3>드라마</h3></a>
	          <a href="${pageContext.request.contextPath}/GenreList?g=2100">미드</a>
	          <a href="${pageContext.request.contextPath}/GenreList?g=2200">일드</a>
	          <a href="${pageContext.request.contextPath}/GenreList?g=2300">한드</a>
	        </div>
	        <div class="columnJE">
	          <a href="${pageContext.request.contextPath}/CategoryList?c=3000"><h3>예능</h3></a>
	          <a href="${pageContext.request.contextPath}/GenreList?g=3100">KBS</a>
	          <a href="${pageContext.request.contextPath}/GenreList?g=3200">SBS</a>
	          <a href="${pageContext.request.contextPath}/GenreList?g=3300">MBC</a>
	          <a href="${pageContext.request.contextPath}/GenreList?g=3400">TVN</a>
	          <a href="${pageContext.request.contextPath}/GenreList?g=3500">JTBC</a>
	        </div>
	        <div class="columnJE">
	          <a href="${pageContext.request.contextPath}/CategoryList?c=4000"><h3>다큐</h3></a>
	          <a href="${pageContext.request.contextPath}/GenreList?g=4100">The History Channel</a>
	          <a href="${pageContext.request.contextPath}/GenreList?g=4200">Discovery Channel</a>
	          <a href="${pageContext.request.contextPath}/GenreList?g=4300">National Geographic</a>
	        </div>
	        <div class="columnJE">
	          <a href="${pageContext.request.contextPath}/CategoryList?c=5000"><h3>애니</h3></a>
	          <a href="${pageContext.request.contextPath}/GenreList?g=5100">디즈니</a>
	          <a href="${pageContext.request.contextPath}/GenreList?g=5200">지브리</a>
	        </div>
	      </div>
	    </div>
	  </div>
  
	<div class="dropdownJE">
	  	<button class="dropbtnJE">게시판</button>
	  		<div class="dropdown-contentJE">
	    		<a href="${pageContext.request.contextPath}/reviewList"><h2>Review</h2></a>
	    		<a href="${pageContext.request.contextPath}/FAQ/listCB"><h2>FAQ</h2></a>
	    		<a href="${pageContext.request.contextPath}/procedureForm"><h2>한줄인사</h2></a>
	  		</div>
	</div>
	  

	  <div class="dropdownJE">
<!-- ------------------------------ 마이페이지 & admin 권한 설정하기 --------------------------------------- --> 
		<c:choose>
			<c:when test="${sessionScope.sessionId != 'admin' }">
		  	<button class="dropbtnJE">마이페이지</button>
		  		<div class="dropdown-contentJE">
		    		<a href="${pageContext.request.contextPath}/member/myinfo" style="margin-top: 10px;""><h5>내 정보</h5></a>
		    		<a href="${pageContext.request.contextPath}/Order/orderList" style="margin-top: 10px;"><h5>구매내역</h5></a>
		    		<a href="${pageContext.request.contextPath}/chat?id=${sessionScope.sessionId}"style="margin-top: 10px;"><h5>실시간 채팅</h5></a>
		    		<a href="${pageContext.request.contextPath}/RestAPI" style="margin-top: 10px;"><h5>API 제공</h5></a>
		    		<a href="${pageContext.request.contextPath}/logout.do" style="margin-top: 10px;"><h5>로그아웃</h5></a>
		  		</div>
		  	</c:when>
	
		  	<c:when test="${sessionScope.sessionId eq 'admin' }">
		  	<button class="dropbtnJE">admin</button>
		  		<div class="dropdown-contentJE">
		    		<a href="${pageContext.request.contextPath}/chat?id=${sessionScope.sessionId}" style="margin-top: 10px;"><h5>고객 채팅</h5></a> 
		    		<a href="${pageContext.request.contextPath}/RestAPI" style="margin-top: 10px;"><h5>API 제공</h5></a>
		    		<a href="${pageContext.request.contextPath}/Admin/productList" style="margin-top: 10px;"><h5>관리자 상품관리</h5></a>
		    		<a href="${pageContext.request.contextPath}/Admin/viewallMember" style="margin-top: 10px;"><h5>관리자 회원관리</h5></a>
		    		<a href="${pageContext.request.contextPath}/logout.do" style="margin-top: 10px;"><h5>로그아웃</h5></a>
		  		</div>
		  	</c:when>
		</c:choose>
	</div>
	  		
	<c:choose>
		<c:when test="${sessionScope.sessionId != 'admin' }">
		 <div class="dropdownJE"> 
		 	<a href="${pageContext.request.contextPath}/Cart/cartList"><i class="fa fa-shopping-cart"></i></a>
		 </div>
		</c:when>
	</c:choose>

	</div>
</div>
</body>
</html>