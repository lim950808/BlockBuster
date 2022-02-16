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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<script type="text/javascript">
function getRecommendWords(){
	$('#searchingist1').remove();
	var str="";
	var str2="";
	var i= 1;
	$.ajax({
				url : "${pageContext.request.contextPath}/rcmdSearchWord",
				dataType:'json',
				success:function(data){
					str += "<datalist id='searchingist1'>"
					$(data).each( 
							function(){
								console.log(i);
								i += 1;
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
	height: 100px;
	padding-top: 40px;
}
.navbarJE a {
	float: left;
	font-size: 16px;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.logo a {
	float: left;
	font-size: 16px;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}
.logo span{
	color: #ff7f00;
	font-size: 35px;
}


.navbarJE h5{
	margin-left: 300px;
	margin-bottom: 0px;
	width: 300px;
	height: 52px;
	color: #fff;
	text-align: center;
	float: right;
	padding: 14px 16px;
}

.dropdownJE {
	float: left;
	overflow: hidden;
	display: inline;
	margin: 0;
	padding-top: 40px;
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
}

.navbarJE a:hover, .dropdownJE:hover .dropbtnJE {
	background-color: black;
}

.dropdown-contentJE {
	display: none;
	top: 100px;
	position: absolute;
	background-color: gray;
	width: 100%;
	left: 0;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	z-index: 1;
}

.dropdown-contentJE .headerJE {
	background: gray;
	padding: 16px;
	color: white;
}

.dropdownJE:hover .dropdown-contentJE {
	display: block;
}

/* Create three equal columns that floats next to each other */
.columnJE {
	float: left;
	width: 20%;
	padding: 10px;
	background-color: #ccc;
	height: 450px;
}

.columnJE a {
	float: none;
	color: black;
	padding: 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

.columnJE a:hover {
	background-color: #ff7f00;
	color: #fff;
}

/* Clear floats after the columns */
.rowJE:after {
	content: "";
	display: table;
	clear: both;
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .columnJE {
	width: 100%;
	height: auto;
  }
}
.exampleJE{
	display: inline;
	margin-left: 50px;
} 

.exampleJE input{
	float: center;
	width: 450px;
    height: 30x;
    padding-left: 20px;
    padding-top : 14px;
    border-radius: 6px;
    background-color: #2f2f2f;
    border: 1px solid #2f2f2f;
    color: #a5a5a5;
    margin-top: 5px;
    
    
    
}
.exampleJE button{
	background-color: #F5F5F5;
	color: black;
  	border: none;
  	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	cursor: pointer;
  	border-radius: 10px;
} 
.exampleJE fa fa-search :hover{
	background-color: #D5D5D5;
}

</style>
</head>
<body>
	<div class="navbarJE">
<div class="logo">
	  <a href="../main"><b><span>BlockBuster</span></b></a>
</div>
	
	<%--   <a href="${pageContext.request.contextPath}/login" type="hidden"></a> --%>
	<input type="hidden" value="${pageContext.request.contextPath}/login" />  
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
	          <a href="/GenreList?g=1100">공포</a>
	          <a href="/GenreList?g=1200">액션</a>
	          <a href="/GenreList?g=1300">범죄/스릴러</a>
	          <a href="/GenreList?g=1400">전쟁</a>
	          <a href="/GenreList?g=1500">판타지/SF</a>
	          <a href="/GenreList?g=1600">코미디</a>
	          <a href="/GenreList?g=1700">멜로/로멘스</a>
	        </div>
	        <div class="columnJE">
	          <a href="${pageContext.request.contextPath}/CategoryList?c=2000"><h3>드라마</h3></a>
	          <a href="/GenreList?g=2100">한드</a>
	          <a href="/GenreList?g=2200">미드</a>
	          <a href="/GenreList?g=2300">일드</a>
	        </div>
	        <div class="columnJE">
	          <a href="${pageContext.request.contextPath}/CategoryList?c=3000"><h3>예능</h3></a>
	          <a href="/GenreList?g=3100">KBS</a>
	          <a href="/GenreList?g=3200">MBC</a>
	          <a href="/GenreList?g=3300">SBS</a>
	          <a href="/GenreList?g=3400">TVN</a>
	          <a href="/GenreList?g=3500">JTBC</a>
	        </div>
	        <div class="columnJE">
	          <a href="${pageContext.request.contextPath}/CategoryList?c=4000"><h3>다큐</h3></a>
	          <a href="/GenreList?g=4100">The History Channel</a>
	          <a href="/GenreList?g=4200">Discovery Channel</a>
	          <a href="/GenreList?g=4300">National Geographic</a>
	        </div>
	        <div class="columnJE">
	          <a href="${pageContext.request.contextPath}/CategoryList?c=5000"><h3>애니</h3></a>
	          <a href="/GenreList?g=5100">디즈니</a>
	          <a href="/GenreList?g=5200">지브리</a>
	        </div>
	      </div>
	    </div>
	  </div>
	  
	  <div class="dropdownJE">
	  	<button class="dropbtnJE">게시판</button>
	  		<div class="dropdown-contentJE">
	    		<a href="${pageContext.request.contextPath}/reviewList">Review</a>
	    		<a href="/FAQ/listCB">FAQ</a>
	  		</div>
	  </div>
	  
	  <div class="dropdownJE">
<!-- ------------------------------ 마이페이지 & admin 권한 설정하기 --------------------------------------- --> 
	<c:choose>
		<c:when test="${sessionScope.sessionId != 'admin' }">
	  	<button class="dropbtnJE">마이페이지</button>
	  		<div class="dropdown-contentJE">
	    		<a href="/member/myinfo">내 정보</a>
	    		<a href="/Order/orderList">구매내역</a>
	    		<a href="${pageContext.request.contextPath}/chat?id=${param.id}">1:1 문의</a>
	    		<a href="${pageContext.request.contextPath}/RestAPI">Rest API</a>
	    		<a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
	  		</div>
	  	</c:when>

	  	<c:when test="${sessionScope.sessionId eq 'admin' }">
	  	<button class="dropbtnJE">관리자</button>
	  		<div class="dropdown-contentJE">
	    		<a href="${pageContext.request.contextPath}/chat?id=${param.id}">1:1 문의</a>
	    		<a href="${pageContext.request.contextPath}/RestAPI">Rest API</a>
	    		<a href="/Admin/productList">관리자 상품관리</a>
	    		<a href="/Admin/viewallMember">관리자 회원관리</a>
	    		<a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
	  		</div>
	  	</c:when>
	</c:choose>
	  		
	  <%-- 
	  		<button class="dropbtnJE">마이페이지</button>
	  		<div class="dropdown-contentJE">
	    		<a href="/member/myinfo">내 정보</a>
	    		<a href="/Order/list">구매내역</a>
	    		<a href="chat?id=${param.id}">1:1 문의</a>
	    		<a href="${pageContext.request.contextPath}/RestAPI">Rest API</a>
	   --%>
<!-- ------------------------------ admin 권한 설정하기 --------------------------------------- --> 	
		<%-- 
			<c:if test="${sessionScope.sessionId eq 'admin' }"> 
	    		<a href="/Admin/productList">관리자 상품관리</a>
	    		<a href="/Admin/viewallMember">관리자 회원관리</a>
	    	</c:if>
	    		<a href="#">로그아웃</a>
	  		</div> 
	  	--%>
	</div>
	
	 <%-- <c:if test="${sessionId == 'admin' }"> 써서 admin 처리 --%>
	  <!-- <div class="dropdown">
	  	<button class="dropbtn">Admin</button>
	  		<div class="dropdown-content">
	    		<a href="#">회원관리</a>
	    		<a href="/Admin/productList">영상관리</a>
	    		<a href="#">1:1 문의</a>
	    		<a href="#">로그아웃</a>
	  		</div>
	  </div> -->
	 <div class="dropdownJE"> 
	  <a href="/Cart/cartList"><i class="fa fa-shopping-cart"></i></a>
	 </div> 
	  <!-- <form>
          <input class="form-control" type="text" placeholder="Search" aria-label="Search">
          <button type="submit"><i class="fa fa-search"></i></button>
      </form> -->
      	<div class="dropdownJE">	
      	<form name="form" class="exampleJE" id="search" action="${pageContext.request.contextPath}/HTGetSearchResult" method="post">
			<input type="text" placeholder="키워드를 입력하세요" name="keyword" id="words1" list="searchingist1" onfocus="getRecommendWords()" autofocus="autofocus">
			<button type="submit"><i class="fa fa-search"></i></button>
		</form>
		</div>
		<div class="dropdownJE">
			<h5>${ sessionScope.sessionId}님 환영합니다</h5>
	  	</div>
	</div>
</body>
</html>