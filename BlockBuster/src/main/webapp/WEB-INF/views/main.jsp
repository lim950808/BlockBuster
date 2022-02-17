<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 가로긴거 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- 멀티 캐러셀 -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  <style>
  	/* Make the image fully responsive */
  	.carousel-inner img { /* 가로 케러셀 */
    	width: 100%;
    	height: 100%;
  	}
  	
  	.col-md-4{ /* 멀티 케러셀 */
  		display: inline-block;
  		margin-left:-10px;
		}
	.col-md-4 img{
  width:100%;
  height:auto;
}
  
/* body .carousel-control-prev-icon,
body .carousel-indicators li,
body .carousel-control-next-icon{
  background-color:#000;
} */

span.carousel-control-prev-icon {
 position: relative;
 bottom: 40px;
 right: 40px;
}

span.carousel-control-next-icon {
 position: relative;
 bottom: 40px;
}
  	
  </style> 
  
</head>
<body>
<pre>


</pre>
<div class="container">
<!-- <div class="container" id="body">
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10"> -->
	<div id="demo" class="carousel slide" data-ride="carousel">
	  <ul class="carousel-indicators">
	    <li data-target="#demo" data-slide-to="0" class="active"></li>
	    <li data-target="#demo" data-slide-to="1"></li>
	    <li data-target="#demo" data-slide-to="2"></li>
	  </ul>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="resources/img/space.jpg" alt="노웨이홈" class="d-block">
	      <div class="carousel-caption">
	        <h3>No Way Home</h3>
	        <p>3스파 모두 나온다!!!</p>
	      </div>   
	    </div>
	    <div class="carousel-item">
	      <img src="resources/img/mountain.jpg" alt="파프롬홈" class="d-block">
	      <div class="carousel-caption">
	        <h3>Far From Home</h3>
	        <p>유럽으로 놀러간 스파이더맨과 그의 친구들</p>
	      </div>   
	    </div>
	    <div class="carousel-item">
	      <img src="resources/img/city.jpg" alt="홈커밍" class="d-block">
	      <div class="carousel-caption">
	        <h3>Homecoming</h3>
	        <p>스파이더맨이 다시 마블로 돌아온다!!</p>
	      </div>   
	    </div>
	  </div>
	  <a class="carousel-control-prev" href="#demo" data-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	  </a>
	  <a class="carousel-control-next" href="#demo" data-slide="next">
	    <span class="carousel-control-next-icon"></span>
	  </a>
	</div>
<!-- <div class="col-sm-1"></div> -->
</div>
<!-- 가로 캐러셀 끝 -->
<pre>

</pre>
<!-- 멀티 캐러셀1 시작 -->
<div class="container">
  
  <div id="demo1" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators mb-0 pb-0">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner no-padding my-5">
    <div class="carousel-item active">
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="resources/img/spidermanNowayhome.jfif">
        </a>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!</p>

      </div>
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top rounded-bottom" src="resources/img/spidermanFarfromhome.jfif">
        </a>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!</p>

      </div>
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top rounded-bottom" src="resources/img/spidermanHomecoming.jpg">
        </a>
        <p>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!
        </p>
      </div>
    </div>
    <div class="carousel-item">
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="resources/img/ironman1.jpg">
        </a>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!</p>

      </div>
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="resources/img/ironman2.jpg">
        </a>
        <p>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!
        </p>

      </div>
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="resources/img/ironman3.jpg">
        </a>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!</p>

      </div>
    </div>
    <div class="carousel-item">
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="resources/img/spiderman1.jfif">
        </a>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!</p>

      </div>
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="resources/img/spiderman2.jpg">          
        </a>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!</p>
      </div>
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="resources/img/spiderman3.jpg">
        </a>
        <p>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!
        </p>
      </div>
    </div>
    
  </div>
      
      <!-- Left and right controls -->
	  <a class="carousel-control-prev" href="#demo1" data-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	  </a>
	  <a class="carousel-control-next" href="#demo1" data-slide="next">
	    <span class="carousel-control-next-icon"></span>
	  </a>

  </div>
</div>
<pre>

</pre>
<!-- 멀티 캐러셀2 시작 -->
<div class="container">
  
  <div id="demo2" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators mb-0 pb-0">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner no-padding my-5">
    <div class="carousel-item active">
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="resources/img/spidermanNowayhome.jfif">
        </a>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!</p>

      </div>
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top rounded-bottom" src="resources/img/spidermanFarfromhome.jfif">
        </a>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!</p>

      </div>
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top rounded-bottom" src="resources/img/spidermanHomecoming.jpg">
        </a>
        <p>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!
        </p>
      </div>
    </div>
    <div class="carousel-item">
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="resources/img/ironman1.jpg">
        </a>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!</p>

      </div>
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="resources/img/ironman2.jpg">
        </a>
        <p>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!
        </p>

      </div>
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="resources/img/ironman3.jpg">
        </a>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!</p>

      </div>
    </div>
    <div class="carousel-item">
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="resources/img/spiderman1.jfif">
        </a>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!</p>

      </div>
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="resources/img/spiderman2.jpg">          
        </a>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!</p>
      </div>
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="resources/img/spiderman3.jpg">
        </a>
        <p>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!
        </p>
      </div>
    </div>
    
  </div>
      
      <!-- Left and right controls -->
	  <a class="carousel-control-prev" href="#demo2" data-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	  </a>
	  <a class="carousel-control-next" href="#demo2" data-slide="next">
	    <span class="carousel-control-next-icon"></span>
	  </a>

  </div>
</div>
<pre>

</pre>
<!-- 멀티 캐러셀3 시작 -->
<div class="container">
  
  <div id="demo3" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators mb-0 pb-0">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner no-padding my-5">
    <div class="carousel-item active">
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="resources/img/spidermanNowayhome.jfif">
        </a>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!</p>

      </div>
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top rounded-bottom" src="resources/img/spidermanFarfromhome.jfif">
        </a>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!</p>

      </div>
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top rounded-bottom" src="resources/img/spidermanHomecoming.jpg">
        </a>
        <p>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!
        </p>
      </div>
    </div>
    <div class="carousel-item">
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="resources/img/ironman1.jpg">
        </a>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!</p>

      </div>
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="resources/img/ironman2.jpg">
        </a>
        <p>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!
        </p>

      </div>
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="resources/img/ironman3.jpg">
        </a>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!</p>

      </div>
    </div>
    <div class="carousel-item">
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="resources/img/spiderman1.jfif">
        </a>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!</p>

      </div>
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="resources/img/spiderman2.jpg">          
        </a>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!</p>
      </div>
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="resources/img/spiderman3.jpg">
        </a>
        <p>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!
        </p>
      </div>
    </div>
    
  </div>
      
      <!-- Left and right controls -->
	  <a class="carousel-control-prev" href="#demo3" data-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	  </a>
	  <a class="carousel-control-next" href="#demo3" data-slide="next">
	    <span class="carousel-control-next-icon"></span>
	  </a>

  </div>
</div>
<pre>

</pre>
<%@ include file="footer.jsp" %> 
</body>
</html>