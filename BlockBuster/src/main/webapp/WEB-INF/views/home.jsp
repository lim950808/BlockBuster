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
	<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
	<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
	<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
	<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
	<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
	<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
	<meta name="theme-color" content="#7952b3">


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
      	<img src="resources/img/zootopia4.jpg" class="d-block w-100" alt="zootopia">
        <div class="container">
          <div class="carousel-caption text-start">
            <h1><b>Zootopia 주토피아</b></h1>
            <p>교양 있고 세련된 라이프 스타일을 주도하는 도시 주토피아. 이 곳을 단숨에 혼란에 빠트린 연쇄 실종사건이 발생한다!</p>
            <p><a class="btn btn-lg btn-dark" href="/Product/productDetail?pno=147">지금 바로 보러가기</a></p>
          </div>
        </div>
      </div>
      
      <div class="carousel-item">
      	<img src="resources/img/lalaLand2.jpg" class="d-block w-100" alt="lalaLand">
        <div class="container">
          <div class="carousel-caption text-start">
            <h1><b>La La Land 라라랜드</b></h1>
            <p>황홀한 사랑, 순수한 희망, 격렬한 열정…이 곳에서 모든 감정이 폭발한다!</p>
            <p><a class="btn btn-lg btn-warning" href="/Product/productDetail?pno=71">상세보기</a></p>
          </div>
        </div>
      </div>    
      
      <div class="carousel-item">
      	<img src="resources/img/coffee.jpg" class="d-block w-100" alt="reviewBBS">
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


  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->
  
  <div class="container marketing">
<!--
    Three columns of text below the carousel
    <div class="row">
      <div class="col-lg-4">
        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
        <h2>Heading</h2>
        <p>Some representative placeholder content for the three columns of text below the carousel. This is the first column.</p>
        <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
      </div>/.col-lg-4
      <div class="col-lg-4">
        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
        <h2>Heading</h2>
        <p>Another exciting bit of representative placeholder content. This time, we've moved on to the second column.</p>
        <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
      </div>/.col-lg-4
      <div class="col-lg-4">
        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
        <h2>Heading</h2>
        <p>And lastly this, the third column of representative placeholder content.</p>
        <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
      </div>/.col-lg-4
    </div>/.row
 -->
    <!-- START THE FEATURETTES -->

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">Antebellum <span class="text-muted">안테벨룸</span></h2>
        <p class="lead">Successful author Veronica Henley finds herself trapped in a horrifying reality and must uncover the mind-bending mystery before it's too late.</p>
      </div>
      <div class="col-md-5">
        <!-- <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>
 -->	<img src="resources/img/Antebellum.jpg" class="d-block w-100" alt="Antebellum">
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading">The BATMAN <span class="text-muted">2022</span></h2>
        <p class="lead">When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.</p>
      </div>
      <div class="col-md-5 order-md-1">
        <!-- <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>
 -->	<img src="resources/img/thebatman.jpg" class="d-block w-100" alt="thebatman">
      </div>
    </div>
    
    <hr class="featurette-divider">
    
    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">DOCTOR STRANGE 2 <span class="text-muted">In the Multiverse of Madness</span></h2>
        <p class="lead">Dr. Stephen Strange casts a forbidden spell that opens the door to the multiverse, including an alternate version of himself, whose threat to humanity is too great for the combined forces of Strange, Wong, and Wanda Maximoff.</p>
      </div>
      <div class="col-md-5">
        <!-- <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>
 -->	<img src="resources/img/doctorstrange2.jpg" class="d-block w-100" alt="doctorstrange2">
      </div>
    </div>


    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->


  <!-- FOOTER -->
  <%@ include file="footer.jsp" %>
</main>

	<!-- JS Bundle -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      
  </body>
</html>