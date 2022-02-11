<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
aside#aside li { position:relative; }
aside#aside li:hover { background:#eee; }   
aside#aside li > ul.low { display:none; position:absolute; top:0; left:180px;  }
aside#aside li:hover > ul.low { display:block; }
aside#aside li:hover > ul.low li a { background:#eee; border:1px solid #eee; }
aside#aside li:hover > ul.low li a:hover { background:#fff;}
aside#aside li > ul.low li { width:180px; }
</style>
<h3>카테고리</h3>

<ul>
	<li><a href="${pageContext.request.contextPath}/CategoryList?c=1000">영화</a>
		<ul class="low">
			<!-- <li><a href="/Product/products?category=1000&genre=1100">공포</a></li>
			<li><a href="/Product/products?category=1000&genre=1200">액션</a></li>
			<li><a href="/Product/products?category=1000&genre=1300">범죄/스릴러</a></li>
			<li><a href="/Product/products?category=1000&genre=1400">전쟁</a></li>
			<li><a href="/Product/products?category=1000&genre=1500">판타지/SF</a></li>
			<li><a href="/Product/products?category=1000&genre=1600">코미디</a></li>
			<li><a href="/Product/products?category=1000&genre=1700">멜로/로멘스</a></li> -->
			<li><a href="/Product/list?g=1100&l=2">공포</a></li>
			<li><a href="/Product/list?g=1200&l=2">액션</a></li>
			<li><a href="/Product/list?g=1300&l=2">범죄/스릴러</a></li>
			<li><a href="/Product/list?g=1400&l=2">전쟁</a></li>
			<li><a href="/Product/list?g=1500&l=2">판타지/SF</a></li>
			<li><a href="/Product/list?g=1600&l=2">코미디</a></li>
			<li><a href="/Product/list?g=1700&l=2">멜로/로멘스</a></li>
		</ul>
	</li>
	<li><a href="${pageContext.request.contextPath}/CategoryList?c=2000">드라마</a>
		<ul class="low">
			<!-- <li><a href="/Product/products?category=2000&genre=2100">한드</a></li>
			<li><a href="/Product/products?category=2000&genre=2200">미드</a></li>
			<li><a href="/Product/products?category=2000&genre=2300">일드</a></li> -->
			<li><a href="/Product/list?g=2100&l=2">미드</a></li>
			<li><a href="/Product/list?g=2200&l=2">일드</a></li>
			<li><a href="/Product/list?g=2300&l=2">한드</a></li>
		</ul>
	</li>
	<li><a href="${pageContext.request.contextPath}/CategoryList?c=3000">예능</a>
		<ul class="low">
			<!-- <li><a href="/Product/products?category=3000&genre=3100">KBS</a></li>
			<li><a href="/Product/products?category=3000&genre=3200">MBC</a></li>
			<li><a href="/Product/products?category=3000&genre=3300">SBS</a></li>
			<li><a href="/Product/products?category=3000&genre=3400">TVN</a></li>
			<li><a href="/Product/products?category=3000&genre=3500">JTBC</a></li> -->
			<li><a href="/Product/list?g=3100&l=2">KBS</a></li>
			<li><a href="/Product/list?g=3200&l=2">SBS</a></li>
			<li><a href="/Product/list?g=3300&l=2">MBC</a></li>
			<li><a href="/Product/list?g=3400&l=2">TVN</a></li>
			<li><a href="/Product/list?g=3500&l=2">JTBC</a></li>
		</ul>
	</li>
	<li><a href="${pageContext.request.contextPath}/CategoryList?c=4000">다큐</a>
		<ul class="low">
			<!-- <li><a href="/Product/products?category=4000&genre=4100">히스토리</a></li>
			<li><a href="/Product/products?category=4000&genre=4200">디스커버리</a></li>
			<li><a href="/Product/products?category=4000&genre=4300">내셔널지오그래픽</a></li> -->
			<li><a href="/Product/list?g=4100&l=2">히스토리</a></li>
			<li><a href="/Product/list?g=4200&l=2">디스커버리</a></li>
			<li><a href="/Product/list?g=4300&l=2">내셔널 지오그래픽</a></li>
		</ul>
	</li>
	<li><a href="${pageContext.request.contextPath}/CategoryList?c=5000">애니</a>
		<ul class="low">
			<!-- <li><a href="/Product/products?category=5000&genre=5100">디즈니</a></li>
			<li><a href="/Product/products?category=5000&genre=5200">지브리</a></li> -->
			<li><a href="/Product/list?g=5100&l=2">디즈니</a></li>
			<li><a href="/Product/list?g=5200&l=2">지브리</a></li>
		</ul>
	</li>
</ul>