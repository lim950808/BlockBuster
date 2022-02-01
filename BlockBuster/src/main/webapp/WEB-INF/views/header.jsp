<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> <!-- searchbox -->

<style>

.icon {
color: #0100FF;
}

.banner{
margin-left: 40px;
padding-top: 40px;

}

/* Style the links inside the navigation bar */
.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

/* Change the color of links on hover */
.topnav a:hover {
  background-color: #ddd;
  color: black;
}

/* Add a color to the active/current link */
.topnav a.active {
  background-color: #04AA6D;
  color: white;
}

/* Right-aligned section inside the top navigation */
.topnav-right {
  float: right;
  padding-top: 2px;
}
     
----------------------------------------topnav

    /* Dropdown Button */
.dropbtn {
  background-color: #04AA6D;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: black;
  padding: 12px 12px;
  text-decoration: none;
  display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #ddd;}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {display: block;}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {background-color: #D4F4FA;}

------------------------searchbox-------------
* {
  box-sizing: border-box;
}

/* Style the search field */
form.example input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 80%;
  background: #f1f1f1;
}

/* Style the submit button */
form.example button {
  float: left;
  width: 20%;
  padding: 10px;
  background: #2196F3;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none; /* Prevent double borders */
  cursor: pointer;
}

form.example button:hover {
  background: #0b7dda;
}

/* Clear floats */
form.example::after {
  content: "";
  clear: both;
  display: table;
}

</style>

	<!--  <div class="container" id="banner"> -->
	  <div class="row">
		   <div class="col-sm-4">
		   <a href="../main"><img src="/resources/img/logo.png" alt="main" width="80%" height="80%"></a>
	       </div>
	       
	      <form class="example" id="search" action="#" style="margin:30px; max-width:260px">
		  <input type="text" placeholder="키워드 검색하기" name="search2">
		  <button type="submit"><i class="fa fa-search"></i></button>
		  </form>  
  
	  
				<div class="navbar">
					<div class="dropdown">
						<button class="dropbtn">게시판
						<i class="fa fa-caret-down"></i>
						</button>
						<div class="dropdown-content">
							<a href="#">FAQ</a>
							<a href="#">Review</a>
						</div>
					</div>
				</div>

									
				<%-- 	<c:choose>
  	    			<c:when test="${grade}==1"> --%>
  	    				<div class="navbar">
  	    				<div class="dropdown">
						<button class="dropbtn">마이페이지
				  		 <i class="fa fa-caret-down"></i>
						</button>
						<div class="dropdown-content">
						  	<a href="#">내 정보</a>
						    <a href="#">구매내역</a>
						    <a href="/Admin/productList">1:1문의</a>
						    <a href="#">로그아웃</a>			      
						</div>
						</div>
  	    <%-- 			</c:when>
  	    			</c:choose>
					 --%>
					
					
					
	       		    </div>
				
					  
	  	<a href="main" class="icon" >
		<i class="fa fa-shopping-cart" style="padding:50px; font-size:24px"></i> 
		</a>
		
</div>

<!-- <div> -->
		
			
</div>

</head>

</html>