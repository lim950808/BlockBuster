<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
* {
  box-sizing: border-box;
}

body {
  margin: 0;
}

.navbar {
  overflow: hidden;
  background-color: #333;
  font-family: Arial, Helvetica, sans-serif;
}

.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  font: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: black;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: gray;
  width: 100%;
  left: 0;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content .header {
  background: gray;
  padding: 16px;
  color: white;
}

.dropdown:hover .dropdown-content {
  display: block;
}

/* Create three equal columns that floats next to each other */
.column {
  float: left;
  width: 20%;
  padding: 10px;
  background-color: #ccc;
  height: 450px;
}

.column a {
  float: none;
  color: black;
  padding: 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.column a:hover {
  background-color: #ddd;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
    height: auto;
  }
}
</style>
</head>
<body>
	<div class="navbar">
	
	  <a href="../main"><b>BlockBuster</b></a>
	  
	  <div class="dropdown">
	    <button class="dropbtn">카테고리 
	      <!-- <i class="fa fa-caret-down"></i> -->
	    </button>
	    <div class="dropdown-content">
	      <div class="header">
	        <h2>Category</h2>
	      </div>   
	      <div class="row">
	        <div class="column">
	          <h3>영화</h3>
	          <a href="#">액션</a>
	          <a href="#">공포</a>
	          <a href="#">범죄/스릴러</a>
	          <a href="#">전쟁</a>
	          <a href="#">판타지/SF</a>
	          <a href="#">코미디</a>
	          <a href="#">멜로/로멘스</a>
	        </div>
	        <div class="column">
	          <h3>드라마</h3>
	          <a href="#">한드</a>
	          <a href="#">미드</a>
	          <a href="#">일드</a>
	        </div>
	        <div class="column">
	          <h3>예능</h3>
	          <a href="#">KBS</a>
	          <a href="#">MBC</a>
	          <a href="#">SBS</a>
	          <a href="#">TVN</a>
	          <a href="#">JTBC</a>
	        </div>
	        <div class="column">
	          <h3>애니</h3>
	          <a href="#">디즈니</a>
	          <a href="#">지브리</a>
	        </div>
	        <div class="column">
	          <h3>다큐</h3>
	          <a href="#">The History Channel</a>
	          <a href="#">Discovery Channel</a>
	          <a href="#">National Geographic</a>
	        </div>
	      </div>
	    </div>
	  </div>
	  
	  <div class="dropdown">
	  	<button class="dropbtn">게시판</button>
	  		<div class="dropdown-content">
	    		<a href="#">Review</a>
	    		<a href="#">FAQ</a>
	  		</div>
	  </div>
	  
	  <div class="dropdown">
	  	<button class="dropbtn">마이페이지</button>
	  		<div class="dropdown-content">
	    		<a href="#">내 정보</a>
	    		<a href="/Admin/productList">구매내역</a>
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
	  
	  <a href="../cart.jsp"><i class="fa fa-shopping-cart"></i></a>
	  
	  <form>
          <input class="form-control" type="text" placeholder="Search" aria-label="Search">
          <button type="submit"><i class="fa fa-search"></i></button>
      </form>
	  
	</div>
</body>
</html>