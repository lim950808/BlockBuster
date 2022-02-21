<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="bootswatch.com/_vendor/font-awesome/css/font-awesome.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">

    <title>Carousel Template · Bootstrap v5.1</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">

    <!-- Bootstrap core CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Favicons -->
	<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
	<link rel="icon" href="${pageContext.request.contextPath}/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
	<link rel="icon" href="${pageContext.request.contextPath}/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
	<link rel="manifest" href="${pageContext.request.contextPath}/docs/5.1/assets/img/favicons/manifest.json">
	<link rel="mask-icon" href="${pageContext.request.contextPath}/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
	<link rel="icon" href="${pageContext.request.contextPath}/docs/5.1/assets/img/favicons/favicon.ico">
	<meta name="theme-color" content="#7952b3">


<!-- ////////////////////////////////////////////////////////////////////// -->

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

<!-- ////////////////////////////////////////////////////////////////////// -->


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }
      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <style>
    	/* GLOBAL STYLES
		-------------------------------------------------- */
		/* Padding below the footer and lighter body text */
		
		/* body {
		  padding-top: 3rem;
		  padding-bottom: 3rem;
		  color: #5a5a5a;
		} */
		body {
		  color: #5a5a5a;
		}
		
		
		/* CUSTOMIZE THE CAROUSEL
		-------------------------------------------------- */
		
		/* Carousel base class */
		.carousel {
		  margin-bottom: 4rem;
		}
		/* Since positioning the image, we need to help out the caption */
		.carousel-caption {
		  bottom: 3rem;
		  z-index: 9;
		}
		
		/* Declare heights because of positioning of img element */
		.carousel-item {
		  height: 32rem;
		}
		.carousel-item > img {
		  position: absolute;
		  top: 0;
		  left: 0;
		  min-width: 100%;
		  height: 32rem;
		}
		.col-md-4 img {
    		width: 350px;
    		height: 480px;
		}
		
		
		/* MARKETING CONTENT
		-------------------------------------------------- */
		
		/* Center align the text within the three columns below the carousel */
		.marketing .col-lg-4 {
		  margin-bottom: 1.5rem;
		  text-align: center;
		}
		.marketing h2 {
		  font-weight: 400;
		}
		/* rtl:begin:ignore */
		.marketing .col-lg-4 p {
		  margin-right: .75rem;
		  margin-left: .75rem;
		}
		/* rtl:end:ignore */
		
		
		/* Featurettes
		------------------------- */
		
		.featurette-divider {
		  margin: 5rem 0; /* Space out the Bootstrap <hr> more */
		}
		
		/* Thin out the marketing headings */
		.featurette-heading {
		  font-weight: 300;
		  line-height: 1;
		  /* rtl:remove */
		  letter-spacing: -.05rem;
		}
		
		
		/* RESPONSIVE CSS
		-------------------------------------------------- */
		
		@media (min-width: 40em) {
		  /* Bump up size of carousel content */
		  .carousel-caption p {
		    margin-bottom: 1.25rem;
		    font-size: 1.25rem;
		    line-height: 1.4;
		  }
		
		  .featurette-heading {
		    font-size: 50px;
		  }
		}
		
		@media (min-width: 62em) {
		  .featurette-heading {
		    margin-top: 7rem;
		  }
		}
    </style>
    
  </head>
  <body>
<main>

  <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    
    <div class="carousel-inner">   
    
      <div class="carousel-item active">
      	<img src="${pageContext.request.contextPath}/resources/img/zootopia4.jpg" class="d-block w-100" alt="zootopia">
        <div class="container">
          <div class="carousel-caption text-start">
            <h1><b>Zootopia 주토피아</b></h1>
            <p>교양 있고 세련된 라이프 스타일을 주도하는 도시 주토피아. 이 곳을 단숨에 혼란에 빠트린 연쇄 실종사건이 발생한다!</p>
            <p><a class="btn btn-lg btn-dark" href="${pageContext.request.contextPath}/Product/productDetail?pno=147">지금 바로 보러가기</a></p>
          </div>
        </div>
      </div>
      
      <div class="carousel-item">
      	<img src="${pageContext.request.contextPath}/resources/img/lalaLand2.jpg" class="d-block w-100" alt="lalaLand">
        <div class="container">
          <div class="carousel-caption text-start">
            <h1><b>La La Land 라라랜드</b></h1>
            <p>황홀한 사랑, 순수한 희망, 격렬한 열정…이 곳에서 모든 감정이 폭발한다!</p>
            <p><a class="btn btn-lg btn-warning" href="${pageContext.request.contextPath}/Product/productDetail?pno=71">상세보기</a></p>
          </div>
        </div>
      </div>
      
      
      <div class="carousel-item">   
      	<img src="${pageContext.request.contextPath}/resources/img/coffee.jpg" class="d-block w-100" alt="reviewBBS">
        <div class="container">
          <div class="carousel-caption text-end">
            <h1><b>당신의 리뷰를 기다립니다.</b></h1>
            <p>언제 어디서든 다른 사람들과 함께 생각을 공유해 보세요.</p>
            <p><a class="btn btn-lg btn-secondary" href="${pageContext.request.contextPath}/reviewList">글 남기러 가기</a></p>
          </div>
        </div>
      </div>
      
    </div>
    
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
    
  </div>

<!-- ////////////////////////////////////////////////////////////////////// -->

 


<!-- ////////////////////////////////////////////////////////////////////// -->

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

<h1><b>인기 영화</b></h1>

  <!-- The slideshow -->
  <div class="carousel-inner no-padding my-5">
  
    <div class="carousel-item active">
    
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=1}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="https://img.pooq.co.kr/movieImg/MV_C901/2/MV_C901_SG0000071422_w720_h1038_q75.jpg">
        </a>
        <p>검은 사제들</p>
      </div>
      
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=2}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top rounded-bottom" src="https://img.wavve.com/movieImg/MV_CG01/5/MV_CG01_NU0000011735_w720_h1038_q75.jpg">
        </a>
        <p>처키의 저주</p>
      </div>
      
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=3}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top rounded-bottom" src="https://img.pooq.co.kr/movieImg/MV_CU01/5/MV_CU01_DL0000011785_w720_h1038_q75.jpg">
        </a>
        <p> 최후의 소녀</p>
      </div>
      
    </div>
    
    <div class="carousel-item">
    
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=4}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="https://img.pooq.co.kr/movieImg/MV_LX01/5/MV_LX01_LX0000000115_w720_h1038_q75.jpg">
        </a>
        <p>알이씨4 아포칼립스</p>
      </div>
      
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=5}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="https://img.pooq.co.kr/movieImg/MV_CD01/2/MV_CD01_WR0000011162_w720_h1038_q75.jpg">
        </a>
        <p>컨저링</p>
      </div>
      
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=6}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="https://img.pooq.co.kr/movieImg/MV_CL01/7/MV_CL01_JY0000011257_w720_h1038_q75.jpg">
        </a>
        <p>쏘우 여섯번의 기회</p>
      </div>
      
    </div>
    <div class="carousel-item">
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=7}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="https://img.pooq.co.kr/movieImg/MV_CD01/3/MV_CD01_WR0000011123_w720_h1038_q75.jpg">
        </a>
        <p>애나벨</p>
      </div>
      
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=8}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="https://img.pooq.co.kr/movieImg/MV_C901/1/MV_C901_SG0000096831_w720_h1038_q75.jpg">          
        </a>
        <p>직쏘</p>
      </div>
      
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=9}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="https://img.pooq.co.kr/movieImg/MV_SB01/0/MV_SB01_SB0000000030_w720_h1038_q75.jpg">
        </a>
        <p>미확인 동영상 절대클릭금지</p>
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

<h1><b>Disney 애니메이션</b></h1>

  <!-- The slideshow -->
  <div class="carousel-inner no-padding my-5">
  
    <div class="carousel-item active">
    
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=145}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="http://t1.daumcdn.net/movie/dea0547d5c007fc4cc5b4bea13d048ea68000f30">
        </a>
        <p>피노키오</p>
      </div>
      
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=146}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top rounded-bottom" src="http://t1.daumcdn.net/cfile/133B31424D2FF99302">
        </a>
        <p>라푼젤</p>
      </div>
      
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=147}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top rounded-bottom" src="http://t1.daumcdn.net/movie/d0fb689037e15d26e4332bf931f5eca8e7f5cdd1">
        </a>
        <p> 주토피아</p>
      </div>
      
    </div>
    
    <div class="carousel-item">
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=148}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="http://t1.daumcdn.net/cfile/1746084A4EFAC49517">
        </a>
        <p>라이온 킹</p>
      </div>
      
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=149}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="http://t1.daumcdn.net/cfile/2646D04D52C520292C">
        </a>
        <p>겨울왕국</p>
      </div>
      
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=150}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="http://t1.daumcdn.net/cfile/11110210A8887F0B90">
        </a>
        <p>인어공주</p>
      </div>
      
    </div>
    
    <div class="carousel-item">
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=151}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="http://t1.daumcdn.net/cfile/126F9810B280BEF8B7">
        </a>
        <p>신데렐라</p>
      </div>
      
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=152}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="http://t1.daumcdn.net/movie/f4ab4be2992394bcde40c115958072d22eb24687">          
        </a>
        <p>모아나</p>
      </div>
      
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=153}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="http://t1.daumcdn.net/cfile/13178F314C9629CF1E">
        </a>
        <p>알라딘</p>
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

<h1><b>인기 예능</b></h1>

  <!-- The slideshow -->
  <div class="carousel-inner no-padding my-5">
  
    <div class="carousel-item active">
    
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=105}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="https://w.namu.la/s/6e021684c991de699bbf821449a5820d1f024aea64367be1fa59fc1f488dc43b397a1e13992f29d1e852ff5200a76dbe04ed80e764a128bc6405c5082cfd9b0a6945662bafd6bf403f0f7803baf88ab3">
        </a>
        <p>1박2일 시즌4</p>
      </div>
      
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=106}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top rounded-bottom" src="https://img.hankyung.com/photo/202101/BF.24993528.1.jpg">
        </a>
        <p>유희열의 스케치북</p>
      </div>
      
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=107}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top rounded-bottom" src="https://img0.yna.co.kr/etc/inner/KR/2019/09/24/AKR20190924041800005_01_i_P4.jpg">
        </a>
        <p>대국민 토크쇼 안녕하세요</p>
      </div>
      
    </div>
    
    <div class="carousel-item">
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=108}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="https://image.yes24.com/goods/59702396/XL">
        </a>
        <p>배틀트립</p>
      </div>
      
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=109}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="https://w.namu.la/s/82d3ea2a55a205e5e98e9bf89d0217455d7d5d369bb616e731394cd7b544e4c065e7043e4b810df35976d3b95dbd5da99e8b0e19f65d9fc420003b466f1807b50d95b8f095816b26a837c615f96081d6">
        </a>
        <p>펀스토랑</p>
      </div>
      
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=110}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="https://cdnweb01.wikitree.co.kr/webdata/editor/202009/28/img_20200928213713_4a57d90b.webp">
        </a>
        <p>런닝맨</p>
      </div>
      
    </div>
    
    <div class="carousel-item">
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=111}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="https://www.metalkingdom.net/board/data/Free_Reviews/202010112146r16335n1.jpg">
        </a>
        <p>미운우리새끼</p>
      </div>
      
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=112}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="https://img.hankyung.com/photo/202112/BF.28455903.1.jpg">          
        </a>
        <p>골목식당</p>
      </div>
      
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="${pageContext.request.contextPath}/Product/productDetail?pno=${pno=113}" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="http://file.instiz.net/data/file/20130625/0/9/9/0991a3963b2d77adc003616f7abf74ec">
        </a>
        <p>스타킹</p>
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

<!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->
  
  <div class="container marketing">
  
    <!-- START THE FEATURETTES -->
    
    <h1><b>새로운 신작</b></h1>
    
    <pre>
    
    </pre>
    
    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading">The BATMAN <span class="text-muted">2022</span></h2>
        <p class="lead">When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.</p>
      </div>
      <div class="col-md-5 order-md-1">	
      	<img src="${pageContext.request.contextPath}/resources/img/thebatman.jpg" class="d-block w-100" alt="thebatman">
      </div>
    </div>
    
    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">Antebellum <span class="text-muted">안테벨룸</span></h2>
        <p class="lead">Successful author Veronica Henley finds herself trapped in a horrifying reality and must uncover the mind-bending mystery before it's too late.</p>
      </div>
      <div class="col-md-5">
      	<img src="${pageContext.request.contextPath}/resources/img/Antebellum.jpg" class="d-block w-100" alt="Antebellum">
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading">DOCTOR STRANGE <span class="text-muted">In the Multiverse of Madness</span></h2>
        <p class="lead">Dr. Stephen Strange casts a forbidden spell that opens the door to the multiverse, including an alternate version of himself, whose threat to humanity is too great for the combined forces of Strange, Wong, and Wanda Maximoff.</p>
      </div>
      <div class="col-md-5 order-md-1">	
      	<img src="${pageContext.request.contextPath}/resources/img/doctorstrange2.jpg" class="d-block w-100" alt="doctorstrange">
      </div>
    </div>

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->

<pre>

</pre>

<%@ include file="footer.jsp" %>

  </div><!-- /.container -->

</main>

	<!-- JS Bundle -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      
  </body>
</html>