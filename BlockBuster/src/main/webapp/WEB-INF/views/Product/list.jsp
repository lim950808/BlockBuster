<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>

<!-- 검색창 -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> <!-- searchbox -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<meta charset="UTF-8">
<title>Insert title here</title>
<style>

 body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
 a { color:#05f; text-decoration:none; }
 a:hover { text-decoration:underline; }
 
 h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
 ul, lo, li { margin:0; padding:0; list-style:none; }

 /* ---------- */
 
 div#root { width:900px; margin:0 auto; }
 header#header { }
 nav#nav { }
 section#container { }
  section#content { float:right; width:700px; }
  aside#aside { float:left; width:180px; }
  section#container::after { content:""; display:block; clear:both; } 
 footer#footer { background:#eee; padding:20px; }
 
 /* ---------- */
 
 header#header div#header_box { text-align:center; padding:30px 0; }
 header#header div#header_box h1 { font-size:50px; }
 header#header div#header_box h1 a { color:#000; }
 
 nav#nav div#nav_box { font-size:14px; padding:10px; text-align:right; }
 nav#nav div#nav_box li { display:inline-block; margin:0 10px; }
 nav#nav div#nav_box li a { color:#333; }
 
 section#container { }
 
 aside#aside h3 { font-size:22px; margin-bottom:20px; text-align:center; }
 aside#aside li { font-size:16px; text-align:center; }
 aside#aside li a { color:white; display:block; padding:10px 0; }
 aside#aside li a:hover { text-decoration:none; background:#ff7f00; }
 
 footer#footer { margin-top:100px; border-radius:50px 50px 0 0; }
 footer#footer div#footer_box { padding:0 20px; }
 
</style>

<style>
 section#content ul li { display:inline-block; margin:10px; width:200px; height:300px; }
 section#content div.p_img img { width:200px; height:300px; }
 section#content div.title { padding:10px 0; text-align:center; }
 section#content div.title a { color:white; }
</style>

<!-- hover 시작. -->
<style>
#pic{
		width: 200px;
		height: 300px;
	}
	#titleHeader{
		background: rgba(0, 0, 0, 0.4); /* 0.5  */
		color:#ff7f00;
		font-size:23px;
		width: 100%;
	}
	#keywd{color:#ff7f00;}
	
	 th, td, P {color: #f5f5f5;}
	 
     #poster{
     	display:inline-block; 
     	margin:10px;
     }
     
     img {
	  vertical-align: top;
	}
	.postpic{
	  display:inline-block;
	  position: relative;
	}
	.postpic:hover:after,
	.postpic:hover > .hover_text,
	.postpic:hover:after,
	.postpic:hover > .hover_text
	{
	  display:block;
	}
	.postpic:after,.hover_text{
	  display:none;
	}
	.postpic:after{
	  content:'';
	  position: absolute;
	  top: 0;
	  right: 0;
	  bottom: 0;
	  left: 0;
	  background: rgba(0, 0, 0, 0.7);
	  z-index: 10;
	}
	.postpic {
	  overflow: hidden;
	}
	.postpic:hover img{
	transform: scale(1.2);
	  transition: 0.7s;
	}
	.hover_text {
 	  position: absolute;
	  top: 180px;
	  left: 5px;
	  color: #ff7f00;
	  z-index: 20;
	  font-weight: 600;
	  font-size: 20px;
	}
</style>
<!-- hover 끝. -->

</head>
<script>
function RecommendTitleWords(){
	$('#searchingist2').remove();
	var str="";
	var str2="";
	var categoryNo = $('#category').val(); 
	$('#sCategory').val(categoryNo);
	$.ajax({
				url : "${pageContext.request.contextPath}/rcmdTitleWords",
				data:{category:categoryNo},
				dataType:'json',
				success:function(data){
					str += "<datalist id='searchingist2'>"
					$(data).each( 
							function(){
								if(this.title != null){
									str2 = str2 + "<option value='"+this.title+"'/>";
								}
								if(this.casting != null){
									str2 = str2 + "<option value='"+this.casting+"'/>";
								}
								if(this.cat_name != null){
									str2 = str2 + "<option value='"+this.cat_name+"'/>";
								}
								if(this.gen_name != null){
									str2 = str2 + "<option value='"+this.gen_name+"'/>";
								}
								if(this.year != 0){
									str2 = str2 + "<option value='"+this.year+"'/>";
								}
								if(this.country != null){
									str2 = str2 + "<option value='"+this.country+"'/>";
								}
								if(this.director != null){
									str2 = str2 + "<option value='"+this.director+"'/>";
								}
									str += str2;
									str2 = "";
								}
					);
					str += "</datalist>";
					$('#words').append(str);
				}
			}
		);
}
</script>

<body>
<pre>

</pre>
<div id="root">
	<section id="container">
		<div id="container_box">
			<!-- 해당 카테고리 내에서만 제목으로 검색 -->
			<c:set var="s" value="${s}"/><!-- genre말고 category에서만 검색창이 나타남 -->
	      		<c:choose>
	      			<c:when test="${not empty s}"> <!-- segment -->
	         			<form class="exampleJE" action="${pageContext.request.contextPath}/HTGetPdtSearchResult">
		            		<input type="hidden" id="sCategory" name="category"> 
		         			<input type="text" name="keyword" id="words" list="searchingist2" onfocus="RecommendTitleWords()" placeholder="제목을 입력하세요.">
		         			<button type="submit"><i class="fa fa-search"></i></button>
	      				</form>   
	      			</c:when>
	      		</c:choose>
	      	<pre>
	      	
	      	</pre>
			<section id="content">	
				<ul>
 					<c:forEach items="${list}" var="product">
	 					<li>
	  						<%-- <div class="p_img">
								<input type="hidden" id="category" value="${product.category}">
	   							<a href="${pageContext.request.contextPath}/Product/productDetail?pno=${product.pno}">
	   								<img src="${product.p_img}">
	   							</a>
	  						</div> 
	  						<div class="title">
	   							<a href="${pageContext.request.contextPath}/Product/productDetail?pno=${product.pno}">
	   								${product.title}
	   							</a>
	  						</div> --%>
	  						<!-- hover 시작. -->
	  						<div id="poster">
	  							<input type="hidden" id="category" value="${product.category}">
	   							<a href="${pageContext.request.contextPath}/Product/productDetail?pno=${product.pno}" class="postpic">
	   								<img id="pic" src="${product.p_img}" class="img-responsive img-rounded" onerror="this.src='${pageContext.request.contextPath}/resources/img/logo2.png'"><p class="hover_text"><b>${product.title}</b></p>
	   							</a>
	  						</div>
	  						<!-- hover 끝. -->
	 					</li>
 					</c:forEach>
				</ul>
			</section>
			<aside id="aside">
				<%@ include file="../aside.jsp" %>
			</aside>
		</div>
	</section>
<pre>

</pre>
<%@ include file="../footer.jsp" %>
</div>
</body>
</html>