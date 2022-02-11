<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<!-- 상단 메뉴 검색 비동기 처리부분  -->
<!-- <script type="text/javascript">
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
					$(data).each( //500개를 또 불러온다... 조건처리 할 때 
							function(){
								str2 = "<option value='"+this.title+"'/><option value='"+this.casting+"'/><option value='"+this.cat_name+"'/><option value='"+this.gen_name+"'/><option value='"+this.year+"'/><option value='"+this.country+"'/><option value='"+this.director+"'/>";
								str += str2;
								}
					);
					str += "</datalist>";
					$('#words1').append(str);
				}
			}
		);
}
</script> -->

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
  background-color: #333;
  font-family: Arial, Helvetica, sans-serif;
}

.navbarJE a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdownJE {
  float: left;
  overflow: hidden;
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
  background-color: #ddd;
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
</style>
</head>
<body>
	<div class="navbarJE">
	
	  <a href="../main"><b>BlockBuster</b></a>
	  <a href="login">로그인</a>
	  
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
	          <h3>영화</h3>
	          <a href="#">액션</a>
	          <a href="#">공포</a>
	          <a href="#">범죄/스릴러</a>
	          <a href="#">전쟁</a>
	          <a href="#">판타지/SF</a>
	          <a href="#">코미디</a>
	          <a href="#">멜로/로멘스</a>
	        </div>
	        <div class="columnJE">
	          <h3>드라마</h3>
	          <a href="#">한드</a>
	          <a href="#">미드</a>
	          <a href="#">일드</a>
	        </div>
	        <div class="columnJE">
	          <h3>예능</h3>
	          <a href="#">KBS</a>
	          <a href="#">MBC</a>
	          <a href="#">SBS</a>
	          <a href="#">TVN</a>
	          <a href="#">JTBC</a>
	        </div>
	        <div class="columnJE">
	          <h3>애니</h3>
	          <a href="#">디즈니</a>
	          <a href="#">지브리</a>
	        </div>
	        <div class="columnJE">
	          <h3>다큐</h3>
	          <a href="#">The History Channel</a>
	          <a href="#">Discovery Channel</a>
	          <a href="#">National Geographic</a>
	        </div>
	      </div>
	    </div>
	  </div>
	  
	  <div class="dropdownJE">
	  	<button class="dropbtnJE">게시판</button>
	  		<div class="dropdown-contentJE">
	    		<a href="reviewList">Review</a>
	    		<a href="#">FAQ</a>
	  		</div>
	  </div>
	  
	  <div class="dropdownJE">
	  	<button class="dropbtnJE">마이페이지</button>
	  		<div class="dropdown-contentJE">
	    		<a href="/Admin/productList">내 정보</a>
	    		<a href="/Order/list">구매내역</a>
	    		<a href="#">1:1 문의</a>
	    		<a href="#">로그아웃</a>
	  		</div>
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
	  
	  <a href="/Cart/cartList"><i class="fa fa-shopping-cart"></i></a>
	  
	  <!-- <form>
          <input class="form-control" type="text" placeholder="Search" aria-label="Search">
          <button type="submit"><i class="fa fa-search"></i></button>
      </form> -->
      	
      	<%-- <form name="form" class="example" id="search" action="${pageContext.request.contextPath}/HTGetSearchResult" method="post" style="margin:20px; max-width:200px">
			<input type="text" placeholder="키워드를 입력하세요" name="keyword" id="words1" list="searchingist1" onfocus="getRecommendWords()" autofocus="autofocus">
			<button type="submit"><i class="fa fa-search"></i></button>
		</form> --%>
		
		<form name="form" class="example" id="search" action="${pageContext.request.contextPath}/HTGetSearchResult" method="post" style="margin:20px; max-width:200px">
			<input type="text" placeholder="키워드를 입력하세요" name="keyword" id="words1" list="searchingist1" onfocus="getRecommendWords()" autofocus="autofocus">
			<button type="submit"><i class="fa fa-search"></i></button>
		</form>
	
	  
	</div>
</body>
</html>