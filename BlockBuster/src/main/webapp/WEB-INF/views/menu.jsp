<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!DOCTYPE html>
<head>

<style>
/* A simple, css only, (some-what) responsive menu */

body { 
  background: #fff;
  font-family: helvetica, arial, serif;
  font-size: 13px;
  text-transform: uppercase;
  text-align: center;
}
 
.wrap {
  display: inline-block;
  -webkit-box-shadow: 0 0 70px #fff;
  -moz-box-shadow: 0 0 70px #fff;
  box-shadow: 0 0 70px #fff;
  margin-top: 1px;
}

a {
  text-decoration: none;
  color: #363636;
  display: block;
}

ul {
  list-style: none;
  position: relative;
  text-align: left;
}

li {
  float: left;
}

/* clear'n floats */
ul:after {
  clear: both;
}

ul:before,
ul:after {
    content: "";
    display: table;
}

nav {
  position: relative;
  background: #F8FFFF;
 /*  background-image: -webkit-linear-gradient(bottom, #FFD9FA 7%, #333333 100%);
  background-image: -moz-linear-gradient(bottom, #FFD9FA 7%, #333333 100%);
  background-image: -o-linear-gradient(bottom, #FFD9FA 7%, #333333 100%);
  background-image: linear-gradient(bottom, #FFD9FA 7%, #333333 100%); */
  text-align: center;
  letter-spacing: 1px;
  text-shadow: 1px 1px 1px #FFFFFF;
  -webkit-box-shadow: 2px 2px 3px #888;
  -moz-box-shadow: 2px 2px 3px #888;
  box-shadow: 2px 2px 3px #888;
  border-bottom-right-radius: 8px;
  border-bottom-left-radius: 8px;
}

/* prime */
ul.primary li a {
  display: block;
  padding: 20px 30px;
  border-right: 1px solid #EDC7E8;
}

ul.primary li:last-child a {
  border-right: none;
}

ul.primary li a:hover {
  
  color: #000;
}

/* subs */
ul.sub {
  position: absolute;
  z-index: 200;
  box-shadow: 2px 2px 0 #BEBEBE;
  width: 35%;
  display:none;
}

ul.sub li {
  float: none;
  margin: 0;
}

ul.sub li a {
  border-bottom: 1px dotted #ccc;
  border-right: none;
  color: #000;
  padding: 15px 30px;
}

ul.sub li:last-child a {
  border-bottom: none;
}

ul.sub li a:hover {
  color: #000;
  background: #eeeeee;
}

/* sub display*/
ul.primary li:hover ul {
  display: block;
  background: #fff;
}

/* keeps the tab background white */
ul.primary li:hover a {
  background: #fff;
  color: #666;
  text-shadow: none;
}

ul.primary li:hover > a{
  color: #000;
} 

@media only screen and (max-width: 600px) {
  .decor {
    padding: 1px;
  }
  
  .wrap {
    width: 100%;
    margin-top: 0px;
  }
  
   li {
    float: none;
  }
  
  ul.primary li:hover a {
    background: none;
    color: #8B8B8B;
    text-shadow: 1px 1px #000;
  }

  ul.primary li:hover ul {
    display: block;
    background: #272727;
    color: #fff;
  }
  
  ul.sub {
    display: block;  
    position: static;
    box-shadow: none;
    width: 100%;
  }
  
  ul.sub li a {
    background: #272727;
  	border: none;
    color: #8B8B8B;
  }
  
  ul.sub li a:hover {
    color: #ccc;
    background: none;
  }
}
</style>
 
<div class="wrap">
<nav>
  <ul class="primary">
    <li>
      <a href="">영화</a>
      <ul class="sub">
	  <li><a href="#">액션</a></li>
	  <li><a href="#">공포</a></li>
	  <li><a href="#">범죄/스릴러</a></li>
	  <li><a href="#">전쟁</a></li>
	  <li><a href="#">판자티/SF</a></li>	  
	  <li><a href="#">코미디</a></li>
	  <li><a href="#">멜로/로맨스</a></li>	  
      </ul>
    </li>
    <li>
      <a href="">드라마</a>
      <ul class="sub">
	  <li><a href="#">한드</a></li>
	  <li><a href="#">미드</a></li>
	  <li><a href="#">일드</a></li>
      </ul>
    </li>
    <li>
      <a href="">예능</a>
      <ul class="sub">
	  <li><a href="#">KBS</a></li>
	  <li><a href="#">SBS</a></li>
	  <li><a href="#">MBC</a></li>
	  <li><a href="#">TVN</a></li>	
	  <li><a href="#">JTBC</a></li>	
      </ul>  
    </li>
    <li>
      <a href="">다큐</a>
      <ul class="sub">
	  <li><a href="#">히스토리</a></li>
	  <li><a href="#">디스커버리</a></li>
	  <li><a href="#">내셔널지오그래픽</a></li>
      </ul>  
    </li>
    <li>
      <a href="">애니</a>
      <ul class="sub">
	  <li><a href="#">디즈니</a></li>
	  <li><a href="#">지브리</a></li>
      </ul>  
    </li>
  </ul>
</nav>
</div>
</head>

<body>

</body>
</html>

