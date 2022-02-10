<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../header1.jsp" %>
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
 aside#aside li a { color:#000; display:block; padding:10px 0; }
 aside#aside li a:hover { text-decoration:none; background:#eee; }
 
 footer#footer { margin-top:100px; border-radius:50px 50px 0 0; }
 footer#footer div#footer_box { padding:0 20px; }
 
</style>

<style>
 section#content ul li { display:inline-block; margin:10px; }
 section#content div.p_img img { width:200px; height:300px; }
 section#content div.title { padding:10px 0; text-align:center; }
 section#content div.title a { color:#000; }
</style>

</head>
<script>
function RecommendTitleWords(){
	$('#searchingist2').remove();
	var str="";
	var str2="";
	var categoryNo = $('#category').val(); 
	$.ajax({
				url : "${pageContext.request.contextPath}/rcmdTitleWords",
				data:{category:categoryNo},
				dataType:'json',
				success:function(data){
					str += "<datalist id='searchingist2'>"
					$(data).each( 
							function(){
								str2 = "<option value='"+this.title+"'/><option value='"+this.casting+"'/><option value='"+this.cat_name+"'/><option value='"+this.gen_name+"'/><option value='"+this.year+"'/><option value='"+this.country+"'/><option value='"+this.director+"'/>";
								str += str2;
								}
					);
					str += "</datalist>";
					$('#words2').append(str);
				}
			}
		);
	return true;
}
</script>
<body>
<div id="root">
	
	<section id="container">
		<div id="container_box">
		
			<section id="content">
				<ul>
 					<c:forEach items="${list}" var="product">
	 					<li>
	  						<div class="p_img">
	   							<a href="/Product/productDetail?pno=${product.pno}">
	   								<img src="${product.p_img}">
	   							</a>
	  						</div> 
	  						<div class="title">
	   							<a href="/Product/productDetail?pno=${product.pno}">
	   								${product.title}
	   							</a>
	  						</div>
	 					</li>
 					</c:forEach>
				</ul>
			</section>
			
			<aside id="aside">
				<%@ include file="../aside.jsp" %>
			</aside>
			
			<%-- <form>
          		<input class="form-control" type="hidden" value="${product.pno }" placeholder="Search" aria-label="Search">
          		<button type="submit"><i class="fa fa-search"></i></button>
      		</form> --%>
      		<form name="form" class="example" id="search" action="${pageContext.request.contextPath}/HTGetPdtSearchResult" onfocus="RecommendTitleWords()" method="post" style="margin:20px; max-width:200px">
         		<input type="text" placeholder="제목을 입력 하세요" name="keyword" id="words2" list="searchingist2">
         		<input type="hidden" id="category">
         		<button type="submit"><i class="fa fa-search"></i></button>
      		</form>
      		
		</div>
	</section>
</div>
</body>
<%@ include file="../footer.jsp" %>
</html>