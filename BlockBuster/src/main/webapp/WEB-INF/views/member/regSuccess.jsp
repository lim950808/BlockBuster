<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  
  <title>Welcome</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  
  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
		<div class="carousel-item">
            <div class="carousel-background"><img src="" alt=""></div>
            <div class="carousel-container">
              <div class="carousel-content">
                <h2 class="animate__animated animate__fadeInDown">회원가입이 완료되었습니다!</h2>
                <p class="animate__animated animate__fadeInUp">로그인페이지로 이동합니다</p>
                <a href="${pageContext.request.contextPath}/loginView" class="btn-get-started animate__animated animate__fadeInUp scrollto">시작하기</a>
              </div>
            </div>
          </div>
          
          <section id="hero">
    <div class="hero-container">
      <div id="heroCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="5000">

        <div class="carousel-inner" role="listbox">
     
          <!-- Slide 1 -->
          <div class="carousel-item active">
            <div class="carousel-background"><img src="" alt=""></div>
            <div class="carousel-container">
              <div class="carousel-content">
                <h2 class="animate__animated animate__fadeInDown">회원가입이 완료되었습니다!</h2>
                <p class="animate__animated animate__fadeInUp">로그인페이지로 이동합니다</p>
                <a href="${pageContext.request.contextPath}/loginView" class="btn-get-started animate__animated animate__fadeInUp scrollto">이동하기</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section><!-- End Hero -->
  
  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>

<%--
<h1 align="center">회원가입이 완료되었습니다!</h1>
<h3 align="center">잠시후에 로그인페이지로 이동합니다</h3>
<a href="${pageContext.request.contextPath}/member/login">로그인으로</a>
 --%>